import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { getId, TOAST, toast } from 'src/app/functions';
import { Asset } from 'src/models/Asset';
import {
  initOtherInfo,
  initStockTake,
  IStockTake,
  OTHER_TYPES,
  OtherInfo,
} from 'src/models/other-info.model';
import { PAGES } from 'src/models/Schema';
import { AssetService } from 'src/services/AssetService';
import { OtherInfoService } from 'src/services/other-info.service';

@Component({
  selector: 'app-capture-stock-take',
  templateUrl: './capture-stock-take.component.html',
  styleUrls: ['./capture-stock-take.component.scss'],
})
export class CaptureStockTakeComponent {
  assetList: Asset[] = [];
  stockTakeList: OtherInfo<IStockTake>[] = [];
  page = PAGES.stockTake;
  search = '';
  id = '';
  itemId = '';
  loading = false;
  constructor(
    private assetService: AssetService,
    private activedRoute: ActivatedRoute,
    private stockTakeService: OtherInfoService<IStockTake>,
    private router: Router
  ) {
    this.activedRoute.params.subscribe((params) => {
      this.id = params['id'] || '';
    });
    this.activedRoute.queryParams.subscribe((params) => {
      this.itemId = params['id'] || '';
    });
    this.loading = true;
    this.assetService.getAll({ category: this.itemId });
    this.getList();
  }

  getList() {
    this.assetService.$assetList.subscribe((data) => {
      this.assetList = data || [];
      this.assetList.length && this.mapStockTake(this.assetList);
    });
  }
  mapStockTake(assetList: Asset[]) {
    this.stockTakeList = [];
    assetList.forEach((asset) => {
      const stockTake = initOtherInfo<IStockTake>(
        OTHER_TYPES.StockTake,
        OTHER_TYPES.Id,
        initStockTake()
      );
      stockTake.ItemValue.Date = new Date().toISOString();
      stockTake.ItemValue.AssetCategoryId = asset.categoryId;
      stockTake.ItemValue.AssetCategoryName = asset.categoryName || '';
      stockTake.ItemValue.AssetCode = asset.code;
      stockTake.ItemValue.AssetId = asset.id;
      stockTake.ItemValue.AssetName = asset.name;
      stockTake.ItemValue.Comments = [];
      stockTake.ItemValue.LocationId = 0;
      stockTake.ItemValue.LocationName = '';
      stockTake.ItemValue.Quantity = undefined;
      // Random number between 0 and 100 for testing
      // stockTake.ItemValue.Quantity = Math.floor(Math.random() * 100);
      stockTake.ItemValue.TheoreticalQuantity = asset.stockInHand || 0;
      stockTake.ItemValue.Status = 'pending';
      stockTake.ItemValue.Variance = 0;

      this.stockTakeList.push(stockTake);
      const reportName = this.generateReportName();
      const code = getId('stock-take');
      if (this.isByCategory) {
        this.stockTakeList.forEach((stock) => {
          stock.ItemValue.AssetCategoryId = Number(this.itemId);
          stock.ItemValue.AssetCategoryName = asset.categoryName || '';
        });
      }
      this.stockTakeList.map((stock) => (stock.Name = reportName));
      this.stockTakeList.map((stock) => (stock.ItemCode = code));
    });
    this.loading = false;
  }
  generateReportName() {
    if (this.isByCategory && this.assetList.length && this.itemId) {
      const category = this.assetList[0].categoryName;
      return (category + ' Stock Take').split(' ').join('_');
    }
    function pad(n: number) {
      return n < 10 ? '0' + n : n;
    }
    let code = '';
    const date = new Date();
    const day = date.getDate(),
      month = date.getMonth() + 1,
      year = date.getFullYear(),
      hours = date.getHours(),
      minutes = date.getMinutes(),
      seconds = date.getSeconds();
    code = `${pad(day)}_${pad(month)}_${year}_${pad(hours)}:${pad(
      minutes
    )}:${pad(seconds)}`;
    return code;
  }
  downLoadForm() {
    let url = `https://docs.tybofashion.co.za/stocktake.php?category=${this.itemId}`;
    this.assetService.download(url, 'stock-take-form.pdf');
  }
  get getPdfUrl() {
    return `https://docs.tybofashion.co.za/stocktake.php?category=${this.itemId}`;
  }
  save() {
    if (!this.stockTakeList[0].Name) {
      toast('Please fill all fields', TOAST.warn);
      return;
    }
    let isValid = true;
    this.stockTakeList.forEach((stock) => {
      stock.Status = 'Counted';
      stock.Name = this.stockTakeList[0].Name;
      stock.ItemValue.Variance =
        (stock.ItemValue.Quantity || 0) - stock.ItemValue.TheoreticalQuantity;
      console.log(
        `${stock.ItemValue.Quantity} - ${stock.ItemValue.TheoreticalQuantity} = ${stock.ItemValue.Variance}`
      );

      if (stock.ItemValue.Quantity === undefined) {
        isValid = false;
      }
    });
    if (!isValid) return toast('Please fill all fields', TOAST.warn);
    this.stockTakeService.saveRange(this.stockTakeList).subscribe((data) => {
      if (data && Array.isArray(data)) {
        this.stockTakeList = data;
        toast('Stock Take saved successfully', TOAST.success);
        this.router.navigate(['/select-stocktake-to-review']);
      }
    });
  }

  get title() {
    if (this.isAllAssets) return 'All Assets | Stock Take';
    if (this.isByCategory && this.assetList.length)
      return `Category | ${this.assetList[0].categoryName}`;
    return 'Stock Take';
  }

  get isAllAssets() {
    return this.id === 'all-assets';
  }

  get isByCategory() {
    return this.id === 'category';
  }
}
