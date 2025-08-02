import { Component, EventEmitter, Input, Output } from '@angular/core';
import { toast, TOAST } from 'src/app/functions';
import { Asset } from 'src/models/Asset';
import { Transaction, TransactionDetail } from 'src/models/Transaction';
import { AssetService } from 'src/services/AssetService';
import { TransactionService } from 'src/services/TransactionService';

@Component({
  selector: 'app-asset-transactions',
  templateUrl: './asset-transactions.component.html',
  styleUrls: ['./asset-transactions.component.scss'],
})
export class AssetTransactionsComponent {
  @Input() assetId = 0;
  @Input({ required: true }) list!: Transaction[];
  @Output() refreshAsset = new EventEmitter();
  loading: boolean = false;
  selectedTransaction?: Transaction;
  selectedAsset?: Asset;

  constructor(
    private dataService: TransactionService,
    private ass: AssetService
  ) {}

  onRowClick(transaction: Transaction) {
    this.loading = true;
    this.dataService.getById(transaction.id).subscribe((data) => {
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

  OnClose() {
    this.selectedAsset = undefined;
    this.refreshAsset.emit();
    // this.ass.getById(this.assetId).subscribe((data) => {
    //   if (data && data.transactions) {
    //     this.list = data.transactions;
    //   }
    // });
  }
}
