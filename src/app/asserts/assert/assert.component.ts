import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { TOAST, toast } from 'src/app/functions';
import { Asset, initAsset, initAssetMetadata } from 'src/models/Asset';
import { AssetType } from 'src/models/AssetType';
import { Category } from 'src/models/Category';
import { PAGES } from 'src/models/Schema';
import { initTransaction, Transaction } from 'src/models/Transaction';
import { AssetService } from 'src/services/AssetService';
import { AssetTypeService } from 'src/services/AssetTypeService';
import { CategoryService } from 'src/services/CategoryService';
import { OtherInfoService } from 'src/services/other-info.service';

@Component({
  selector: 'app-assert',
  templateUrl: './assert.component.html',
  styleUrls: ['./assert.component.scss'],
})
export class AssertComponent {
  id = '';
  data?: Asset;
  page = PAGES.assert;
  isAdd = false;
  loading = false;

  // Dropdowns
  assetTypes: AssetType[] = [];
  categories: Category[] = [];
  allAssetTypes:AssetType[] = [];

  // Other Actions Properties
  selectedAsset?: Asset;
  transaction?: Transaction;
  transactionType: 'restock' | 'usage' | 'damaged' = 'restock';
  constructor(
    private activatedRoute: ActivatedRoute,
    private assetService: AssetService,
    private assetTypeService: AssetTypeService,
    private categoryService: CategoryService,
    private router: Router
  ) {
    activatedRoute.params.subscribe((p) => {
      this.id = p['id'];
      this.get();
      this.getCatergories();
      this.fetchAssetTypes();
    });
  }
get title(){
  return this.isAdd ? 'Add Asset' : 'Update Asset';
}
  getCatergories() {
    this.loading = true;
    this.categoryService.getAll().subscribe((data) => {
      this.categories = data || [];
      this.loading = false;
    });
  }
  fetchAssetTypes() {
    this.loading = true;
    this.assetTypeService
      .getAll()
      .subscribe((data) => {
        this.assetTypes = data || [];
        this.allAssetTypes = data || [];
        this.loading = false;
      });
  }

  filterAssetTypes() {
    if (!this.data || !this.data.categoryId) {
      this.assetTypes = this.allAssetTypes;
      return;
    }
    this.assetTypes = this.allAssetTypes;
    const categoryName =
      this.categories.find(
        (c) => Number(c.id) === Number(this.data?.categoryId)
      )?.name || '';
    this.assetTypes = this.allAssetTypes.filter(
      (t) => t.categoryName === categoryName
    );
  }
  refreshAsset() {
    location.reload();
  }
  get() {
    if ('add' === this.id) {
      this.isAdd = true;
      this.data = initAsset();
      return;
    }
    this.isAdd = false;
    this.loading = true;
    this.assetService.getById(Number(this.id)).subscribe((data) => {
      this.data = data;
      this.loading = false;
      if (
        this.data &&
        ((this.data.metadata && typeof this.data.metadata !== 'object') ||
          !this.data.metadata)
      ) {
        this.data.metadata = initAssetMetadata();
      }
    });
  }
  save() {
    if (!this.data) return;
    if (!this.data.name || !this.data.code) {
      toast('⚠️ Name and Code are required', TOAST.warn);
      return;
    }
    if (!this.data.categoryId) {
      toast('⚠️ Category is required', TOAST.warn);
      return;
    }
    if (!this.data.assetTypeId) {
      toast('⚠️ Asset Type  is required', TOAST.warn);
      return;
    }
    if (!this.data.stockInHand) {
      this.data.stockInHand = 0;
    }
    // Add or Update
    // We make sure that the asset code is unique
    //Wheather we are adding or updating
    this.isAdd && this.validateAssetCode(this.data.code);
    !this.isAdd && this.validateAssetCode(this.data.code);
  }

  updateAsset() {
    this.data &&
      this.assetService.update(this.data).subscribe((res) => {
        if (res && res.asset && res.asset.id) {
          toast('✅  Asset updated successfully', TOAST.success);
          this.page.listUrl && this.router.navigate([this.page.listUrl]);
        }
      });
  }

  validateAssetCode(code: string) {
    this.loading = true;
    this.assetService.getByCode(code).subscribe((data) => {
      this.loading = false;
      if (data && Number(data.id) === Number(this.id)) {
        this.callback();
        return;
      }
      if (data && data.id) {
        toast('⚠️ Asset with the same code already exists', TOAST.warn);
        return;
      }
      this.callback();
    });
  }
  callback() {
    this.isAdd ? this.insertNewAsset() : this.updateAsset();
  }
  insertNewAsset() {
    this.data &&
      this.assetService.add(this.data).subscribe((res) => {
        if (res && res.id) {
          toast('✅  Asset added successfully', TOAST.success);
          this.page.listUrl && this.router.navigate([this.page.listUrl]);
        }
      });
  }

  // Other Actions

  onRestock(asset: Asset) {
    this.selectedAsset = asset;
    this.transaction = initTransaction();
    this.transactionType = 'restock';
    // Logic for handling restocking, e.g., open a modal or redirect to a restocking form
  }

  onUsage(asset: Asset) {
    this.selectedAsset = asset;
    this.transactionType = 'usage';
    this.transaction = initTransaction();
    // Logic for handling usage, e.g., open a modal or redirect to a usage form
  }
  
}
