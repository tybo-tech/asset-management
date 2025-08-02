import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListTanantsComponent } from './list-tanants.component';

describe('ListTanantsComponent', () => {
  let component: ListTanantsComponent;
  let fixture: ComponentFixture<ListTanantsComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ListTanantsComponent]
    });
    fixture = TestBed.createComponent(ListTanantsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
