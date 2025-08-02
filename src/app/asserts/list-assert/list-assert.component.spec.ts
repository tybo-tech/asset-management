import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ListAssertComponent } from './list-assert.component';

describe('ListAssertComponent', () => {
  let component: ListAssertComponent;
  let fixture: ComponentFixture<ListAssertComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [ListAssertComponent]
    });
    fixture = TestBed.createComponent(ListAssertComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
