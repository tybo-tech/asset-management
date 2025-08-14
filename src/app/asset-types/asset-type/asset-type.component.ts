import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { toast } from 'src/app/functions';
import { StockType, initAssetType } from 'src/models/AssetType';
import { Category } from 'src/models/Category';
import { PAGES } from 'src/models/Schema';
import { StockTypeService } from 'src/services/StockTypeService';
import { CategoryService } from 'src/services/CategoryService';
import { UserService } from 'src/services/user.service';

@Component({
  selector: 'app-asset-type',
  templateUrl: './asset-type.component.html',
  styleUrls: ['./asset-type.component.scss'],
})
export class AssetTypeComponent {
  page = PAGES.assetType;
  data?: StockType;
  id = 0;
  categories: Category[] = [];
  assetTypes: StockType[] = [];
  loading = false;
  constructor(
    private srvc: StockTypeService,
    private categoryService: CategoryService,
    private activatedRoute: ActivatedRoute,
    private assetTypeService: StockTypeService,
    private userService: UserService,
    private router: Router
  ) {
    activatedRoute.params.subscribe((params) => {
      this.id = params['id'];
      this.get();
      this.getCatergories();
    });
  }
  getCatergories() {
    this.categoryService.getAll().subscribe((data) => {
      this.categories = data || [];
      this.fetchAssetTypes();
    });
  }
  get() {
    if (0 === this.id) {
      this.data = initAssetType();
      return;
    }

    this.srvc.getById(this.id).subscribe((data) => {
      this.data = data;
      if (this.data && this.data.id) {
        this.data = data;
      }
    });
  }

  save() {
    if (!this.data) return;
    const existing = this.assetTypes.find(
      (a) => a.code === this.data?.code && a.id !== this.data?.id
    );
    if (existing && this.data.id !== existing.id) {
      toast('Asset type with code already exists', 'warn');
      return;
    }

    if (!this.data.name) {
      toast('Name is required', 'warn');
      return;
    }
    if (!this.data.categoryId) {
      toast('Category is required', 'warn');
      return;
    }
    if (!this.data.code) {
      toast('Code is required', 'warn');
      return;
    }

    this.data.createdBy = this.data.createdBy || this.userService.userId;
    this.data.lastUpdatedBy = this.userService.userId;
    this.data.imageUrl = this.data.imageUrl || '';

    this.loading = true;
    const request = this.data.id
      ? this.srvc.update(this.data)
      : this.srvc.add(this.data);
    request.subscribe((data) => {
      this.loading = false;
      if (data && data.message && data.message.includes('success')) {
        toast('Saved');
        this.router.navigate(['/asset-types']);
      } else {
        toast('Error saving');
      }
    });
  }

  fetchAssetTypes() {
    this.srvc.list().subscribe((data) => {
      this.assetTypes = data || [];
    });
  }
}
