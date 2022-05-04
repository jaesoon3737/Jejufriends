package jejufriends.member.repository;

import java.util.List;

import jejufriends.member.domain.Faq;
import jejufriends.member.domain.FaqVo;


public interface FaqMapper {
	List<Faq> selectPerPage(FaqVo faqVo);
	Faq selectBySeq(long seq);
	Integer selectCount();
	Integer searchSelectSubjectCount(String surf);
	Integer searchSelectContentCount(String surf);
	
	List<Faq> list();
	void insert(Faq faq);
	void update(Faq faq);
	void delete(long seq);
	void hits(long seq);
	List<Faq> selectSearchSubject(FaqVo faqVo);
	List<Faq> selectSearchContent(FaqVo faqVo);
	List<Faq> selectBySubject(String surf);
	List<Faq> selectByContent(String surf);
}
