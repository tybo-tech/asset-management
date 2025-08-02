import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AssetTransactionsComponent } from './asset-transactions.component';

describe('AssetTransactionsComponent', () => {
  let component: AssetTransactionsComponent;
  let fixture: ComponentFixture<AssetTransactionsComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AssetTransactionsComponent]
    });
    fixture = TestBed.createComponent(AssetTransactionsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
