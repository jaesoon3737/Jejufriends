package jejufriends.member.domain;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class WithDrawMemberClear {
	
	String email;
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{10,200}$" , message="특수문자,영어,숫자 를 조합하여 10~20자리를 입력하세요")
	@NotEmpty(message="필수 입력 항목입니다.")
	String pwd;
}
