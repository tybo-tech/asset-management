import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AssetDistributionComponent } from './asset-distribution.component';

describe('AssetDistributionComponent', () => {
  let component: AssetDistributionComponent;
  let fixture: ComponentFixture<AssetDistributionComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AssetDistributionComponent]
    });
    fixture = TestBed.createComponent(AssetDistributionComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
