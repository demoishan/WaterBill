import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { AdvancepayComponent } from './advancepay.component';

describe('AdvancepayComponent', () => {
  let component: AdvancepayComponent;
  let fixture: ComponentFixture<AdvancepayComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ AdvancepayComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(AdvancepayComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
