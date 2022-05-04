package jejufriends.member.service;

import jejufriends.member.domain.WithDrawMemberClear;

public interface WithDrawAccountService {
	Integer insertWithDrawAccount(String email);
	Integer updateWithDrawAccount(String email);
	Integer deleteRollback(WithDrawMemberClear withDrawMemberClear);
}
