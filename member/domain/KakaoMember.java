package jejufriends.member.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class KakaoMember {
	
	private String username;
	private String password;
	private String nickName;
	private String name;
	private Integer checkSnsId;

	public KakaoMember(String username , String password , String nickName , String name , Integer checkSnsId) {
		this.username = username;
		this.password = password;
		this.nickName = nickName;
		this.name = name;
		this.checkSnsId = checkSnsId;
	}
}
