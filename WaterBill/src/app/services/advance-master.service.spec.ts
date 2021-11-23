import { TestBed } from '@angular/core/testing';

import { AdvanceMasterService } from './advance-master.service';

describe('AdvanceMasterService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: AdvanceMasterService = TestBed.get(AdvanceMasterService);
    expect(service).toBeTruthy();
  });
});
