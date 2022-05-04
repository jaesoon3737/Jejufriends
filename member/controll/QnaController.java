package jejufriends.member.controll;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.objenesis.instantiator.perc.PercInstantiator;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import jejufriends.member.domain.Qna;
import jejufriends.member.domain.QnaListResult;
import jejufriends.member.domain.QnaSearchListResult;
import jejufriends.member.service.QnaService;
import lombok.AllArgsConstructor;


@AllArgsConstructor
@Controller
@RequestMapping("/jejufriends/qna")
public class QnaController {
	@Autowired
	private QnaService qnaService;

	
	@Secured({"ROLE_USER" ,"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@GetMapping("/list.do")
	public ModelAndView list(HttpServletRequest request, HttpSession session) {
		
	
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		int cp = 1;
 		if(cpStr==null) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);	
		}
		session.setAttribute("cp", cp);
		
		int ps = 10;
 		if(psStr==null) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}else {
				if(ps!=psParam) {
					cp = 1;
					session.setAttribute("cp", cp);					
				}
			}
			ps = psParam;
		}
		session.setAttribute("ps", ps);
		
		QnaListResult listResult = qnaService.getQnaListResult(cp, ps);

		ModelAndView mv = new ModelAndView("qna/list", "listResult", listResult);
		
		if(listResult.getList().size() == 0) {
			if(cp > 1) 
				return new ModelAndView("redirect:list.do?cp="+(cp-1));
			else
				return new ModelAndView("qna/list", "listResult", null);
		}else {
			return mv;
		}
	}
	@Secured({"ROLE_USER" ,"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@GetMapping("/write.do")
	public String write() {
		return "qna/write";
	}
	@Secured({"ROLE_USER" ,"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@PostMapping("/write.do")
	public String write(Qna qna , Principal principal) {
		String email = principal.getName();
		qna.setEmail(email);
		qnaService.write(qna);
		return "redirect:list.do?cp=1";
	}
	@Secured({"ROLE_USER" ,"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@GetMapping("/content.do")
	public ModelAndView content(long seq) {
		Qna qna = qnaService.getQna(seq);
		
		ModelAndView mv = new ModelAndView("qna/content", "qna", qna);
		return mv;
	}
	@Secured({"ROLE_USER" ,"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@GetMapping("/update.do")
	public ModelAndView update(long seq) {
		Qna qna = qnaService.getQna(seq);
		ModelAndView mv = new ModelAndView("qna/update", "qna", qna);
		return mv;
	}
	@Secured({"ROLE_USER" ,"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@PostMapping("/update.do")
	public String update(Qna qna) {
		qnaService.edit(qna);
		return "redirect:list.do";
	}
	@Secured({"ROLE_USER" ,"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@GetMapping("/del.do")
	public String delete(long seq) {
		qnaService.remove(seq);
		return "redirect:list.do";
	}
	@Secured({"ROLE_USER" ,"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@PostMapping("autoData.json")
	public @ResponseBody List<Qna> getFaqList(String surf, String search_key){//subject�뒗 寃��깋李쎌�? �엯�젰�븳 ��?��?���듃, search_key�뒗 '�젣紐�'�씤吏� '�궡�슜'�씤吏�.
		//faq/autoData.json?subject=�궡&search_key=subject
		surf = surf.toLowerCase();
		List<Qna> list;
		if("subject".equals(search_key)) {
			list = qnaService.selectBySubject(surf);
		}else {
			list = qnaService.selectByContent(surf);
		}
		return list;
	}
	@Secured({"ROLE_USER" ,"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@GetMapping("reply.do")
	public ModelAndView reply(long seq , Principal principal) {
		Qna qna = qnaService.getQna(seq);
		String email = principal.getName();
		qna.setEmail(email);
		ModelAndView mv = new ModelAndView("qna/reply", "qna", qna);
		return mv;
	}
	@Secured({"ROLE_USER" ,"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@PostMapping("reply.do")
	public String reply(Qna qna) {
		int go = qnaService.getGroupOrd(qna.getSeq());//qna.java�뿉 媛�硫� @Data濡� 紐⑤�? 蹂��닔�뱾�쓽 寃뚰�?,�꽭�꽣媛� �븞蹂댁?��吏�留� �깮�꽦�릺�뼱�엳�떎. 洹몄�? 寃뚰꽣seq?���? 媛��졇�삩�떎�뒗 �쑜.

		qna.setGroupOrd(go+1);//qna.java �븞�뿉 setGroupOrd�뿉 �씠�윴�떇�쑝濡� 諛붾�? �뙆�씪誘명�? �븞�뿉 �뜲�씠�꽣?���? �떞�쓣 �닔 �엳�떎.
		qnaService.reply(qna);
		return "redirect:list.do";
	}
	@Secured({"ROLE_USER" ,"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@GetMapping("/search.do")
	public ModelAndView search(HttpServletRequest request, HttpSession session) {
		String cpStr = request.getParameter("cp");
		String psStr = request.getParameter("ps");
		String surf = request.getParameter("surf");
		String search_key = request.getParameter("search_key");
		//faq/search.do?search_key=subject&subject=a;
		int cp = 1;
 		if(cpStr==null) {
			Object cpObj = session.getAttribute("cp");
			if(cpObj != null) {
				cp = (Integer)cpObj;
			}
		}else {
			cpStr = cpStr.trim();
			cp = Integer.parseInt(cpStr);	
		}
		session.setAttribute("cp", cp);
		
		int ps = 10;
 		if(psStr==null) {
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				ps = (Integer)psObj;
			}
		}else {
			psStr = psStr.trim();
			int psParam = Integer.parseInt(psStr);
			
			Object psObj = session.getAttribute("ps");
			if(psObj != null) {
				int psSession = (Integer)psObj;
				if(psSession != psParam) {
					cp = 1;
					session.setAttribute("cp", cp);
				}
			}else {
				if(ps!=psParam) {
					cp = 1;
					session.setAttribute("cp", cp);					
				}
			}
			ps = psParam;
		}
		session.setAttribute("ps", ps);
		if(surf == null) {
			surf = "";
		}
		QnaSearchListResult listResult = qnaService.getQnaSearchListResult(cp, ps, surf, search_key);
		ModelAndView mv = new ModelAndView("qna/searchList", "listResult", listResult);
		
		if(listResult.getList().size() == 0) {
			if(cp > 1) 
				return new ModelAndView("redirect:search.do?cp="+(cp-1));
			else
				return new ModelAndView("qna/searchList", "listResult", null);
		}else {
			return mv;
		}
	}
}