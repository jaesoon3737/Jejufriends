package jejufriends.member.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jejufriends.member.domain.Faq;
import jejufriends.member.domain.FaqListResult;
import jejufriends.member.domain.FaqSearchListResult;
import jejufriends.member.domain.FaqVo;
import jejufriends.member.repository.FaqMapper;



@Service
public class FaqServiceImpl implements FaqService{
	@Autowired
	private FaqMapper faqMapper;
	
	@Override
	public FaqListResult getFaqListResult(int cp, int ps) {
		Integer totalCount = faqMapper.selectCount();
		if(totalCount == null) {
			totalCount = 0;
		}
		FaqVo faqVo = new FaqVo(cp, ps,"");//파라미터 3개인 이유는 FaqVo에 파라미터 3개를 가진 생성자가 있는것이다.(FaqVo.java에서 안보이는 이유는 거기에 @allargsconstructor때문에 안보일 뿐이다)
		List<Faq> list = faqMapper.selectPerPage(faqVo);
		return new FaqListResult(cp, totalCount, ps, list);		
	}
	@Override
	public Faq getFaq(long seq) {
		faqMapper.hits(seq);
		Faq faq = faqMapper.selectBySeq(seq);
		return faq; //위 두줄을 실행하고나서 갱신된 faq를 가지고 Faq getFaq(long seq)를 호출한 곳으로 돌아간다(컨트롤러로)
	}
	@Override
	public void write(Faq faq) {
		faqMapper.insert(faq);	
	}
	@Override
	public void edit(Faq faq) {
		faqMapper.update(faq);	
	}
	@Override
	public void remove(long seq) {
		faqMapper.delete(seq);	
	}
	@Override
	public List<Faq> selectBySubject(String surf) {
		return faqMapper.selectBySubject(surf);
	}
	@Override
	public List<Faq> selectByContent(String surf) {
		return faqMapper.selectByContent(surf);
	}
	@Override
	public FaqSearchListResult getFaqSearchListResult(int cp, int ps, String surf, String search_key) {
		FaqVo faqVo = new FaqVo(cp, ps,surf);
		Integer totalCount;
		List<Faq> list;
		if("subject".equals(search_key)) { //콤보박스 제목,내용인지 분기 
			totalCount = faqMapper.searchSelectSubjectCount(surf);
			list = faqMapper.selectSearchSubject(faqVo);
		}else {
			totalCount = faqMapper.searchSelectContentCount(surf);
			list = faqMapper.selectSearchContent(faqVo);
		}
		if(totalCount == null) {
			totalCount = 0;
		}
		return new FaqSearchListResult(cp, totalCount, ps, list, surf, search_key);		
	}
}
