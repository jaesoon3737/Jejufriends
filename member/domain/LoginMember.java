package jejufriends.member.domain;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@Getter
@Setter
@NoArgsConstructor
@ToString
public class LoginMember {
	
	@NotEmpty(message="필수 입력 항목입니다.")
	@Email(message="이메일로 로그인하세요.")
	private String email;
	@NotEmpty(message ="필수 입력 항목입니다.")
	private String pwd;
	
	public LoginMember(String email, String pwd) {
		super();
		this.email = email;
		this.pwd = pwd;
	}
	
	
}
