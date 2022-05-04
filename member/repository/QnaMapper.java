package jejufriends.member.repository;

import java.util.List;

import jejufriends.member.domain.Qna;
import jejufriends.member.domain.QnaVo;

public interface QnaMapper {
	List<Qna> selectPerPage(QnaVo qnaVo);
	Qna selectBySeq(long seq);
	Integer selectCount();
	Object test(String surf);
	Integer searchSelectSubjectCount(String surf);
	Integer searchSelectContentCount(String surf);
	
	List<Qna> list();
	void insert(Qna qna);
	void update(Qna qna);
	void reply(Qna qna);
	void delete(long seq);
	void hits(long seq);
	int getGroupOrd(long seq);
	List<Qna> selectSearchSubject(QnaVo qnaVo);
	List<Qna> selectSearchContent(QnaVo qnaVo);
	List<Qna> selectBySubject(String surf);
	List<Qna> selectByContent(String surf);
}
