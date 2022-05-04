package jejufriends.member.service;

import java.util.List;

import jejufriends.member.domain.Member;
import jejufriends.member.domain.TabooContainsMember;

public interface  SuspendAccountService {
	Integer suspendAccount(Long idNumber , Integer enabled);
	Integer cautionAccount(Long idNumber);
	Member findMember(Long idNumber);
	Integer tabooContainsMemberForDefaultNickNameChange(List<TabooContainsMember> memberList);
	
}
