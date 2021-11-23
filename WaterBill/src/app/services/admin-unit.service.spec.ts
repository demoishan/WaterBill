import { TestBed } from '@angular/core/testing';

import { AdminUnitService } from './admin-unit.service';

describe('AdminUnitService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: AdminUnitService = TestBed.get(AdminUnitService);
    expect(service).toBeTruthy();
  });
});
