import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AssetByLocationComponent } from './asset-by-location.component';

describe('AssetByLocationComponent', () => {
  let component: AssetByLocationComponent;
  let fixture: ComponentFixture<AssetByLocationComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AssetByLocationComponent]
    });
    fixture = TestBed.createComponent(AssetByLocationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
