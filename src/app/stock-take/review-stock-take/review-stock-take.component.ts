import { Component } from '@angular/core';
import { ActivatedRoute } from '@angular/router';
import {
  initOtherInfo,
  IStockTake,
  OTHER_TYPES,
  OtherInfo,
} from 'src/models/other-info.model';
import { PAGES } from 'src/models/Schema';
import { IComment } from 'src/models/Transaction';
import { OtherInfoService } from 'src/services/other-info.service';

@Component({
  selector: 'app-review-stock-take',
  templateUrl: './review-stock-take.component.html',
  styleUrls: ['./review-stock-take.component.scss'],
})
export class ReviewStockTakeComponent {
  name = '';
  search = '';
  loading = false;
  title = 'Review Stock Take';
  headers = [
    'Code',
    'Name',
    'Category',
    'Counted',
    'Theoretical',
    'Variance',
    'Action',
  ];
  page = PAGES.stockTake;
  stockTakeList: OtherInfo<IStockTake>[] = [];
  comments: OtherInfo<IComment[]>[] = [];
  selectedStockItem?: OtherInfo<IStockTake>;
  constructor(
    private activedRoute: ActivatedRoute,
    private otherInfoService: OtherInfoService<IStockTake>,
    private commentService: OtherInfoService<IComment[]>
  ) {
    // Get query params
    this.activedRoute.queryParams.subscribe((params) => {
      this.name = params['name'] || '';
      this.name && this.listByName();
      this.getComments();
    });
  }

  listByName() {
    this.otherInfoService.listByName(this.name).subscribe((data) => {
      this.stockTakeList = data || [];
      // this.stockTakeList.length && this.adjust(this.stockTakeList[0]);
    });
  }
  save() {}

  // Comments

  getComments() {
    this.commentService
      .listByName('comments-' + this.name)
      .subscribe((data) => {
        this.comments = data || [];
        if (!this.comments.length) {
          const comment: OtherInfo<IComment[]> = initOtherInfo(
            OTHER_TYPES.StockTakeComments,
            this.name,
            []
          );
          comment.Status = 'active';
          comment.Name = 'comments-' + this.name;
          this.comments.push(comment);
        }
      });
  }
  get commentList(): IComment[] {
    return this.comments[0]?.ItemValue || [];
  }

  saveComment(comm: IComment[]) {
    this.comments[0].ItemValue = comm;
    this.commentService.save(this.comments[0]).subscribe();
  }

  // Adjustments
  adjustAll() {}
  adjust(stockItem: OtherInfo<IStockTake>) {
    this.selectedStockItem = stockItem;
  }
  adjustStock(e: OtherInfo<IStockTake> | undefined) {
    this.selectedStockItem = undefined;
    if (e) {
      const i = this.stockTakeList.find((s) => s.Id === e.Id);
      if (i) {
        i.Status = e.Status;
        this.otherInfoService.save(i).subscribe();
      }
    }
  }

  get getPdfUrl() {
    return `https://docs.tybofashion.co.za/stocktake-report.php?id=${this.name}`;
  }
}
