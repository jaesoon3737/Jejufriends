package jejufriends.member.service;

import org.springframework.stereotype.Service;

import jejufriends.member.domain.WithDrawMemberClear;
import jejufriends.member.repository.MemberPageRepository;
import jejufriends.member.repository.WithDrawDeleteUserRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class WithDrawAccountServiceImpl implements WithDrawAccountService {
	
	private final MemberPageRepository memberPageRepository;
	private final WithDrawDeleteUserRepository withDrawDeleteUserRepository;
	
	@Override
	public Integer insertWithDrawAccount(String email) {
		return memberPageRepository.insertWithDrawAccount(email);
	}
	@Override
	public Integer updateWithDrawAccount(String email) {
		return memberPageRepository.updateWithDrawAccount(email);
	}
	@Override
	public Integer deleteRollback(WithDrawMemberClear withDrawMemberClear) {
		 Integer result = withDrawDeleteUserRepository.deleteRollbackAuthority(withDrawMemberClear);
		 String email = withDrawMemberClear.getEmail();
		 withDrawDeleteUserRepository.deleteWithDrawMember(email);
		 withDrawDeleteUserRepository.deleteRollbackUpdateAccount(withDrawMemberClear);
		return result;
	}

}
