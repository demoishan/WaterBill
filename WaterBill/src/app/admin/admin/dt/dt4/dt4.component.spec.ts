import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { Dt4Component } from './dt4.component';

describe('Dt4Component', () => {
  let component: Dt4Component;
  let fixture: ComponentFixture<Dt4Component>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ Dt4Component ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(Dt4Component);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
