package jejufriends.member.service;

import java.time.Duration;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.cglib.util.StringSwitcher;
import org.springframework.stereotype.Service;

import jdk.internal.org.jline.utils.Log;
import jejufriends.member.domain.TodoList;
import jejufriends.member.repository.AdminRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class TodoListServiceImpl implements TodoListService {
	
	private final AdminRepository adminRepository;
	
	
	@Override
	public void insert(String tododate , String email , String content , String publicCheck) {
			tododate.trim();
			String [] tododateArray = tododate.split("~");
			if(tododateArray.length >= 2) {
				String startDate = tododateArray[0];
				String endDate = tododateArray[1];
				TodoList todolist = new TodoList(email , startDate , endDate , content , publicCheck);
				adminRepository.insertTodoList(todolist);
			} else {
				String startDate = tododateArray[0];
				String endDate = tododateArray[0];
				TodoList todolist = new TodoList(email , startDate , endDate , content , publicCheck);
				adminRepository.insertTodoList(todolist);
			}
		
	}


	@Override
	public List<TodoList> adminCalenderSelect() {
		List<TodoList> list = adminRepository.adminCalenderSelect();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss.SSS");
		for(TodoList todoList : list) {
			LocalDateTime currentDateTime = LocalDateTime.now();
			String endDate = todoList.getEndDate();	
			endDate = endDate.trim();
			StringBuilder sb = new StringBuilder();
			sb.append(endDate);
			sb.append(":00.000");
			endDate = sb.toString();
			LocalDateTime endDateTime = LocalDateTime.parse(endDate, formatter);
			// false -> 삭제처리 지금시간 보다 end가 늦게 찍힌다면,
			if(currentDateTime.isAfter(endDateTime)) {
				log.info("넘어서 삭제됩니다. ={}" , currentDateTime);
				log.info("넘어서 삭제됩니다. ={}" , endDateTime);
				Integer TodoListNum = todoList.getTodoListNum();
				deleteTodoList(TodoListNum);
			} else {
				Duration duration = Duration.between(currentDateTime, endDateTime);
				long timeSeconds = duration.getSeconds();
				int day = (int) timeSeconds/((60*60)*24);
		        int hour = (int) timeSeconds/(60*60)-(day*24);
		        int minute = (int) (timeSeconds - day * 60 * 60 * 24 - hour * 3600)/60;
		        int second = (int) timeSeconds%60;
		        
		        StringBuilder sbEstimatedTimeRemaining = new StringBuilder();
		        sbEstimatedTimeRemaining.append(day);
		        sbEstimatedTimeRemaining.append("일");
		        sbEstimatedTimeRemaining.append(hour);
		        sbEstimatedTimeRemaining.append(" : ");
		        sbEstimatedTimeRemaining.append(minute);
		        sbEstimatedTimeRemaining.append(" : ");
		        sbEstimatedTimeRemaining.append(second);
		        String estimatedTimeRemaining = sbEstimatedTimeRemaining.toString();
		        todoList.setEstimatedTimeRemaining(estimatedTimeRemaining);
			} 
		

		}
		return list;
	}


	@Override
	public Integer deleteTodoList(Integer deleteTodoListNumber) {
		Integer result =  adminRepository.deleteTodoList(deleteTodoListNumber);
		return result;
	}

}
