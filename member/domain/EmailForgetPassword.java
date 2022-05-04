package jejufriends.member.domain;

import javax.validation.constraints.Email;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class EmailForgetPassword{
	
	@Email(message="이메일을 정확히 입력하세요")
	private String email;

	public EmailForgetPassword(@Email(message = "이메일을 정확히 입력하세요") String email) {
		super();
		this.email = email;
	}
	
	
}
