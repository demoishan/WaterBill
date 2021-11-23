import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { BulkunitsComponent } from './bulkunits.component';

describe('BulkunitsComponent', () => {
  let component: BulkunitsComponent;
  let fixture: ComponentFixture<BulkunitsComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ BulkunitsComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(BulkunitsComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
