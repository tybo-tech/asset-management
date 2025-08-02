import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AssetTypeSelectComponent } from './asset-type-select.component';

describe('AssetTypeSelectComponent', () => {
  let component: AssetTypeSelectComponent;
  let fixture: ComponentFixture<AssetTypeSelectComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AssetTypeSelectComponent]
    });
    fixture = TestBed.createComponent(AssetTypeSelectComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
