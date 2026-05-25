package com.diziman.backend.service;

import com.diziman.backend.model.Member;
import com.diziman.backend.model.Tithe;
import com.diziman.backend.repository.MemberRepository;
import com.diziman.backend.repository.TitheRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

@Service
public class TitheService {

    @Autowired
    private TitheRepository titheRepository;

    @Autowired
    private MemberRepository memberRepository;

    public Tithe addTithe(Tithe tithe, String owner) {
        tithe.setOwner(owner);
        if (tithe.getMember() != null && tithe.getMember().getId() != null) {
            Member member = memberRepository.findById(tithe.getMember().getId())
                    .orElseThrow(() -> new RuntimeException("Member not found"));
            tithe.setMember(member);
        }
        return titheRepository.save(tithe);
    }

    public Tithe getTitheById(Long id, String owner) {
        return titheRepository.findByIdAndOwnerOrLegacy(id, owner).orElse(null);
    }

    public Page<Tithe> getAllTithe(PageRequest pageRequest, String owner) {
        return titheRepository.findByOwnerOrLegacy(owner, pageRequest);
    }

    public Tithe updateTithe(Long id, Tithe titheDetails, String owner) {
        return titheRepository.findByIdAndOwnerOrLegacy(id, owner).map(tithe -> {
            tithe.setValue(titheDetails.getValue());
            tithe.setTitheDate(titheDetails.getTitheDate());
            if (tithe.getOwner() == null) tithe.setOwner(owner);
            return titheRepository.save(tithe);
        }).orElse(null);
    }

    public boolean deleteTithe(Long id, String owner) {
        return titheRepository.findByIdAndOwnerOrLegacy(id, owner).map(tithe -> {
            titheRepository.delete(tithe);
            return true;
        }).orElse(false);
    }
}
