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

    public Tithe addTithe(Tithe tithe) {
        if(tithe.getMember() != null && tithe.getMember().getId() != null) {
            Member member = memberRepository.findById(tithe.getMember().getId())
                    .orElseThrow(() -> new RuntimeException("Member not found"));
            tithe.setMember(member);
        }
        return titheRepository.save(tithe);
    }

    public Tithe getTitheById(Long id) {
        return titheRepository.findById(id).orElse(null);
    }

    public Page<Tithe> getAllTithe(PageRequest pageRequest) {
        return titheRepository.findAll(pageRequest);
    }

    public Tithe updateTithe(Long id, Tithe titheDetails) {
        return titheRepository.findById(id).map(tithe -> {
            tithe.setValue(titheDetails.getValue());
            tithe.setTitheDate(titheDetails.getTitheDate());
            return titheRepository.save(tithe);
        }).orElse(null);
    }

    public boolean deleteTithe(Long id) {
        return titheRepository.findById(id).map(tithe -> {
            titheRepository.delete(tithe);
            return true;
        }).orElse(false);
    }
}
