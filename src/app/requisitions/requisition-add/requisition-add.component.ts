import { Component } from '@angular/core';
import { ActivatedRoute, Router } from '@angular/router';
import { TOAST, toast } from 'src/app/functions';
import {
  Requisition,
  RequisitionItem,
  initRequisition,
  initRequisitionItem,
} from 'src/models/Requisition';
import { Asset } from 'src/models/Asset';
import { RequisitionService } from 'src/services/RequisitionService';
import { AssetService } from 'src/services/AssetService';
import { PAGES } from 'src/models/Schema';
import { UserService } from 'src/services/user.service';
import { User } from 'src/models/user.model';
import { OtherInfoService } from 'src/services/other-info.service';
import { ILocation, OTHER_TYPES, OtherInfo } from 'src/models/other-info.model';

@Component({
  selector: 'app-requisition-add',
  templateUrl: './requisition-add.component.html',
  styleUrls: ['./requisition-add.component.scss'],
})
export class RequisitionAddComponent {
  sites: OtherInfo<ILocation>[] = [];
  locations: OtherInfo<ILocation>[] = [];

  id = '';
  searchAsset = '';
  data?: Requisition;
  isAdd = false;
  loading = false;
  isEdit = false;
  page = PAGES.requisition;
  assets: Asset[] = [];
  selectedAssets: RequisitionItem[] = [];
  showModal: boolean = false;
  user?: User;
  constructor(
    private activatedRoute: ActivatedRoute,
    private requisitionService: RequisitionService,
    private assetService: AssetService,
    private userService: UserService,
    private locationService: OtherInfoService<ILocation>,
    private router: Router
  ) {
    userService.userObservable?.subscribe((u) => {
      this.user = u;
      if (!this.user) {
        alert('You are not authorized to access this page');
        this.router.navigate(['/']);
      }
    });
    activatedRoute.params.subscribe((p) => {
      this.id = p['id'];
      this.get();
      this.loadAssets();
      this.loadLocations();
    });
  }

  get title() {
    return this.isAdd ? 'New Requisition' : 'Update Requisition';
  }
  loadLocations() {
    this.locationService
      .search({ ItemType: OTHER_TYPES.Locations })
      .subscribe((data) => {
        this.sites = (data || []).filter(
          (l) => l.ItemValue.IsSite === 'Yes'
        );
        this.locations = (data || []).filter(
          (l) => l.ItemValue.IsSite !== 'Yes'
        );
      });
  }
  loadAssets() {
    this.loading = true;
    this.assetService.getAll();
    this.assetService.$assetList.subscribe((data) => {
      this.assets = data || [];
      this.loading = false;
    });
  }

  get() {
    if ('add' === this.id) {
      this.isAdd = true;
      this.data = initRequisition();
      return;
    }
    this.isAdd = false;
    this.loading = true;
    this.requisitionService.getById(Number(this.id)).subscribe((data) => {
      if (data && !data.metadata) {
        data.metadata = { notes: '' };
      }
      this.data = data;
      this.selectedAssets = data.items || [];
      this.loading = false;
      this.isEdit = Number(data.id) > 0;
    });
  }

  // ✅ FIXED: Added method to open asset modal
  openAssetModal() {
    this.showModal = true;
  }

  // ✅ FIXED: Added method to select an asset
  selectAsset(asset: Asset) {
    // const exists = this.selectedAssets.find(
    //   (item) => item.assetId === asset.id
    // );
    const exists = false;
    if (!exists) {
      this.selectedAssets.push({
        ...initRequisitionItem(),
        assetId: asset.id,
        assetName: asset.name,
        quantity: 1,
      });
    }
    this.showModal = false;
  }

  // ✅ FIXED: Added method to remove an item
  removeItem(index: number) {
    this.selectedAssets.splice(index, 1);
  }

  save() {
    if (!this.data || !this.selectedAssets.length) {
      toast('⚠️ Please add at least one asset.', TOAST.warn);
      return;
    }

    this.data.items = this.selectedAssets;
    this.isAdd
      ? this.requisitionService.add(this.data).subscribe((res) => {
          if (res && res.id) {
            toast('✅ Requisition added successfully', TOAST.success);
            this.router.navigate(['/list-requisitions']);
          }
        })
      : this.requisitionService
          .updateStatus(
            Number(this.id),
            this.data.status,
            this.data.approvedBy || ''
          )
          .subscribe((res) => {
            toast('✅ Requisition updated successfully', TOAST.success);
          });
  }

  updateItem(itemToUpdate: RequisitionItem) {
    if (!itemToUpdate.id || !this.data || !this.data.items) return;
    this.requisitionService.updatItem(itemToUpdate).subscribe((res) => {
      if (res) {
        toast('✅ Item updated successfully', TOAST.success);
      }
    });
  }

  get isClosed() {
    return (
      this.data?.status === 'completed' ||
      this.data?.status === 'rejected' ||
      this.data?.status === 'approved'
    );
  }
}
