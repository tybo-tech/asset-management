import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AssetTypeDetailComponent } from './asset-type-detail.component';

describe('AssetTypeDetailComponent', () => {
  let component: AssetTypeDetailComponent;
  let fixture: ComponentFixture<AssetTypeDetailComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AssetTypeDetailComponent]
    });
    fixture = TestBed.createComponent(AssetTypeDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
