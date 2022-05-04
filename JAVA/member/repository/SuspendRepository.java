package jejufriends.member.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import jejufriends.member.domain.Member;
import jejufriends.member.domain.TabooContainsMember;

@Repository
public interface SuspendRepository {
	Integer suspendAccount(Long idNumber);
	Integer suspendAccountEnable(Long idNumber);
	Integer cautionAccount(Long idNumber);
	Integer cautionAccountMinus(Long idNumber);
	Member findMember(Long idNumber);
	Integer tabooContainsMemberForDefaultNickNameChange(List<TabooContainsMember> memberList);
	List<TabooContainsMember> tabooContainsMemberForDefaultNickNameChangeCaution3SuspendAccount(List<TabooContainsMember> memberList);
	Integer cautionCount3Account(Long idNumber);
}
