package jejufriends.member.domain;



import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@ToString
public class TabooContainsMember {
	
	private Long idNumber;
	private String email;
	private Integer enabled;
	private Integer cautionCount;
	private String nickName;
	
	public TabooContainsMember(Long idNumber, String email, Integer enabled, Integer cautionCount, String nickName) {
		super();
		this.idNumber = idNumber;
		this.email = email;
		this.enabled = enabled;
		this.cautionCount = cautionCount;
		this.nickName = nickName;
	}

	
	
	
}
