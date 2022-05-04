package jejufriends.member.domain;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class AdminMemberInfoChange {
	
	private String email;
	@Size(min=3 , message="3글자 이상 입력하세요.")
	private String nickName;
	@Pattern(regexp = "^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$" , message="휴대폰번호를 입력하세요")
	private String phoneNumber;
	@NotEmpty(message="필수 입력 항목입니다.")
	private String name;
	@NotEmpty(message="필수 입력 항목입니다.")
	private String grade;
}
