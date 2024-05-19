package com.diziman.backend.controller;

import com.diziman.backend.model.Tithe;
import com.diziman.backend.service.TitheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/tithe")
public class TitheController {

    @Autowired
    private TitheService titheService;

    @PostMapping
    public ResponseEntity<Tithe> addTithe(@RequestBody Tithe tithe){
        Tithe saveTithe = titheService.addTithe(tithe);
        return ResponseEntity.ok(saveTithe);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Tithe> getTitheById(@PathVariable Long id) {
        Tithe tithe = titheService.getTitheById(id);
        if (tithe != null) {
            return ResponseEntity.ok(tithe);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping
    public ResponseEntity<Page<Tithe>> getAllTithesPaged(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {
        Page<Tithe> tithes = titheService.getAllTithe(PageRequest.of(page, size));
        return ResponseEntity.ok(tithes);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Tithe> updateTithe(@PathVariable Long id, @RequestBody Tithe titheDetails) {
        Tithe updateTithe = titheService.updateTithe(id, titheDetails);
        if (updateTithe != null) {
            return ResponseEntity.ok(updateTithe);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteTithe(@PathVariable Long id) {
        boolean isDeleted = titheService.deleteTithe(id);
        if (isDeleted) {
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
