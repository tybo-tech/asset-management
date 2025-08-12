import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule, declarations, pipes } from './app-routing.module';
import { AppComponent } from './app.component';
import { CommonModule } from '@angular/common';
import { HttpClientModule } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { SelectStockTakeToReviewComponent } from './stock-take/select-stock-take-to-review/select-stock-take-to-review.component';
import { ReviewStockTakeComponent } from './stock-take/review-stock-take/review-stock-take.component';
import { AdjustStockComponent } from './stock-take/adjust-stock/adjust-stock.component';
import { GhostComponent } from './ghost/ghost.component';
import { ConfirmBoxComponent } from './confirm-box/confirm-box.component';
import { RequisitionListComponent } from './requisitions/requisition-list/requisition-list.component';
import { ManageRolesComponent } from './roles/manage-roles/manage-roles.component';
import { RoleComponent } from './roles/role/role.component';
import { RoleFeaturePickerComponent } from './roles/role-feature-picker/role-feature-picker.component';
import { LocationTypesComponent } from './locations/location-types/location-types.component';
import { AssetTypeListComponent } from './movable-assets/asset-type/asset-type-list/asset-type-list.component';
import { AssetTypeFormComponent } from './movable-assets/asset-type/asset-type-form/asset-type-form.component';
import { AssetTypeDetailComponent } from './movable-assets/asset-type/asset-type-detail/asset-type-detail.component';
import { LocationListComponent } from './movable-assets/location/location-list/location-list.component';
import { LocationFormComponent } from './movable-assets/location/location-form/location-form.component';
import { AssetTransferFormComponent } from './movable-assets/transfer/asset-transfer-form/asset-transfer-form.component';
import { AssetTransferLogComponent } from './movable-assets/transfer/asset-transfer-log/asset-transfer-log.component';
import { AssetDistributionComponent } from './movable-assets/distribution/asset-distribution/asset-distribution.component';
import { AssetByLocationComponent } from './movable-assets/distribution/asset-by-location/asset-by-location.component';
import { AssetTypeSelectComponent } from './movable-assets/shared/asset-type-select/asset-type-select.component';
import { LocationSelectComponent } from './movable-assets/shared/location-select/location-select.component';
import { TransferSummaryComponent } from './movable-assets/shared/transfer-summary/transfer-summary.component';
import { NumbersChartComponent } from './charts/numbers-chart/numbers-chart.component';
import { TableComponent } from './charts/table/table.component';
import { DoughnutComponent } from './charts/doughnut/doughnut.component';
import { BarChartComponent } from './charts/bar-chart/bar-chart.component';
import { LineChartComponent } from './charts/line-chart/line-chart.component';

// https://spruko.com/demo/zynix/dist/html/data-tables.html
@NgModule({
  declarations: [
    AppComponent,
    ...declarations,
    ...pipes,
    SelectStockTakeToReviewComponent,
    ReviewStockTakeComponent,
    AdjustStockComponent,
    GhostComponent,
    ConfirmBoxComponent,
    RequisitionListComponent,
    ManageRolesComponent,
    RoleComponent,
    RoleFeaturePickerComponent,
    LocationTypesComponent,
    AssetTypeListComponent,
    AssetTypeFormComponent,
    AssetTypeDetailComponent,
    LocationListComponent,
    LocationFormComponent,
    AssetTransferFormComponent,
    AssetTransferLogComponent,
    AssetDistributionComponent,
    AssetByLocationComponent,
    AssetTypeSelectComponent,
    LocationSelectComponent,
    TransferSummaryComponent,
    NumbersChartComponent,
    TableComponent,
    DoughnutComponent,
    BarChartComponent,
    LineChartComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    ReactiveFormsModule,
    CommonModule,
    HttpClientModule,
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}
