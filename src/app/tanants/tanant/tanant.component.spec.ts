import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TanantComponent } from './tanant.component';

describe('TanantComponent', () => {
  let component: TanantComponent;
  let fixture: ComponentFixture<TanantComponent>;

  beforeEach(() => {
    TestBed.configureTestingModule({
      declarations: [TanantComponent]
    });
    fixture = TestBed.createComponent(TanantComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
