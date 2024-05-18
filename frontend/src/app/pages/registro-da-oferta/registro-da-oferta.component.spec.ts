import { ComponentFixture, TestBed } from '@angular/core/testing';

import { RegistroDaOfertaComponent } from './registro-da-oferta.component';

describe('RegistroDaOfertaComponent', () => {
  let component: RegistroDaOfertaComponent;
  let fixture: ComponentFixture<RegistroDaOfertaComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      imports: [RegistroDaOfertaComponent]
    })
    .compileComponents();
    
    fixture = TestBed.createComponent(RegistroDaOfertaComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
