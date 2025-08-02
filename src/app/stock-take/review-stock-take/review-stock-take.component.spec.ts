import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ReviewStockTakeComponent } from './review-stock-take.component';

describe('ReviewStockTakeComponent', () => {
  let component: ReviewStockTakeComponent;
  let fixture: ComponentFixture<ReviewStockTakeComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ReviewStockTakeComponent]
    });
    fixture = TestBed.createComponent(ReviewStockTakeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
