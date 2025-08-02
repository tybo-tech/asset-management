import { ComponentFixture, TestBed } from '@angular/core/testing';

import { CaptureStockTakeComponent } from './capture-stock-take.component';

describe('CaptureStockTakeComponent', () => {
  let component: CaptureStockTakeComponent;
  let fixture: ComponentFixture<CaptureStockTakeComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [CaptureStockTakeComponent]
    });
    fixture = TestBed.createComponent(CaptureStockTakeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
