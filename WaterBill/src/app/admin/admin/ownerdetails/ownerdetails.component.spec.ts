import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OwnerdetailsComponent } from './ownerdetails.component';

describe('OwnerdetailsComponent', () => {
  let component: OwnerdetailsComponent;
  let fixture: ComponentFixture<OwnerdetailsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OwnerdetailsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OwnerdetailsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
