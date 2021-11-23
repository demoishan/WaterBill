import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminpayhistoryComponent } from './adminpayhistory.component';

describe('AdminpayhistoryComponent', () => {
  let component: AdminpayhistoryComponent;
  let fixture: ComponentFixture<AdminpayhistoryComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AdminpayhistoryComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminpayhistoryComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
