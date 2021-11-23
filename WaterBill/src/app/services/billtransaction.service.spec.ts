import { TestBed } from '@angular/core/testing';

import { BilltransactionService } from './billtransaction.service';

describe('BilltransactionService', () => {
  beforeEach(() => TestBed.configureTestingModule({}));

  it('should be created', () => {
    const service: BilltransactionService = TestBed.get(BilltransactionService);
    expect(service).toBeTruthy();
  });
});
