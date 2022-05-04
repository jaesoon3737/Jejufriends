package jejufriends.member.repository;



import java.util.List;

import org.springframework.stereotype.Repository;

import jejufriends.member.domain.WithDrawMember;
import jejufriends.member.domain.WithDrawMemberClear;

@Repository
public interface WithDrawDeleteUserRepository {
	void updateCount();
	List<WithDrawMember> selectCount();
	Integer deleteWithDrawMember(String email);
	String selectPwd(String email);
	Integer deleteRollbackAuthority(WithDrawMemberClear withDrawMemberClear);
	Integer deleteRollbackUpdateAccount(WithDrawMemberClear withDrawMemberClear);
}
