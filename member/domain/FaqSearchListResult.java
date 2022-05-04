package jejufriends.member.domain;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
//AllArgsConstructor瑜� �븞�벖 �씠�쑀�뒗 �떎瑜� �븷�뱾�� FaqServiceImpl�뿉�꽌 �꽆�뼱�삩 媛믪쑝濡� 珥덇린�솕�릺吏�留�, calTotalPageCount�쓽 寃곌낵媛믪씠 totalPageCount�뿉 珥덇린�솕 �릺�뼱�빞 �븯湲� �뻹臾�
public class FaqSearchListResult {
	private List<Faq> list;
	private int cp;
	private int ps;
	private Integer totalCount;
	private long totalPageCount;
	private String surf;
	private String search_key;
	
	public FaqSearchListResult(int cp, Integer totalCount, int ps, List<Faq> list, String surf, String search_key) {
		this.cp = cp;
		this.totalCount = totalCount;
		this.ps = ps;
		this.list = list;
		this.surf = surf;
		this.search_key = search_key;
		this.totalPageCount = calTotalPageCount();
	}
	private long calTotalPageCount() {
		long tpc = totalCount/ps;
		if(totalCount%ps != 0) tpc++;
		return tpc;
	}
}
