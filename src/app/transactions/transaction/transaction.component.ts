import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { getId, TOAST, toast } from 'src/app/functions';
import {
  ASSET_CONDITIONS,
  REASON_CODES,
  Transaction,
  TransactionType,
} from 'src/models/Transaction';
import { PAGES } from 'src/models/Schema';
import { Asset, ASSET_STATUS } from 'src/models/Asset';
import { TransactionService } from 'src/services/TransactionService';
import {
  OtherInfo,
  ITenant,
  OTHER_TYPES,
  IRoom,
  ISupplier,
  ILocation,
} from 'src/models/other-info.model';
import { OtherInfoService } from 'src/services/other-info.service';
import { AssetService } from 'src/services/AssetService';
import { UserService } from 'src/services/user.service';
import { User } from 'src/models/user.model';
import { Router } from '@angular/router';

@Component({
  selector: 'app-transaction',
  templateUrl: './transaction.component.html',
  styleUrls: ['./transaction.component.scss'],
})
export class TransactionComponent implements OnInit {
  @Input({ required: true }) assert!: Asset;
  @Input({ required: true }) data!: Transaction;
  @Input({ required: true }) itemId!: string;
  @Input({ required: true }) isAdd!: boolean;
  @Input({ required: true }) transactionType!: TransactionType;
  @Output() onClose = new EventEmitter<Asset>();
  statuses = ASSET_STATUS
  page = PAGES.transaction;
  rooms: OtherInfo<ILocation>[] = [];
  suppliers: OtherInfo<ISupplier>[] = [];
  conditions = ASSET_CONDITIONS;
  user?: User;
  loading: boolean = false;
  constructor(
    private transactionService: TransactionService,
    private roomService: OtherInfoService<ILocation>,
    private supplierService: OtherInfoService<ISupplier>,
    private assetService: AssetService,
    private userService: UserService,
    private router: Router
  ) {
    userService.userObservable?.subscribe((user) => {
      if (user) this.user = user;
      else {
        toast('You are not logged in', TOAST.warn);
        this.router.navigateByUrl('/');
      }
    });
  }
  ngOnInit(): void {
    this.getRooms();
    this.isRestock && this.getSupppliers();
  }
  getRooms() {
    this.roomService
      .search({ ItemType: OTHER_TYPES.Locations })
      .subscribe((data) => {
        this.rooms = data || [];
      });
  }

  getSupppliers() {
    this.supplierService
      .search({ ItemType: OTHER_TYPES.Suppliers })
      .subscribe((data) => {
        this.suppliers = data || [];
      });
  }
  save(close = true) {
    if(this.loading) return;
    if (!this.data) return;
    this.data.transactionType = this.transactionType;
    this.data.$stockItemId = this.assert.id;
    if (!this.isValid()) return;

    // this.dataService.setBaseUrl(this.page.id);
    if (this.isAdd) this.doAdd(this.data);
    else this.doUpdate(this.data, close);
  }

  doAdd(transactionPayload: Transaction) {
    transactionPayload.slug = getId('transaction');
    transactionPayload.createdBy = this.user?.UserId || '';
    transactionPayload.status = 'Completed';
    this.loading = true;
    this.transactionService.add(transactionPayload).subscribe((data) => {
      this.loading = false;
      if (data && data.createdDate) {
        toast('Transaction added', TOAST.success);
        // Only adjust stock if transaction is successful
        this.adjustStock();
      } else {
        toast('Failed to add transaction', TOAST.error);
      }
    });
  }

  doUpdate(transactionPayload: Transaction, close: boolean) {
    this.loading = true;
    this.transactionService.getById(transactionPayload.id).subscribe((data) => {
      if (data && data.createdDate) {
        data.status = transactionPayload.status;
        data.metadata = transactionPayload.metadata;
        this.transactionService.update(data).subscribe((data) => {
          this.loading = false;
          if (data && data.createdDate) {
            toast('Transaction updated', TOAST.success);
            close && this.onClose.emit();
          } else {
            toast('Failed to update transaction', TOAST.error);
          }
        });
      }
    });
  }

  isValid(): boolean {
    if (!this.data) return false;
    if (!this.data.quantity) {
      toast('Quantity is required', TOAST.warn);
      return false;
    }

    if (this.data.quantity < 1) {
      toast('Quantity must be greater than 0', TOAST.warn);
      return false;
    }

    if (!this.data.metadata.reasonCode) {
      toast('Reason Code is required', TOAST.warn);
      return false;
    }
    // Validate Quantity against stock in hand
    if (!this.assert.stockInHand) {
      this.assert.stockInHand = 0;
    }
    if (this.isUsage && this.data.quantity > this.assert.stockInHand) {
      const message = `Quantity exceeds stock in hand (Only ${this.assert.stockInHand} units available)`;
      toast(message, TOAST.error);
      return false;
    }
    return true;
  }
  adjustStock() {
    if (!this.data || !this.data.quantity) return;
    const items = this.isUsage ? -this.data.quantity : this.data.quantity;
    this.assetService.adjustStock(this.assert.id, items).subscribe((data) => {
      if (data && data.stockInHand) {
        if (!this.assert.stockInHand) this.assert.stockInHand = 0;
        this.assert.stockInHand = Number(this.assert.stockInHand);
        this.assert.stockInHand += items;
        this.onClose.emit(data);
      }
    });
  }
  onRoomChange() {
    const room = this.rooms.find(
      (r) => r.Id === Number(this.data.metadata.roomId)
    );
    if (!room) return;
    this.data.metadata.room = room.ItemValue.Name;
    if(this.data.id){
      this.save(false);
    }
  }

  onSupplierChange() {
    const supplier = this.suppliers.find(
      (r) => r.Id === Number(this.data.metadata.supplierId)
    );
    if (!supplier) return;
    this.data.metadata.supplierName = supplier.Name;

    if(this.data.id) {
      this.save(false);
    }
  }

  get typeDesription() {
    if (this.isRestock) return 'Receive Stock';
    if (this.isUsage) return 'Issue Out';
    if (this.transactionType === 'damaged') return 'Damaged Stock';
    return '';
  }

  get reasons() {
    if (this.isRestock) return REASON_CODES.Receiving;
    if (this.isUsage) return REASON_CODES.IssuingOut;
    return [];
  }

  get isRestock() {
    return this.transactionType === 'restock';
  }

  get isUsage() {
    return this.transactionType === 'usage';
  }
}
