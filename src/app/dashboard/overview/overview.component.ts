import { Component } from '@angular/core';
import { IKeyValue } from 'src/models/IKeyValue';
import { CountService, ICountResponse } from 'src/services/count.service';
import { ChartsHelper } from './ChartsHelper';
import { Router } from '@angular/router';
import { UserService } from 'src/services/user.service';
import { FEATURES } from 'src/models/SideNav';

@Component({
  selector: 'app-overview',
  templateUrl: './overview.component.html',
  styleUrls: ['./overview.component.scss'],
})
export class OverviewComponent {
  stats?: ICountResponse;
  counts: IKeyValue[] = [];
  feaure = 'Overview';
  loading = true;
  topIssuedAssets: IKeyValue[] = [
    {
      value: 'Name',
      key: 'assetName',
    },
    {
      value: 'Issued',
      key: 'totalIssued',
    },
    {
      value: 'Category',
      key: 'categoryName',
    },
  ];

  lowStock: IKeyValue[] = [
    {
      value: 'Name',
      key: 'name',
    },
    {
      value: 'Stock In Hand',
      key: 'stockInHand',
    },
    {
      value: 'Minimum Stock Alert',
      key: 'minimumStockAlert',
    },
  ];

  constructor(
    private countService: CountService,
    private router: Router,
    private userService: UserService
  ) {
    this.userService.isLoggedIn();
    userService.roles$.subscribe((res) => {
      if (res && res.length) {
        console.log(userService.canAccess(this.feaure));
      }
    });

    this.all();
  }
  all() {
    this.countService.all().subscribe((res) => {
      this.loading = false;
      if (res) {
        this.stats = res;
        this.mapCounts(this.stats);
        if (this.stats.user && this.stats.user.length) {
          this.stats.user.forEach((item) => {
            item.icon = 'bi bi-person';
            // item.Label = statusMap[item.Label] + ' Users';
            item.Label = 'Users';
            item.url = '/users';
          });
        }

        if (this.stats.asset && this.stats.asset.length) {
          this.stats.asset.forEach((item) => {
            item.icon = 'bi bi-box';
            // item.Label = item.Label + ' Assets';
            item.Label = 'Assets';
            item.url = '/assets';
          });
        }

        if (this.stats.restock && this.stats.restock.length) {
          this.stats.restock.forEach((item) => {
            item.icon = 'bi bi-arrow-repeat';
            // item.Label = 'Transactions ' + item.Label;
            item.url = '/transactions/restock';
          });
        }
        if (this.stats.usage && this.stats.usage.length) {
          this.stats.usage.forEach((item) => {
            item.icon = 'bi bi-arrow-down';
            // item.Label = 'Transactions ' + item.Label;
            item.url = '/transactions/usage';
          });
        }
        if (this.stats.category && this.stats.category.length) {
          this.stats.category.forEach((item) => {
            item.icon = 'bi bi-list';
            // item.Label = item.Label + ' Categories';
            item.Label = 'Categories';
            item.url = '/categories';
          });
        }
        if (this.stats.other && this.stats.other.length) {
          this.stats.other.forEach((item) => {
            item.icon = 'bi bi-gear';
            // item.url = '/other';
            switch (item.Label.toLocaleLowerCase()) {
              // Locations, Rooms, Tanants, Suppliers
              case 'locations': {
                item.url = '/locations';
                item.icon = 'bi bi-geo-alt';
                break;
              }

              case 'suppliers': {
                item.url = '/suppliers';
                item.icon = 'bi bi-person-plus';
                break;
              }
            }
          });
        }
      }
    });
  }
  mapCounts(stats: ICountResponse) {
    this.counts = [];
    if (stats) {
      if (stats.usage.length) {
        stats.usage.forEach((item) => {
          this.counts.push({
            key: `${item.Label} Issue Out`,
            value: this.countService.formatNumber(item.Value),
          });
        });
      }
      if (stats.asset.length) {
        stats.asset.forEach((item) => {
          this.counts.push({
            key: `${item.Label.toLowerCase()} Assets`,
            value: this.countService.formatNumber(item.Value),
            data: {
              url: '/list-assets',
            },
          });
        });
      }
      if (stats.category.length) {
        stats.category.forEach((item) => {
          this.counts.push({
            key: `${item.Label} Categories`,
            value: this.countService.formatNumber(item.Value),
            data: {
              url: '/categories',
            },
          });
        });
      }

      const excludes = ['assettypes', 'stocktake', 'stocktakecomments'];
      if (stats.other.length) {
        stats.other
          .filter((x) => !excludes.includes(x.Label.toLowerCase()))
          .forEach((item) => {
            this.counts.push({
              key: `${item.Label}`,
              value: this.countService.formatNumber(item.Value),
              data: {
                url: `/${item.Label.toLowerCase()}`,
              },
            });
          });
      }
    }
  }

  get locationDonut() {
    if (!this.stats || !this.stats.Location || !this.stats.Location.length)
      return undefined;
    return ChartsHelper.locationCountsToDoughnutChart(this.stats.Location);
  }

  get stockBar() {
    if (
      !this.stats ||
      !this.stats.stockLevels ||
      !this.stats.stockLevels.length
    )
      return undefined;
    return ChartsHelper.stockLevelsToBarChart(this.stats.stockLevels);
  }
  onRowClick($event: IKeyValue) {
    console.log($event);
    if ($event.data && $event.data.url) {
      this.router.navigate([$event.data.url]);
    }
  }
}
