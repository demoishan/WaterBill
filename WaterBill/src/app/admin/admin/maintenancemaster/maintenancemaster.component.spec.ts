import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { MaintenancemasterComponent } from './maintenancemaster.component';

describe('MaintenancemasterComponent', () => {
  let component: MaintenancemasterComponent;
  let fixture: ComponentFixture<MaintenancemasterComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ MaintenancemasterComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(MaintenancemasterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
