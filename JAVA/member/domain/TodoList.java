package jejufriends.member.domain;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class TodoList {
	
	private Integer todoListNum;
	private String email;
	private String startDate;
	private String endDate;
	private String content;
	private String publicCheck;
	private String estimatedTimeRemaining;
	
	public TodoList(String email, String startDate, String endDate, String content, String publicCheck) {
		super();
		this.email = email;
		this.startDate = startDate;
		this.endDate = endDate;
		this.content = content;
		this.publicCheck = publicCheck;
	}

	public TodoList(Integer todoListNum, String email, String startDate, String endDate, String content,
			String publicCheck) {
		super();
		this.todoListNum = todoListNum;
		this.email = email;
		this.startDate = startDate;
		this.endDate = endDate;
		this.content = content;
		this.publicCheck = publicCheck;
	}
	
	
}
