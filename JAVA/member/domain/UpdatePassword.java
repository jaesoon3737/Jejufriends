package jejufriends.member.domain;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@Getter
@Setter
@ToString
public class UpdatePassword {
	
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{10,200}$" , message="특수문자,영어,숫자 를 조합하여 10~20자리를 입력하세요")
	@NotEmpty(message="필수 입력 항목입니다.")
	private String pwd;
	
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{10,200}$" , message="특수문자,영어,숫자 를 조합하여 10~20자리를 입력하세요")
	@NotEmpty(message="필수 입력 항목입니다.")
	private String newPwd;
	private String email;
	
	
	
	
	public UpdatePassword(
			@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{10,200}$", message = "특수문자,영어,숫자 를 조합하여 10~20자리를 입력하세요") @NotEmpty(message = "필수 입력 항목입니다.") String pwd,
			@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{10,200}$", message = "특수문자,영어,숫자 를 조합하여 10~20자리를 입력하세요") @NotEmpty(message = "필수 입력 항목입니다.") String newPwd,
			String email) {
		super();
		this.pwd = pwd;
		this.newPwd = newPwd;
		this.email = email;
	}




	public UpdatePassword(
			@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{10,200}$", message = "특수문자,영어,숫자 를 조합하여 10~20자리를 입력하세요") @NotEmpty(message = "필수 입력 항목입니다.") String pwd,
			@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{10,200}$", message = "특수문자,영어,숫자 를 조합하여 10~20자리를 입력하세요") @NotEmpty(message = "필수 입력 항목입니다.") String newPwd) {
		super();
		this.pwd = pwd;
		this.newPwd = newPwd;
	}
		
		
}
