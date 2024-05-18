package com.diziman.backend.controller;

import com.diziman.backend.model.Offering;
import com.diziman.backend.service.OfferingService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class OfferingControllerTest {

    @Mock
    private OfferingService offeringService;

    @InjectMocks
    private OfferingController offeringController;

    private Offering offering;

    @BeforeEach
    void setUp() {
        offering = new Offering();
        offering.setId(1L);
        offering.setValue(100.0);
        offering.setChurchProject("New Roof");
        offering.setOfferingDate(new Date());
        // Configure other properties and relations as needed
    }

    @Test
    void addOfferingTest() {
        when(offeringService.addOffering(any(Offering.class))).thenReturn(offering);
        ResponseEntity<Offering> response = offeringController.addOffering(new Offering());

        assertNotNull(response.getBody());
        assertEquals(response.getStatusCodeValue(), 200);
        assertEquals(response.getBody().getId(), 1L);
    }

    @Test
    void getOfferingByIdTest() {
        when(offeringService.getOfferingById(1L)).thenReturn(offering);
        ResponseEntity<Offering> response = offeringController.getOfferingById(1L);

        assertNotNull(response.getBody());
        assertEquals(response.getStatusCodeValue(), 200);
        assertEquals(response.getBody().getId(), offering.getId());
    }

    @Test
    void updateOfferingTest() {
        when(offeringService.updateOffering(eq(1L), any(Offering.class))).thenReturn(offering);
        ResponseEntity<Offering> response = offeringController.updateOffering(1L, new Offering());

        assertNotNull(response.getBody());
        assertEquals(response.getStatusCodeValue(), 200);
    }

    @Test
    void deleteOfferingTest() {
        when(offeringService.deleteOffering(1L)).thenReturn(true);
        ResponseEntity<Void> response = offeringController.deleteOffering(1L);

        assertEquals(response.getStatusCodeValue(), 200);
    }

    @Test
    void getAllOfferingsPagedTest() {
        List<Offering> allOfferings = Arrays.asList(offering);
        Page<Offering> pageOfferings = new PageImpl<>(allOfferings, PageRequest.of(0, 10), allOfferings.size());

        when(offeringService.getAllOfferings(any(PageRequest.class))).thenReturn(pageOfferings);

        ResponseEntity<Page<Offering>> response = offeringController.getAllOfferingsPaged(0, 10);

        assertNotNull(response.getBody());
        assertEquals(response.getStatusCodeValue(), 200);
        assertEquals(response.getBody().getTotalElements(), 1);
        assertEquals(response.getBody().getContent().size(), 1);
        assertTrue(response.getBody().getContent().contains(offering));
    }


}
