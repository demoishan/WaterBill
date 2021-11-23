import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { OwnermasterComponent } from './ownermaster.component';

describe('OwnermasterComponent', () => {
  let component: OwnermasterComponent;
  let fixture: ComponentFixture<OwnermasterComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ OwnermasterComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(OwnermasterComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
