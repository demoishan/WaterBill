import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminunitsComponent } from './adminunits.component';

describe('AdminunitsComponent', () => {
  let component: AdminunitsComponent;
  let fixture: ComponentFixture<AdminunitsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AdminunitsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminunitsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
