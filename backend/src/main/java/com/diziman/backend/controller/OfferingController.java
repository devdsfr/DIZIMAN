package com.diziman.backend.controller;

import com.diziman.backend.model.Offering;
import com.diziman.backend.repository.OfferingRepository;
import com.diziman.backend.service.OfferingService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/api/offering")
public class OfferingController {

    @Autowired
    private OfferingService offeringService;

    @PostMapping
    public ResponseEntity<Offering> addOffering(@RequestBody Offering offering){
        Offering saveOffering = offeringService.addOffering(offering);
        return ResponseEntity.ok(saveOffering);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Offering> getOfferingById(@PathVariable Long id) {
        Offering offering = offeringService.getOfferingById(id);
        if (offering != null) {
            return ResponseEntity.ok(offering);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @GetMapping
    public ResponseEntity<Page<Offering>> getAllOfferingsPaged(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "10") int size) {
        Page<Offering> offerings = offeringService.getAllOfferings(PageRequest.of(page, size));
        return ResponseEntity.ok(offerings);
    }

    @PutMapping("/{id}")
    public ResponseEntity<Offering> updateOffering(@PathVariable Long id, @RequestBody Offering offeringDetails) {
        Offering updateOffering = offeringService.updateOffering(id, offeringDetails);
        if (updateOffering != null) {
            return ResponseEntity.ok(updateOffering);
        } else {
            return ResponseEntity.notFound().build();
        }
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteOffering(@PathVariable Long id) {
        boolean idDeleted = offeringService.deleteOffering(id);
        if (idDeleted) {
            return ResponseEntity.ok().build();
        } else {
            return ResponseEntity.notFound().build();
        }
    }
}
