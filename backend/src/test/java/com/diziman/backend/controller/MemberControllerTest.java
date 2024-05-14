package com.diziman.backend.controller;

import com.diziman.backend.model.Member;
import com.diziman.backend.service.MemberService;
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
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class MemberControllerTest {

    @Mock
    private MemberService memberService;

    @InjectMocks
    private MemberController memberController;

    private Member member;

    @BeforeEach
    void setUp() {
        member = new Member();
        member.setId(1L);
        member.setName("John Doe");
        // configure other properties as needed
    }

    @Test
    void addMemberTest() {
        when(memberService.addMember(any(Member.class))).thenReturn(member);
        ResponseEntity<Member> response = memberController.addMember(new Member());

        assertNotNull(response.getBody());
        assertEquals(response.getStatusCodeValue(), 200);
        assertEquals(response.getBody().getId(), 1L);
    }
    @Test
    void getMemberByIdTest() {
        when(memberService.getMemberById(1L)).thenReturn(member);
        ResponseEntity<Member> response = memberController.getMemberById(1L);

        assertNotNull(response.getBody());
        assertEquals(response.getStatusCodeValue(), 200);
        assertEquals(response.getBody().getId(), member.getId());
    }
    @Test
    void updateMemberTest() {
        when(memberService.updateMember(eq(1L), any(Member.class))).thenReturn(member);
        ResponseEntity<Member> response = memberController.updateMember(1L, new Member());

        assertNotNull(response.getBody());
        assertEquals(response.getStatusCodeValue(), 200);
    }
    @Test
    void deleteMemberTest() {
        when(memberService.deleteMember(1L)).thenReturn(true);
        ResponseEntity<Void> response = memberController.deleteMember(1L);

        assertEquals(response.getStatusCodeValue(), 200);
    }

    @Test
    void getAllMembersPagedTest() {
        List<Member> allMembers = Arrays.asList(member);
        Page<Member> pageMembers = new PageImpl<>(allMembers, PageRequest.of(0, 10), allMembers.size());

        when(memberService.getAllMembers(any(PageRequest.class))).thenReturn(pageMembers);

        ResponseEntity<Page<Member>> response = memberController.getAllMembersPaged(0, 10);

        assertNotNull(response.getBody());
        assertEquals(response.getStatusCodeValue(), 200);
        assertEquals(response.getBody().getTotalElements(), 1);
        assertEquals(response.getBody().getContent().size(), 1);
        assertTrue(response.getBody().getContent().contains(member));
    }
}
