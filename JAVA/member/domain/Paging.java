package jejufriends.member.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class Paging {
	
	private int nowPage;
	private int startPage;
	private int endPage;
	private int	total;
	private int cntPerPage;
	private int lastPage; 
	private int start;
	private int end;
	private int cntPage = 5;
	private String keyword;
	private String catgo = "idNumber";
	private String sqlkeyword = "";
	private String sqlcatgo = "idNumber";
	private String columnOrderBy;
	
	
	
	public Paging(int total, int nowPage, int cntPerPage, String catgo , String keyword , String columnOrderBy) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
		setCatgo(catgo);
		setKeyword(keyword);
		setColumnOrderBy(columnOrderBy);
	}
	
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage);
		setStart(getEnd() - cntPerPage + 1);
	}
	
	

	public void setCatgo(String catgo) {
		if(catgo == null || catgo.equals(sqlcatgo)) {	
				this.catgo = sqlcatgo;
				setSqlcatgo(catgo); 
			} else {
				setSqlcatgo(catgo); 
				this.catgo = catgo;
		}
	}
	
	
	public void setKeyword(String keyword) {
		if(keyword == null || keyword.equals("")) {	
			setSqlkeyword("%%");
		} else {
			setSqlkeyword(keyword);
			this.keyword = keyword;
		}
	}
	
	
}
