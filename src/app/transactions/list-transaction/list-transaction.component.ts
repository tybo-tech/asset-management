import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import { TOAST, toast } from 'src/app/functions';
import { Asset } from 'src/models/Asset';
import { PAGES } from 'src/models/Schema';
import {
  ITransactionFilter,
  Transaction,
  TransactionDetail,
} from 'src/models/Transaction';
import { DataService } from 'src/services/DataService';
import { TransactionService } from 'src/services/TransactionService';
import { CsvService } from 'src/services/CsvService';
import { ILocation, OTHER_TYPES, OtherInfo } from 'src/models/other-info.model';
import { OtherInfoService } from 'src/services/other-info.service';

@Component({
  selector: 'app-list-transaction',
  templateUrl: './list-transaction.component.html',
  styleUrls: ['./list-transaction.component.scss'],
})
export class ListTransactionComponent {
  selectedAsset?: Asset;
  selectedTransaction?: Transaction;
  loading = false;
  list: TransactionDetail[] = [];
  allTransactions: TransactionDetail[] = [];
  page = PAGES.transaction;
  search = '';
  startDate: any;
  endDate: any;
  transactionType: 'restock' | 'usage' = 'restock';
  filters?: ITransactionFilter;
  rooms: OtherInfo<ILocation>[] = [];

  constructor(
    private dataService: TransactionService,
    private route: ActivatedRoute,
    private roomService: OtherInfoService<ILocation>,

    private csvService: CsvService
  ) {
    this.route.params.subscribe((params) => {
      this.transactionType = params['type'];
      this.getAll();
    });
  }
  getAll() {
    this.loading = true;
    this.dataService.detailed(this.transactionType).subscribe((data) => {
      this.loading = false;
      this.list = data || [];
      this.allTransactions = data || [];
      this.getRooms();
    });
  }
  getRooms() {
    this.roomService
      .search({ ItemType: OTHER_TYPES.Locations })
      .subscribe((data) => {
        this.rooms = data || [];
      });
  }
  getSiteName(id: number) {
    if (!id) return '';
    const location = this.rooms.find((x) => x.Id == id);
    return location ? location.ItemValue.Name : '';
  }
  onSelection(transaction: TransactionDetail) {
    this.loading = true;
    this.dataService.getById(transaction.transactionId).subscribe((data) => {
      this.loading = false;
      if (data && data.asset) {
        this.selectedTransaction = data;
        if (!this.selectedTransaction.metadata) {
          this.selectedTransaction.metadata = {
            reasonCode: '',
            requestedBy: '',
            room: '',
            roomId: 0,
            requestedById: 0,
            comments: [],
          };
        }
        this.selectedAsset = data.asset;
      } else {
        toast(
          'Transaction not found, Or the there connection error, Try again',
          TOAST.error
        );
      }
    });
  }
  onFiltersApplied(filters: ITransactionFilter) {
    this.list = this.allTransactions;
    this.filters = filters;
    this.list = this.list.filter((transaction) => {
      const matchesDate =
        (!filters.startDate ||
          new Date(transaction.transactionDate) >=
            new Date(filters.startDate)) &&
        (!filters.endDate ||
          new Date(transaction.transactionDate) <=
            new Date(filters.endDate + 'T23:59:59'));
      const matchesCategory =
        !filters.category || transaction.categoryName === filters.category;
      const matchesLocation =
        !filters.location || transaction.metadata.room === filters.location;
      const matchesStatus =
        !filters.status ||
        transaction.status.toLowerCase() === filters.status.toLowerCase();

      return matchesDate && matchesCategory && matchesLocation && matchesStatus;
    });
  }
  exportToCsv() {
    if (!this.list || !this.list.length) {
      toast('No transactions to export', TOAST.error);
      return;
    }
    const list = this.list.map((transaction) => {
      return {
        ...transaction,
        metadata: {
          ...transaction.metadata,
          room:
            this.getSiteName(transaction.metadata.roomId || 0) ||
            'Not assigned',
        },
      };
    });
    this.csvService.exportTransactionsToCsv(this.getExportName(), list);
  }
  getExportName() {
    if (!this.filters)
      return `${this.transactionType}_${new Date().toLocaleDateString()}.csv`;
    // Generate a filename based on the filters
    const filters = [];
    if (this.filters.startDate) filters.push(this.filters.startDate);
    if (this.filters.endDate) filters.push(this.filters.endDate);
    if (this.filters.category) filters.push(this.filters.category);
    if (this.filters.location) filters.push(this.filters.location);
    if (this.filters.status) filters.push(this.filters.status);
    const prefix = this.isUsage ? 'Issue_Out' : 'Restock';
    return `${prefix}_${filters.join('_')}.csv`;
  }
  get isUsage() {
    return this.transactionType === 'usage';
  }

  get isRestock() {
    return this.transactionType === 'restock';
  }
}
