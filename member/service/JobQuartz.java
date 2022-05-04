package jejufriends.member.service;

import java.util.List;

import org.springframework.stereotype.Service;

import jejufriends.member.domain.WithDrawMember;
import jejufriends.member.repository.WithDrawDeleteUserRepository;
import lombok.RequiredArgsConstructor;

@Service("jobQuartzService")
@RequiredArgsConstructor
public class JobQuartz implements JobQuartzService{
	
	
	private final MemberPageService memberPageService;
	private final WithDrawDeleteUserRepository withDrawDeleteUserRepository;
	/**
	 *  매일 오전 1시에 돌아가는 스케줄 
	 */
	public void withDrawDeleteUser() {
		withDrawDeleteUserRepository.updateCount();
		List<WithDrawMember> withDrawMemberList =  withDrawDeleteUserRepository.selectCount();
		
		for(WithDrawMember withDrawMember : withDrawMemberList) {
			int resultCount = withDrawMember.getDateCount();
			String email = withDrawMember.getEmail();
			if(resultCount >= 7 ) {
				// member table
				memberPageService.userDelete(email);
				// withDraw table
				withDrawDeleteUserRepository.deleteWithDrawMember(email);
				
			}
		}
	}
}
