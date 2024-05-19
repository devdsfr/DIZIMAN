package com.diziman.backend.controller;

import com.diziman.backend.model.Tithe;
import com.diziman.backend.service.TitheService;
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
class TitheControllerTest {

    @Mock
    private TitheService titheService;

    @InjectMocks
    private TitheController titheController;

    private Tithe tithe;

    @BeforeEach
    void setUp() {
        tithe = new Tithe();
        tithe.setId(1L);
        tithe.setValue(200.0);
        tithe.setTitheDate(new Date());
        // You might want to set a member here if your tithe model links to a member
    }

    @Test
    void addTitheTest() {
        when(titheService.addTithe(any(Tithe.class))).thenReturn(tithe);
        ResponseEntity<Tithe> response = titheController.addTithe(new Tithe());

        assertNotNull(response.getBody());
        assertEquals(response.getStatusCodeValue(), 200);
        assertEquals(response.getBody().getId(), 1L);
    }

    @Test
    void getTitheByIdTest() {
        when(titheService.getTitheById(1L)).thenReturn(tithe);
        ResponseEntity<Tithe> response = titheController.getTitheById(1L);

        assertNotNull(response.getBody());
        assertEquals(response.getStatusCodeValue(), 200);
        assertEquals(response.getBody().getId(), tithe.getId());
    }

    @Test
    void updateTitheTest() {
        when(titheService.updateTithe(eq(1L), any(Tithe.class))).thenReturn(tithe);
        ResponseEntity<Tithe> response = titheController.updateTithe(1L, new Tithe());

        assertNotNull(response.getBody());
        assertEquals(response.getStatusCodeValue(), 200);
    }

    @Test
    void deleteTitheTest() {
        when(titheService.deleteTithe(1L)).thenReturn(true);
        ResponseEntity<Void> response = titheController.deleteTithe(1L);

        assertEquals(response.getStatusCodeValue(), 200);
    }

    @Test
    void getAllTithesPagedTest() {
        List<Tithe> allTithes = Arrays.asList(tithe);
        Page<Tithe> pageTithes = new PageImpl<>(allTithes, PageRequest.of(0, 10), allTithes.size());

        when(titheService.getAllTithe(any(PageRequest.class))).thenReturn(pageTithes);

        ResponseEntity<Page<Tithe>> response = titheController.getAllTithesPaged(0, 10);

        assertNotNull(response.getBody());
        assertEquals(response.getStatusCodeValue(), 200);
        assertEquals(response.getBody().getTotalElements(), 1);
        assertEquals(response.getBody().getContent().size(), 1);
        assertTrue(response.getBody().getContent().contains(tithe));
    }

}
