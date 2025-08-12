import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { Router } from '@angular/router';
import { toast, TOAST } from 'src/app/functions';
import { Asset } from 'src/models/Asset';
import {
  OtherInfo,
  IStockTake,
  initOtherInfo,
} from 'src/models/other-info.model';
import { initTransaction, Transaction } from 'src/models/Transaction';
import { User } from 'src/models/user.model';
import { AssetService } from 'src/services/AssetService';
import { OtherInfoService } from 'src/services/other-info.service';
import { TransactionService } from 'src/services/TransactionService';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-adjust-stock',
  templateUrl: './adjust-stock.component.html',
  styleUrls: ['./adjust-stock.component.scss'],
})
export class AdjustStockComponent implements OnInit {
  @Input() selectedStockItem?: OtherInfo<IStockTake>;
  @Output() onClose = new EventEmitter<OtherInfo<IStockTake> | undefined>();
  user?: User;

  data?: Transaction;
  assert?: Asset;
  reasons = [
    'Capture Error',
    'Damaged',
    'Expired',
    'Lost',
    'Stolen',
    'Misplaced',
    'Other',
  ];
  constructor(
    private transactionService: TransactionService,
    private assetService: AssetService,
    private userService: UserService,
    private router: Router,
    private stockTakeService: OtherInfoService<IStockTake>
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
    this.getAsset();
  }

  getAsset() {
    console.log(this.selectedStockItem);

    if (!this.selectedStockItem) return;
    const { AssetId } = this.selectedStockItem.ItemValue;
    this.assetService.getById(AssetId).subscribe((asset) => {
      this.assert = asset;
      this.assert && this.initTransaction();
    });
  }
  initTransaction() {
    if (!this.assert || !this.selectedStockItem) return;
    this.data = initTransaction();
    this.data.quantity = Number(this.selectedStockItem.ItemValue.Variance);
    this.data.metadata.reasonCode = 'Capture Error';
    this.data.createdBy = this.user?.UserId || '';
    this.data.lastUpdatedBy = this.user?.UserId || '';
    this.data.stockItemId = this.assert?.id || 0;
    this.data.status = 'Completed';
    this.data.transactionType = 'stock-adjustment';
  }

  save() {
    if (!this.data) return;

    this.transactionService.add(this.data).subscribe((data) => {
      if (data && data.id) {
        this.updateStockTake();
        this.adjustStock();
      }
    });
  }
  adjustStock() {
    if (
      !this.data ||
      !this.data.quantity ||
      !this.assert ||
      !this.selectedStockItem
    )
      return;
    if (!this.assert.stockInHand) this.assert.stockInHand = 0;
    const items =
      this.assert.stockInHand +
      Number(this.selectedStockItem.ItemValue.Variance);
    this.assetService
      .adjustStock(
        this.assert.id,
        Number(this.selectedStockItem.ItemValue.Variance)
      )
      .subscribe((dat) => {
        if (dat && dat.id) {
          this.assert = dat;
          if (!this.assert.stockInHand) this.assert.stockInHand = 0;
          this.assert.stockInHand += items;
        }
      });
  }
  updateStockTake() {
    if (!this.selectedStockItem) return;
    this.selectedStockItem.Status = 'balanced';
    this.stockTakeService.save(this.selectedStockItem).subscribe(() => {
      toast('Stock take updated', TOAST.success);
      this.onClose.emit(this.selectedStockItem);
    });
  }
}
