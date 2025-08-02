import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AssetTransferFormComponent } from './asset-transfer-form.component';

describe('AssetTransferFormComponent', () => {
  let component: AssetTransferFormComponent;
  let fixture: ComponentFixture<AssetTransferFormComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AssetTransferFormComponent]
    });
    fixture = TestBed.createComponent(AssetTransferFormComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
