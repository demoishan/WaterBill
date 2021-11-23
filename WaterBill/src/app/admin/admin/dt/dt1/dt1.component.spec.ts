import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Dt1Component } from './dt1.component';

describe('Dt1Component', () => {
  let component: Dt1Component;
  let fixture: ComponentFixture<Dt1Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Dt1Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Dt1Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
