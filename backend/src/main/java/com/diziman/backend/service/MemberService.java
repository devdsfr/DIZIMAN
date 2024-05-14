package com.diziman.backend.service;

import com.diziman.backend.model.Member;
import com.diziman.backend.repository.MemberRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
public class MemberService {

    @Autowired
    private MemberRepository memberRepository;

    public Member addMember(Member member) {
        // Aqui você pode adicionar qualquer lógica de negócios necessária antes de salvar o membro
        return memberRepository.save(member);
    }

    public Member getMemberById(Long id) {
        return memberRepository.findById(id).orElse(null);
    }

    public Page<Member> getAllMembers(Pageable pageable) {
        return memberRepository.findAll(pageable);
    }

    public Member updateMember(Long id, Member memberDetails) {
        return memberRepository.findById(id).map(member -> {
            member.setName(memberDetails.getName());
            member.setGender(memberDetails.getGender());
            member.setBirthDate(memberDetails.getBirthDate());
            member.setProfile(memberDetails.getProfile());
            member.setLogin(memberDetails.getLogin());
            member.setCity(memberDetails.getCity());
            member.setState(memberDetails.getState());
            member.setZipCode(memberDetails.getZipCode());
            member.setAddress(memberDetails.getAddress());
            return memberRepository.save(member);
        }).orElse(null);
    }

    public boolean deleteMember(Long id) {
        return memberRepository.findById(id).map(member -> {
            memberRepository.delete(member);
            return true;
        }).orElse(false);
    }
}
