package jejufriends.member.service;


import jejufriends.member.domain.Member;
import jejufriends.member.domain.UpdatePassword;
import jejufriends.member.domain.UserInfoChange;



public interface MemberPageService {
	boolean myPagePwdCheck(String email , String pwd);
	Member userInfoSelect(String email);
	String userInfoRole(String email);
	String emailChangeStar(String email);
	String phoneNumberChangeStar(String phoneNumber);
	void updatePasswordMemberInfo(UpdatePassword updatepassword);
	String userPasswordSearch(String email);
	int userInfoUpdate(UserInfoChange userInfoChange);
	int userDelete(String email);
}
