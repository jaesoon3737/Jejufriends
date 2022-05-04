package jejufriends.member.service;

import jejufriends.member.domain.Member;

public interface SignUpMemberService {
	void addMember(Member member);
	String emailCheckSelect(String emailCheck);
	boolean signEmailCheckSelect(String email);
	boolean signNickNameCheckSelect(String nickName);
}
