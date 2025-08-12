import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { SignInComponent } from './accounts/sign-in/sign-in.component';
import { SignupComponent } from './accounts/signup/signup.component';
import { StockItemComponent } from './stock-module/stock-item/stock-item.component';
import { ModuleSelectorComponent } from './shared/module-selector/module-selector.component';
import { CategoryComponent } from './categories/category/category.component';
import { ListCategoryComponent } from './categories/list-category/list-category.component';
import { ListTransactionComponent } from './transactions/list-transaction/list-transaction.component';
import { TransactionComponent } from './transactions/transaction/transaction.component';
import { UserComponent } from './users/user/user.component';
import { ListUsersComponent } from './users/list-users/list-users.component';
import { SiteNavigationComponent } from './dashboard/site-navigation/site-navigation.component';
import { OverviewComponent } from './dashboard/overview/overview.component';
import {
  SearchAssetPipe,
  SearchCatergoryPipe,
  SearchOtherInfoPipe,
  SearchTransactionPipe,
} from './pipes/search-catergory.pipe';
import { ListLocationComponent } from './locations/list-location/list-location.component';
import { LocationComponent } from './locations/location/location.component';
import { BreadComponent } from './bread/bread.component';
import { ListRoomsComponent } from './rooms/list-rooms/list-rooms.component';
import { RoomComponent } from './rooms/room/room.component';
import { ListTanantsComponent } from './tanants/list-tanants/list-tanants.component';
import { TanantComponent } from './tanants/tanant/tanant.component';
import { LoaderComponent } from './loader/loader.component';
import { ListSuppliersComponent } from './suppliers/list-suppliers/list-suppliers.component';
import { SupplierComponent } from './suppliers/supplier/supplier.component';
import { ProfileComponent } from './accounts/profile/profile.component';
import { CaptureStockTakeComponent } from './stock-take/capture-stock-take/capture-stock-take.component';
import { ListAssetTypesComponent } from './asset-types/list-asset-types/list-asset-types.component';
import { AssetTypeComponent } from './asset-types/asset-type/asset-type.component';
import { StatCardComponent } from 'src/stat-card/stat-card.component';
import { AssetTransactionsComponent } from './stock-module/asset-transactions/asset-transactions.component';
import { BarChartComponent } from './charts/bar-chart/bar-chart.component';
import { DoughnutComponent } from './charts/doughnut/doughnut.component';
import { LineChartComponent } from './charts/line-chart/line-chart.component';
import { NumbersChartComponent } from './charts/numbers-chart/numbers-chart.component';
import { TableComponent } from './charts/table/table.component';
import { CommentsComponent } from './comments/comments.component';
import { LowStockItemsComponent } from './low-stock-items/low-stock-items.component';
import { InitStockTakeComponent } from './stock-take/init-stock-take/init-stock-take.component';
import { TopBarComponent } from './top-bar/top-bar.component';
import { TransactionTabsComponent } from './transaction-tabs/transaction-tabs.component';
import { FiltersComponent } from './transactions/filters/filters.component';
import { SelectStockTakeToReviewComponent } from './stock-take/select-stock-take-to-review/select-stock-take-to-review.component';
import { ReviewStockTakeComponent } from './stock-take/review-stock-take/review-stock-take.component';
import { RequisitionAddComponent } from './requisitions/requisition-add/requisition-add.component';
import { RequisitionListComponent } from './requisitions/requisition-list/requisition-list.component';
import { ManageRolesComponent } from './roles/manage-roles/manage-roles.component';
import { RoleComponent } from './roles/role/role.component';
import { AssetTypeListComponent } from './movable-assets/asset-type/asset-type-list/asset-type-list.component';
import { AssetTypeDetailComponent } from './movable-assets/asset-type/asset-type-detail/asset-type-detail.component';
import { ListStockComponent } from './stock-module/list-stock/list-stock.component';
import { AssetListComponent } from './asset-module/asset-list/asset-list.component';
import { AssetDashboardComponent } from './asset-module/asset-dashboard/asset-dashboard.component';

