import { ComponentFixture, TestBed } from '@angular/core/testing';

import { SelectStockTakeToReviewComponent } from './select-stock-take-to-review.component';

describe('SelectStockTakeToReviewComponent', () => {
  let component: SelectStockTakeToReviewComponent;
  let fixture: ComponentFixture<SelectStockTakeToReviewComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [SelectStockTakeToReviewComponent]
    });
    fixture = TestBed.createComponent(SelectStockTakeToReviewComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
