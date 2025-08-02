import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TransferSummaryComponent } from './transfer-summary.component';

describe('TransferSummaryComponent', () => {
  let component: TransferSummaryComponent;
  let fixture: ComponentFixture<TransferSummaryComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [TransferSummaryComponent]
    });
    fixture = TestBed.createComponent(TransferSummaryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
