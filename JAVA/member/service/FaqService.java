package jejufriends.member.service;

import java.util.List;

import jejufriends.member.domain.Faq;
import jejufriends.member.domain.FaqListResult;
import jejufriends.member.domain.FaqSearchListResult;



public interface FaqService {
	FaqListResult getFaqListResult(int cp, int ps);
	Faq getFaq(long seq);
	
	void write(Faq faq);
	void edit(Faq faq);
	void remove(long seq);
	FaqSearchListResult getFaqSearchListResult(int cp, int ps, String surf, String search_key);
	List<Faq> selectBySubject(String surf);
	List<Faq> selectByContent(String surf);
}
