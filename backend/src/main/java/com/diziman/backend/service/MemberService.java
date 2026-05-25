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

    public Member addMember(Member member, String owner) {
        member.setOwner(owner);
        return memberRepository.save(member);
    }

    public Member getMemberById(Long id, String owner) {
        return memberRepository.findByIdAndOwnerOrLegacy(id, owner).orElse(null);
    }

    public Page<Member> getAllMembers(Pageable pageable, String owner) {
        return memberRepository.findByOwnerOrLegacy(owner, pageable);
    }

    public Member updateMember(Long id, Member memberDetails, String owner) {
        return memberRepository.findByIdAndOwnerOrLegacy(id, owner).map(member -> {
            member.setName(memberDetails.getName());
            member.setGender(memberDetails.getGender());
            member.setBirthDate(memberDetails.getBirthDate());
            member.setProfile(memberDetails.getProfile());
            member.setLogin(memberDetails.getLogin());
            member.setCity(memberDetails.getCity());
            member.setState(memberDetails.getState());
            member.setZipCode(memberDetails.getZipCode());
            member.setAddress(memberDetails.getAddress());
            if (member.getOwner() == null) member.setOwner(owner);
            return memberRepository.save(member);
        }).orElse(null);
    }

    public boolean deleteMember(Long id, String owner) {
        return memberRepository.findByIdAndOwnerOrLegacy(id, owner).map(member -> {
 