import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AssetTypeListComponent } from './asset-type-list.component';

describe('AssetTypeListComponent', () => {
  let component: AssetTypeListComponent;
  let fixture: ComponentFixture<AssetTypeListComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AssetTypeListComponent]
    });
    fixture = TestBed.createComponent(AssetTypeListComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
