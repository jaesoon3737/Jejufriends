package jejufriends.member.service;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jejufriends.member.domain.Qna;
import jejufriends.member.domain.QnaListResult;
import jejufriends.member.domain.QnaSearchListResult;
import jejufriends.member.domain.QnaVo;
import jejufriends.member.repository.QnaMapper;
import lombok.AllArgsConstructor;


@Service
@AllArgsConstructor//this.蹂��닔 �뱾�쓣 �깮�왂�빐二쇰뒗 @ ;ServiceImpl�븷�꽌 �꽆�뼱�삩 媛믪쑝濡� 蹂��닔媛� 媛깆떊�맖
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaMapper qnaMapper;
	
	@Override
	public QnaListResult getQnaListResult(int cp, int ps) {
		Integer totalCount = qnaMapper.selectCount();
		if(totalCount == null) {
			totalCount = 0;
		}
		QnaVo qnaVo = new QnaVo(cp, ps,"");
		List<Qna> list = qnaMapper.selectPerPage(qnaVo);
		return new QnaListResult(cp, totalCount, ps, list);		
	}
	@Override
	public Qna getQna(long seq) {
		qnaMapper.hits(seq);
		Qna qna = qnaMapper.selectBySeq(seq);
		return qna;
	}
	@Override
	public int getGroupOrd(long seq) {
		int go = qnaMapper.getGroupOrd(seq);
		return go;
	}
	@Override
	public void write(Qna qna) {
		qnaMapper.insert(qna);	
	}
	@Override
	public void edit(Qna qna) {
		qnaMapper.update(qna);	
	}
	@Override
	public void reply(Qna qna) {
		qnaMapper.reply(qna);	
	}
	@Override
	public void remove(long seq) {
		qnaMapper.delete(seq);	
	}
	@Override
	public List<Qna> selectBySubject(String surf) {
		return qnaMapper.selectBySubject(surf);
	}
	@Override
	public List<Qna> selectByContent(String surf) {
		return qnaMapper.selectByContent(surf);
	}
	@Override
	public QnaSearchListResult getQnaSearchListResult(int cp, int ps, String surf, String search_key) {
		Integer totalCount;
		QnaVo qnaVo = new QnaVo(cp, ps,surf);
		List<Qna> list;
		if("subject".equals(search_key)) {
			totalCount = qnaMapper.searchSelectSubjectCount(surf);
			list = qnaMapper.selectSearchSubject(qnaVo);
		}else {
			totalCount = qnaMapper.searchSelectContentCount(surf);

			list = qnaMapper.selectSearchContent(qnaVo);
		}
		if(totalCount == null) {
			totalCount = 0;
		}
		return new QnaSearchListResult(cp, totalCount, ps, list, surf, search_key);		
	}
	
}
