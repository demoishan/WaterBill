import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ChequedetailComponent } from './chequedetail.component';

describe('ChequedetailComponent', () => {
  let component: ChequedetailComponent;
  let fixture: ComponentFixture<ChequedetailComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ChequedetailComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ChequedetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
