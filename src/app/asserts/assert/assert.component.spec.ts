import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AssertComponent } from './assert.component';

describe('AssertComponent', () => {
  let component: AssertComponent;
  let fixture: ComponentFixture<AssertComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [AssertComponent]
    });
    fixture = TestBed.createComponent(AssertComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
