package jejufriends.member.domain;


import java.time.LocalDateTime;
import java.util.Date;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class AdminUserInfo {
	private Long idNumber;
	private String email;
	private String name;
	private String nickName;
	private String phoneNumber;
	private String gender;
	private Integer enabled;
	private Integer checkSnsId;
	private String grade;
	private Date registRationDate; 
	private Date lastDate;
	private String authority;
	private String lastDateString;
	private String registRationDateString;
	
	public AdminUserInfo(Long idNumber, String email, String name, String nickName, String phoneNumber, String gender,
			Integer enabled, Integer checkSnsId, String grade, Date registRationDate, Date lastDate, String authority) {
		super();
		this.idNumber = idNumber;
		this.email = email;
		this.name = name;
		this.nickName = nickName;
		this.phoneNumber = phoneNumber;
		this.gender = gender;
		this.enabled = enabled;
		this.checkSnsId = checkSnsId;
		this.grade = grade;
		this.registRationDate = registRationDate;
		this.lastDate = lastDate;
		this.authority = authority;
	}

	public AdminUserInfo(Long idNumber, String email, String name, String nickName, String phoneNumber, String gender,
			Integer enabled, Integer checkSnsId, String grade, Date registRationDate, Date lastDate, String authority,
			String lastDateString, String registRationDateString) {
		super();
		this.idNumber = idNumber;
		this.email = email;
		this.name = name;
		this.nickName = nickName;
		this.phoneNumber = phoneNumber;
		this.gender = gender;
		this.enabled = enabled;
		this.checkSnsId = checkSnsId;
		this.grade = grade;
		this.registRationDate = registRationDate;
		this.lastDate = lastDate;
		this.authority = authority;
		this.lastDateString = lastDateString;
		this.registRationDateString = registRationDateString;
	}


	
	
}
