import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { TransactionshowComponent } from './transactionshow.component';

describe('TransactionshowComponent', () => {
  let component: TransactionshowComponent;
  let fixture: ComponentFixture<TransactionshowComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ TransactionshowComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(TransactionshowComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
