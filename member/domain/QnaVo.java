package jejufriends.member.domain;

import lombok.AllArgsConstructor;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
public class QnaVo {
	private int cp = 1; 
	private int ps = 10; 
	private String surf; 

	public int getStartRow() {
		return (cp-1)*ps; //
	}
	public int getEndRow() {
		return cp*ps; //
	}
	public String getSurf() {
		return surf;
	}
}
