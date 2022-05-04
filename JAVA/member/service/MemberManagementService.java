package jejufriends.member.service;

import java.util.List;

import jejufriends.member.domain.AdminMemberInfoChange;
import jejufriends.member.domain.AdminUserInfo;
import jejufriends.member.domain.Paging;
import jejufriends.member.domain.PagingKeyword;


public interface MemberManagementService {
	List<AdminUserInfo> findAll(Paging paging);
	Integer countMember(PagingKeyword pagingKeyword);
	void updateLastDate(String userEmail);
	AdminUserInfo memberInfofind(String email);
	Integer memberInfoChange(AdminMemberInfoChange adminMemberInfoChange);
	Integer adminAuthority(Long idNumber , String authority);
	boolean nickNameDuplication(String nickName);
}
