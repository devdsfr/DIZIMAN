package com.diziman.backend.service;

import com.diziman.backend.model.Member;
import com.diziman.backend.model.Offering;
import com.diziman.backend.repository.MemberRepository;
import com.diziman.backend.repository.OfferingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class OfferingService {

    @Autowired
    private OfferingRepository offeringRepository;

    @Autowired
    private MemberRepository memberRepository;

    public Offering addOffering(Offering offering) {
        if (offering.getMember() != null && offering.getMember().getId() != null) {
            Member member = memberRepository.findById(offering.getMember().getId())
                    .orElseThrow(() -> new RuntimeException("Member not found"));
            offering.setMember(member);
        }
        return offeringRepository.save(offering);
    }

    public Offering getOfferingById(Long id) {
        return offeringRepository.findById(id).orElse(null);
    }

    public Page<Offering> getAllOfferings(PageRequest pageRequest) {
        return offeringRepository.findAll(pageRequest);
    }

    public Offering updateOffering(Long id, Offering offeringDetails) {
        return offeringRepository.findById(id).map(offering -> {
            offering.setChurchProject(offeringDetails.getChurchProject());
            offering.setValue(offeringDetails.getValue());
            return offeringRepository.save(offering);
        }).orElse(null);
    }

    public boolean deleteOffering(Long id) {
        return offeringRepository.findById(id).map(offering -> {
            offeringRepository.delete(offering);
            return true;
        }).orElse(false);
    }
}
