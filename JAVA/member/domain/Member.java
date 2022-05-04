package jejufriends.member.domain;

import java.util.Date;

import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.PastOrPresent;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;


import org.springframework.format.annotation.DateTimeFormat;


import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class Member {
	
	private Long idNumber;
	@NotEmpty(message="필수 입력 항목입니다.")
	private String email;
	
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{10,200}$" , message="특수문자,영어,숫자 를 조합하여 10~20자리를 입력하세요")
	@NotEmpty(message="필수 입력 항목입니다.")
	private String pwd;
	@NotEmpty(message="필수 입력 항목입니다.")
	@Size(min=3 , message="3글자 이상 입력하세요.")
	private String nickName;
	@NotEmpty(message="필수 입력 항목입니다.")
	private String name;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	@PastOrPresent( message="올바른 생일을 입력해주세요.")
	@NotNull( message="필수 입력 항목입니다.")
	private Date birth;
	
	@Pattern(regexp = "^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$" , message="휴대폰번호를 입력하세요")
	@NotNull( message="필수 입력 항목입니다.")
	private String phoneNumber;
	@NotEmpty(message="필수 입력 항목입니다.")
	private String gender;
	private Integer enabled;
	private Integer cautionCount;
    private Integer checkSnsId;
	
	public Member(String email , String pwd) {
		this.email = email;
		this.pwd = pwd;
	}
	

	
	
	public Member( String email, String pwd, String nickName, String name, Date birth,
			String phoneNumber, String gender, Integer enabled , Integer checkSnsId) {
		super();
		this.email = email;
		this.pwd = pwd;
		this.nickName = nickName;
		this.name = name;
		this.birth = birth;
		this.phoneNumber = phoneNumber;
		this.gender = gender;
		this.enabled = enabled;
		this.checkSnsId = checkSnsId;
	}
	
	
	public Member(Long idNumber, String email, String pwd, String nickName, String name, Date birth,
			String phoneNumber, String gender, Integer enabled , Integer checkSnsId) {
		super();
		this.idNumber = idNumber;
		this.email = email;
		this.pwd = pwd;
		this.nickName = nickName;
		this.name = name;
		this.birth = birth;
		this.phoneNumber = phoneNumber;
		this.gender = gender;
		this.enabled = enabled;
		this.checkSnsId = checkSnsId;
	}
}
