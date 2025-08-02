import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListAssetTypesComponent } from './list-asset-types.component';

describe('ListAssetTypesComponent', () => {
  let component: ListAssetTypesComponent;
  let fixture: ComponentFixture<ListAssetTypesComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ListAssetTypesComponent]
    });
    fixture = TestBed.createComponent(ListAssetTypesComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
