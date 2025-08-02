import { Component } from '@angular/core';
import { getId } from 'src/app/functions';
import { Asset } from 'src/models/Asset';
import { ILocation, OTHER_TYPES, OtherInfo } from 'src/models/other-info.model';
import { Requisition } from 'src/models/Requisition';
import { PAGES } from 'src/models/Schema';
import { initTransaction } from 'src/models/Transaction';
import { AssetService } from 'src/services/AssetService';
import { CsvService } from 'src/services/CsvService';
import { OtherInfoService } from 'src/services/other-info.service';
import { RequisitionService } from 'src/services/RequisitionService';
import { TransactionService } from 'src/services/TransactionService';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-requisition-list',
  templateUrl: './requisition-list.component.html',
  styleUrls: ['./requisition-list.component.scss'],
})
export class RequisitionListComponent {
  list: Requisition[] = [];
  allItems: Requisition[] = [];
  selectedRequisition?: Requisition;
  page = PAGES.requisition;
  search = '';
  loading = false;
  confirmStatus?: 'pending' | 'approved' | 'rejected' | 'completed';

  // Filters
  selectedStatus = '';
  statuses: string[] = ['Pending', 'Approved', 'Rejected', 'Completed'];

  selectedType = '';
  types: string[] = ['Stock', 'Purchase'];
  locations: OtherInfo<ILocation>[] = [];

  constructor(
    private requisitionService: RequisitionService,
    private assetService: AssetService,
    private csvService: CsvService,
    private transactionService: TransactionService,
    private userService: UserService,
    private locationService: OtherInfoService<ILocation>
  ) {
    locationService
      .search({ ItemType: OTHER_TYPES.Locations })
      .subscribe((locations) => {
        this.locations = locations || [];
        this.requisitionService.getAll();
        this.getList();
      });
  }
  getSiteName(id: number) {
    const location = this.locations.find((x) => x.Id == id);
    return location ? location.ItemValue.Name : '';
  }
  getList() {
    this.requisitionService.$requisitionList.subscribe((data) => {
      this.loading = false;
      this.list = data || [];
      this.allItems = data || [];
    });
  }

  filterList() {
    let list = this.allItems;

    if (this.selectedStatus) {
      list = list.filter((x) => x.status === this.selectedStatus.toLowerCase());
    }

    if (this.selectedType) {
      list = list.filter((x) => x.type === this.selectedType.toLowerCase());
    }

    this.list = list;
  }

  exportToCsv() {
    this.csvService.exportRequisitionsToCsv(this.getExportName(), this.list);
  }

  getExportName() {
    if (!this.selectedStatus && !this.selectedType)
      return `requisitions_${new Date().toLocaleDateString()}.csv`;

    const filters = [];
    if (this.selectedStatus) filters.push(this.selectedStatus);
    if (this.selectedType) filters.push(this.selectedType);

    return `requisitions_${filters.join('_')}.csv`;
  }

  onStatusChange() {
    this.filterList();
  }

  onTypeChange() {
    this.filterList();
  }

  approveRequisition(requisition: Requisition) {
    if (!confirm('Are you sure you want to approve this requisition?')) return;
    requisition.status = 'approved';
    this.requisitionService
      .updateStatus(Number(requisition.id), requisition.status, 'Manager')
      .subscribe((approvedItem) => {
        if (
          approvedItem &&
          approvedItem.id &&
          approvedItem.items &&
          approvedItem.items.length
        ) {
          this.getList();
          this.assetService
            .getAssetsRange(approvedItem.items.map((x) => x.assetId || 0))
            .subscribe((data) => {
              if (data && data.length) {
                data.forEach((asset) => {
                  const item = approvedItem.items.find(
                    (x) => x.assetId === asset.id
                  );
                  if (item) {
                    this.selectedRequisition = approvedItem;
                    this.adjustStock(asset, Number(item.quantity || '1'));
                    this.addTransaction(
                      asset,
                      Number(item.quantity || '1'),
                      item.roomId
                    );
                  }
                });
              }
            });
        }
      });
  }

  rejectRequisition(requisition: Requisition) {
    if (!confirm('Are you sure you want to reject this requisition?')) return;
    requisition.status = 'rejected';
    this.requisitionService
      .updateStatus(Number(requisition.id), requisition.status, 'Manager')
      .subscribe(() => {
        this.getList();
      });
  }

  showConfirm = false;
  requisitionToDelete?: Requisition;

  onDelete(requisition: Requisition) {
    this.showConfirm = true;
    this.requisitionToDelete = requisition;
  }

  getPdfUrl(id: number) {
    return `https://docs.tybofashion.co.za/generate-requisition-pdf.php?id=${id}`;
  }

  handleConfirm(result: boolean): void {
    if (result && this.requisitionToDelete) {
      this.requisitionService.remove(Number(this.requisitionToDelete.id));
    }
    this.showConfirm = false;
    this.requisitionToDelete = undefined;
  }

  adjustStock(assert: Asset, quantity: number) {
    const items = this.isUsage ? -quantity : quantity;
    this.assetService.adjustStock(assert.id, items).subscribe((data) => {
      if (data && data.id) {
        if (!assert.stockInHand) assert.stockInHand = 0;
        assert.stockInHand = Number(assert.stockInHand);
        assert.stockInHand += items;
      }
    });
  }
  addTransaction(assert: Asset, quantity: number, roomId?: number) {
    const transaction = initTransaction();
    transaction.assetId = assert.id;
    transaction.quantity = quantity;
    //'restock' or 'usage'
    transaction.transactionType = this.isUsage ? 'usage' : 'restock';
    transaction.status = 'Completed';
    transaction.slug = getId('transaction');
    transaction.createdBy = this.userService.getUser?.UserId || '';
    transaction.metadata.roomId = roomId || 0;
    transaction.metadata.comments = [
      {
        comment: `Requisition ${this.selectedRequisition?.id} - ${this.selectedRequisition?.type}`,
        createdBy: 'System',
        createdDate: new Date().toISOString(),
      },
    ];
    this.transactionService.add(transaction).subscribe();
  }
  get isUsage() {
    // 'stock' | 'purchase'
    return this.selectedRequisition?.type === 'stock';
  }
}
