import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RoleFeaturePickerComponent } from './role-feature-picker.component';

describe('RoleFeaturePickerComponent', () => {
  let component: RoleFeaturePickerComponent;
  let fixture: ComponentFixture<RoleFeaturePickerComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [RoleFeaturePickerComponent]
    });
    fixture = TestBed.createComponent(RoleFeaturePickerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
