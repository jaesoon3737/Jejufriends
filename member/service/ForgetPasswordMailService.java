package jejufriends.member.service;

import jejufriends.member.domain.ForgetMember;

public interface ForgetPasswordMailService {
	
	String joinEmail(String email , String authNum);
	void mailSend(String setFrom, String toMail, String title, String Content);
	boolean findByMember(String email);
	void updatePassword(ForgetMember forgetMember);
	
}
