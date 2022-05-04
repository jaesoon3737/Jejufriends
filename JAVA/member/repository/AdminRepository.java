package jejufriends.member.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import jejufriends.member.domain.AdminMemberInfoChange;
import jejufriends.member.domain.AdminUserInfo;
import jejufriends.member.domain.Member;
import jejufriends.member.domain.Paging;
import jejufriends.member.domain.PagingKeyword;
import jejufriends.member.domain.TodoList;

@Repository
public interface AdminRepository {
	List<AdminUserInfo> memberfindAll(Paging paging);
	Integer countMember(PagingKeyword pagingKeyword);
	void updateLastDate(String userEmail);
	AdminUserInfo memberInfofind(String email);
	Integer memberInfoChange(AdminMemberInfoChange adminMemberInfoChange);
	Integer memberInfoChangeGrade(AdminMemberInfoChange adminMemberInfoChange);
	Integer adminAuthorization(Long idNumber);
	Integer adminDeauthorization(Long idNumber);
	String findNickNameDuplication(String nickName);
	void insertTodoList(TodoList todolist);
	List<TodoList> adminCalenderSelect();
	Integer deleteTodoList(Integer deleteTodoListNumber);
	
}
