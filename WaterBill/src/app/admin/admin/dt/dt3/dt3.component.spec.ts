import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Dt3Component } from './dt3.component';

describe('Dt3Component', () => {
  let component: Dt3Component;
  let fixture: ComponentFixture<Dt3Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Dt3Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Dt3Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
