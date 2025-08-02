import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AssetTransferLogComponent } from './asset-transfer-log.component';

describe('AssetTransferLogComponent', () => {
  let component: AssetTransferLogComponent;
  let fixture: ComponentFixture<AssetTransferLogComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AssetTransferLogComponent]
    });
    fixture = TestBed.createComponent(AssetTransferLogComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
