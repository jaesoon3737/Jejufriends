package jejufriends.member.domain;

import java.util.List;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class QnaListResult {
	private List<Qna> list;
	private int cp;
	private int ps;
	private Integer totalCount;
	private long totalPageCount;
	
	public QnaListResult(int cp, Integer totalCount, int ps, List<Qna> list) {
		this.cp = cp;
		this.totalCount = totalCount;
		this.ps = ps;
		this.list = list;
		this.totalPageCount = calTotalPageCount();
	}
	private long calTotalPageCount() {
		long tpc = totalCount/ps;
		if(totalCount%ps != 0) tpc++;
		
		return tpc;
	}
}
