package jejufriends.member.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Qna {
	private long seq;
	private long rnum;
	private String writer;
	private String email;
	private String subject;
	private String content;
	private Date rdate;
	private long hits;
	private String surf;

	private String writerEmail;
	
    private int originNo;
    private int groupOrd;
 
}
