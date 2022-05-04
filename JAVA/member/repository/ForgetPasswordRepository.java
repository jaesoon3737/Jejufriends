package jejufriends.member.repository;

import org.springframework.stereotype.Repository;

import jejufriends.member.domain.ForgetMember;



@Repository
public interface ForgetPasswordRepository {
	
	Integer findMember(String email);
	void updatePassword(ForgetMember forgetMember);
	
}