const routes: Routes = [
  // Account
  { path: '', component: SignInComponent },
  { path: 'sign-in', component: SignInComponent },
  { path: 'sign-in/:id', component: SignInComponent },
  { path: 'sign-up', component: SignupComponent },
  { path: 'sign-up/:id', component: SignupComponent },
  { path: 'profile', component: ProfileComponent },

  //Asset Management Module
  { path: 'asset-dashboard', component: AssetDashboardComponent },
  { path: 'asset-list', component: AssetListComponent },
  { path: 'asset/:id', component: AssetTypeDetailComponent },
  { path: 'assets', component: AssetTypeListComponent },

  //Stock
  { path: 'stock/:id', component: StockItemComponent },
  { path: 'list-stock', component: ListStockComponent },
  //requisition
  { path: 'requisition/:id', component: RequisitionAddComponent },
  { path: 'list-requisitions', component: RequisitionListComponent },

  //Category
  { path: 'category/:id', component: CategoryComponent },
  { path: 'categories', component: ListCategoryComponent },

  //Transaction
  { path: 'transaction/:id', component: TransactionComponent },
  { path: 'transactions/:type', component: ListTransactionComponent },

  // Users
  { path: 'user/:id', component: UserComponent },
  { path: 'users', component: ListUsersComponent },

  //Dashboard
  { path: 'dashboard', component: OverviewComponent },

  // Locations
  { path: 'locations', component: ListLocationComponent },
  { path: 'location/:id', component: LocationComponent },

  // Rooms
  { path: 'rooms', component: ListRoomsComponent },
  { path: 'room/:id', component: RoomComponent },

  //Tanants
  { path: 'tanants', component: ListTanantsComponent },
  { path: 'tanant/:id', component: TanantComponent },

  //Suppliers
  { path: 'suppliers', component: ListSuppliersComponent },
  { path: 'supplier/:id', component: SupplierComponent },

  // Stock Take
  {
    path: 'init-stocktake/:id',
    component: InitStockTakeComponent,
  },
  {
    path: 'stocktake/:id',
    component: CaptureStockTakeComponent,
  },
  {
    path: 'select-stocktake-to-review',
    component: SelectStockTakeToReviewComponent,
  },
  {
    path: 'review-stock-take',
    component: ReviewStockTakeComponent,
  },

  //AssetTypes
  {
    path: 'asset-types',
    component: ListAssetTypesComponent,
  },
  {
    path: 'asset-types/:id',
    component: AssetTypeComponent,
  },

  //Roles
  {
    path: 'roles',
    component: ManageRolesComponent,
  },
  {
    path: 'role/:id',
    component: RoleComponent,
  },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule],
})
export class AppRoutingModule {}
export const pipes = [
  SearchCatergoryPipe,
  SearchAssetPipe,
  SearchTransactionPipe,
  SearchOtherInfoPipe,
];
export const declarations = [
  SignInComponent,
  SignupComponent,
  StockItemComponent,
  ModuleSelectorComponent,
  ListStockComponent,
  ListCategoryComponent,
  ListTransactionComponent,
  TransactionComponent,
  CategoryComponent,
  UserComponent,
  ListUsersComponent,
  SiteNavigationComponent,
  OverviewComponent,
  ListLocationComponent,
  LocationComponent,
  BreadComponent,
  ListRoomsComponent,
  RoomComponent,
  ListTanantsComponent,
  TanantComponent,
  LoaderComponent,
  ListSuppliersComponent,
  SupplierComponent,
  ProfileComponent,
  CommentsComponent,
  StatCardComponent,
  TopBarComponent,
  AssetTransactionsComponent,
  TransactionTabsComponent,
  LowStockItemsComponent,
  DoughnutComponent,
  TableComponent,
  BarChartComponent,
  LineChartComponent,
  NumbersChartComponent,
  FiltersComponent,
  CaptureStockTakeComponent,
  ListAssetTypesComponent,
  AssetTypeComponent,
  InitStockTakeComponent,
  RequisitionAddComponent,
  AssetListComponent,
  AssetDashboardComponent
];
