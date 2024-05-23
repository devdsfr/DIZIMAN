import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ViewOfferingComponent } from './view-offering.component';

describe('ViewOfferingComponent', () => {
  let component: ViewOfferingComponent;
  let fixture: ComponentFixture<ViewOfferingComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [ViewOfferingComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(ViewOfferingComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
