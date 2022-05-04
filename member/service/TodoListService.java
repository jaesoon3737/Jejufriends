package jejufriends.member.service;

import java.util.List;

import jejufriends.member.domain.TodoList;

public interface TodoListService {
	void insert(String tododate ,String email , String content, String publicCheck);
	List<TodoList> adminCalenderSelect();
	Integer deleteTodoList(Integer deleteTodoListNumber);
}
