import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RegistroDoDizimoComponent } from './registro-do-dizimo.component';

describe('RegistroDoDizimoComponent', () => {
  let component: RegistroDoDizimoComponent;
  let fixture: ComponentFixture<RegistroDoDizimoComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [RegistroDoDizimoComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(RegistroDoDizimoComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
