package jejufriends.member.domain;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data//�꽭�꽣,寃뚰꽣 �엳�떎怨� �깮媛�
@NoArgsConstructor
@AllArgsConstructor
public class Faq {//�뿬湲곗꽌 蹂대뱶�뒗 蹂대뱶留ㅽ띁�뿊�뒪�뿞�뿕�쓽 �뙆�씪誘명꽣�씠�떎.
	private long seq;
	private String writer;
	private String subject;
	private String content;
	private Date rdate;
	private long rnum;
	private long hits;
	private String search_key;
	private String surf;
}
