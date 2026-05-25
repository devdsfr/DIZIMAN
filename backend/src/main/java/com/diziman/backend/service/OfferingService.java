package com.diziman.backend.service;

import com.diziman.backend.model.Member;
import com.diziman.backend.model.Offering;
import com.diziman.backend.repository.MemberRepository;
import com.diziman.backend.repository.OfferingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
public class OfferingService {

    @Autowired
    private OfferingRepository offeringRepository;

    @Autowired
    private MemberRepository memberRepository;

    public Offering addOffering(Offering offering, String owner) {
        offering.setOwner(owner);
        if (offering.getMember() != null && offering.getMember().getId() != null) {
            Member member = memberRepository.findById(offering.getMember().getId())
                    .orElseThrow(() -> new RuntimeException("Member not found"));
            offering.setMember(member);
        }
        return offeringRepository.save(offering);
    }

    public Offering getOfferingById(Long id, String owner) {
        return offeringRepository.findByIdAndOwnerOrLegacy(id, owner).orElse(null);
    }

    public Page<Offering> getAllOfferings(PageRequest pageRequest, String owner) {
        return offeringRepository.findByOwnerOrLegacy(owner, pageRequest);
    }

    public Offering updateOffering(Long id, Offering offeringDetails, String owner) {
        return offeringRepository.findByIdAndOwnerOrLegacy(id, owner).map(offering -> {
            offering.setChurchProject(offeringDetails.getChurchProject());
            offering.setValue(offeringDetails.getValue());
            if (offering.getOwner() == null) offering.setOwner(owner);
            return offeringRepository.save(offering);
        }).orElse(null);
    }

    public boolean deleteOffering(Long id, String owner) {
        return offeringRepository.findByIdAndOwnerOrLegacy(id, owner).map(offering -> {
            offeringRepository.delete(offering);
            return true;
        }).orElse(false);
    }
}
