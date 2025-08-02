import { ComponentFixture, TestBed } from '@angular/core/testing';

import { InitStockTakeComponent } from './init-stock-take.component';

describe('InitStockTakeComponent', () => {
  let component: InitStockTakeComponent;
  let fixture: ComponentFixture<InitStockTakeComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [InitStockTakeComponent]
    });
    fixture = TestBed.createComponent(InitStockTakeComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
