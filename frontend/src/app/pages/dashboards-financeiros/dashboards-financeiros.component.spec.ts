import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DashboardsFinanceirosComponent } from './dashboards-financeiros.component';

describe('DashboardsFinanceirosComponent', () => {
  let component: DashboardsFinanceirosComponent;
  let fixture: ComponentFixture<DashboardsFinanceirosComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [DashboardsFinanceirosComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(DashboardsFinanceirosComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
