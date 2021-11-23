import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DtdetailComponent } from './dtdetail.component';

describe('DtdetailComponent', () => {
  let component: DtdetailComponent;
  let fixture: ComponentFixture<DtdetailComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DtdetailComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DtdetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
