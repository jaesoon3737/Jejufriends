package jejufriends.member.controll;

import java.security.Principal;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.security.access.annotation.Secured;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import jejufriends.member.domain.AdminMemberInfoChange;
import jejufriends.member.domain.AdminUserInfo;
import jejufriends.member.domain.Member;
import jejufriends.member.domain.Paging;
import jejufriends.member.domain.PagingKeyword;
import jejufriends.member.domain.TabooContainsMember;
import jejufriends.member.domain.TabooWord;
import jejufriends.member.domain.TodoList;
import jejufriends.member.service.MemberManagementService;
import jejufriends.member.service.SignUpMemberService;
import jejufriends.member.service.SuspendAccountService;
import jejufriends.member.service.TabooWordService;
import jejufriends.member.service.TodoListService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * Commit Date : 2022.04.02
 * @author jaesoon
 * 		  
 *  adminPage
 * 		   	 MemberManagement
 * 				 MemberList 
 * 				 CautionAccount
 * 				 SuspendAccount
 * 		     TabooWord for Member 
 * 		   		 TabooWordList
 * 				 TabooInsert , Delete 
 * 				 TabooContainsMemberList 
 * 		  
 */	

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/jejufriends/admin")
public class AdminController {
	
	private final TodoListService todoListService;
	private final SuspendAccountService suspendAccountService; 
	private final TabooWordService tabooWordService;
	private final MemberManagementService memberManagementService;
	
	/**
	 * 
	 * @param paging    : domain package pagingVO
	 * @param model	    : MemberList
	 * @param nowPage   : paging
	 * @param cntPerPage: paging 
	 * @param catgo		: select Member category 
	 * @param keyword	: select Member keyword
	 * @return          : location
	 * @throws ParseException 
	 */
	@Secured({"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@GetMapping("/memberManagement")
	public String memberManagementForm(Paging paging , Model model , 
			@RequestParam(value="nowPage", required=false)String nowPage , 
			@RequestParam(value="cntPerPage", required=false)String cntPerPage, 
			@RequestParam(value="catgo" , required = false)String catgo , 
			@RequestParam(value="keyword",  required = false )String keyword,
			@RequestParam(value="columnOrderBy",  required = false )String columnOrderBy
			) throws ParseException {
		
		PagingKeyword pagingKeyword = new PagingKeyword(catgo, keyword);
		int total = memberManagementService.countMember(pagingKeyword);
		
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "5";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "5";
		}
		
		if (catgo == null && keyword == null) {
			catgo = "idNumber";
			keyword = "";
		} else if (catgo == null) {
			catgo = "idNumber";
		} else if (keyword == null) {
			keyword = "";
		}
		
		if (columnOrderBy == null) {
			columnOrderBy = "idNumber";
		}
		

		paging = new Paging(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage) , catgo , keyword , columnOrderBy);
		
		model.addAttribute("paging", paging);
		
		

		List<AdminUserInfo>  memberList = memberManagementService.findAll(paging);
	
		model.addAttribute("memberList" , memberList);
		return "admin/adminForm";
	}
	
	/**
	 * @return TabooList
	 */
	@Secured({"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@GetMapping("/taboolist")
	public ModelAndView tabooListForm() {
		List<TabooWord> taboolist = tabooWordService.findAll();
				
		ModelAndView mv = new ModelAndView("admin/taboolist" , "tabooAll" , taboolist);
		
		return mv;
	}
	
	/**
	 * @param tabooWordNumber : TabooWordPrimaryKey
	 * @return : delete result
	 */
	@Secured({"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@GetMapping(value = "/deletetaboo" , produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String deletetaboo(@RequestParam Integer tabooWordNumber ){
		//Integer tabooNumber = tabooword.getTabooWordNumber();
		if(tabooWordNumber != null) {
			int deleteSuccessCheck = tabooWordService.deleteTabooWord(tabooWordNumber);
			if(deleteSuccessCheck == 1) {
				return tabooWordNumber.toString();
			} else {
				return "fail";
			}
		} else {
			return "fail";
		}
	}
	
	/**
	 * @param idNumber : suspend target , Member PrimaryKey
	 * @param enabled  : enabled Check
	 * @return
	 */
	@Secured({"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@GetMapping(value = "/suspendAccount" , produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String suspendAccount(@RequestParam Long idNumber , String enabled){
		enabled.trim();
		
		// contains "정지" = 0 , contains "활동" = 1
		if(enabled.contains("정지")){
			enabled = "0";
		} else {
			enabled = "1";
		}
		
		Integer result = suspendAccountService.suspendAccount(idNumber , Integer.parseInt(enabled));
		// success result = 1 , else fail
		return String.valueOf(result);
	}
	
	/**
	 * 
	 * @param idNumber : caution target , Member PrimaryKey
	 * @return         : result 1 success , if( cautionCount >= 3 ) Member enabled -> disabled
	 */
	@Secured({"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@GetMapping(value = "/cautionAccount" , produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String cautionAccount(@RequestParam Long idNumber ){
		Integer result = suspendAccountService.cautionAccount(idNumber);
		// success result 1 ,  
		if(result == 1) {
			Member member = suspendAccountService.findMember(idNumber);
			int cautionCount = member.getCautionCount();
			int enabled = member.getEnabled();
			if(cautionCount >= 3 && enabled == 1 ) {
				suspendAccount(idNumber , "활성");
			} 
		}
		return String.valueOf(result);
	}
	
	/**
	 * 
	 * @return : containing banned words Member
	 */
	@Secured({"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@GetMapping("/tabooContainsMemberList")
	public ModelAndView tabooContainsMemberList() {
		List<TabooContainsMember> memberList = tabooWordService.tabooContainsMemberList();
		ModelAndView mv = new ModelAndView("admin/tabooContainsMemberList" , "memberList" , memberList);
	
		return mv;
	}
	
	/**
	 * 	member nickname (defaultUser + idNumber) change
	 * @return
	 */
	@Secured({"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@GetMapping("/tabooContainsMemberDefaultNickNameChange")
	public String tabooContainsMemberForDefaultNickNameChange() {
		List<TabooContainsMember> memberList = tabooWordService.tabooContainsMemberList();
		suspendAccountService.tabooContainsMemberForDefaultNickNameChange(memberList);
				
		return "redirect:/jejufriends/admin/tabooContainsMemberList";
	}
	
	/**
	 * 
	 * @param tabooword : domain.TabooWord , banned word
	 * @return : insert result 
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_SUPERADMIN')")
	@PostMapping(value = "/insertTaboo" , produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String insertTaboo(@RequestBody TabooWord tabooword){
		String insertTabooWord = tabooword.getTabooWordCheck();
		if(insertTabooWord.equals("") || insertTabooWord == null) {
			return "fail";
		}
		// 1 -> 존재함 , 0 -> 존재하지 않음 
		int existCheckNumber = tabooWordService.insertTaboo(tabooword);
		if (existCheckNumber == 0) {
			return insertTabooWord;
		} else {
			return "fail";
		}
	}
	
	/**
	 * 	memberInfoPage
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_SUPERADMIN')")
	@GetMapping("/memberInfo/{email:.+}")
	public String memberInfo(@PathVariable String email, @ModelAttribute AdminMemberInfoChange adminMemberInfoChange , HttpServletRequest request, Model model  ) {	
		AdminUserInfo member = memberManagementService.memberInfofind(email);
		
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		
		
		if(flashMap!=null) {		
		    if (model.asMap().containsKey("org.springframework.validation.BindingResult")){
		        model.addAttribute("org.springframework.validation.BindingResult.adminMemberInfoChange",
		                model.asMap().get("org.springframework.validation.BindingResult"));
		    }
		    
		    if (model.asMap().containsKey("nickNameDuplication")){
		        model.addAttribute(" nickNameDuplication",
		                model.asMap().get(" nickNameDuplication"));
		    }
		}
		
		
		
		model.addAttribute("member", member);
		return "admin/adminMemberInfo";
	}
	/**
	 * 
	 * @param adminMemberInfoChange  : adminPage Member Information Change
	 * @return
	 */
	@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_SUPERADMIN')")
	@PostMapping("memberInfoChange")
	public String memberInfoChange(@Valid @ModelAttribute AdminMemberInfoChange adminMemberInfoChange
			, BindingResult bindingResult , RedirectAttributes redirectAttribute ) {
		
		if(bindingResult.hasErrors()) {
			log.info("erorrrr = {}" , adminMemberInfoChange);
			redirectAttribute.addFlashAttribute("org.springframework.validation.BindingResult" , bindingResult);
			return "redirect:/jejufriends/admin/memberInfo/" + adminMemberInfoChange.getEmail();
		}
		
		String nickName = adminMemberInfoChange.getNickName();
		nickName = nickName.trim();
		log.info("nickName = {}" , nickName);
		boolean nickNameDuplication = memberManagementService.nickNameDuplication(nickName);
		log.info("nickName  boolean = {}" ,nickNameDuplication);
		if(nickNameDuplication) {
			redirectAttribute.addFlashAttribute("nickNameDuplication" , "1");
			return "redirect:/jejufriends/admin/memberInfo/" + adminMemberInfoChange.getEmail();
		}
		
		
		log.info("dddd = {}" , adminMemberInfoChange);
		memberManagementService.memberInfoChange(adminMemberInfoChange);
		return "redirect:/jejufriends/admin/memberInfo/" + adminMemberInfoChange.getEmail();
	}
	/**
	 * 
	 * @param idNumber    :  Authority Member
	 * @param authority   :  Authority Change
	 * @return
	 */
	@Secured("ROLE_SUPERADMIN")
	@GetMapping(value="adminAuthority" , produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String adminAuthority(@RequestParam Long idNumber , @RequestParam String authority) {
		Integer result = memberManagementService.adminAuthority(idNumber , authority);
		if(result != null) {
			return "권한 변경 성공하였습니다.";
		} else {
			return "권한 변경 실패하였습니다.";
		}
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_SUPERADMIN')")
	@GetMapping("adminCalender")
	public ModelAndView adminCalender() {
		
		List<TodoList> todolist = todoListService.adminCalenderSelect();
	
		ModelAndView mv = new ModelAndView("admin/adminScheduleManagement" , "todolist" , todolist);
		return mv;
	}
	
	@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_SUPERADMIN')")
	@PostMapping("schedule")
	public String ToDoSchedule(String tododate , String content , String publicCheck , Principal principal) {
		String email = principal.getName();
		if(tododate == null || tododate.equals("")) {
			return "redirect:/jejufriends/admin/adminCalender";
		}
		
		if(publicCheck == null || publicCheck.equals("")) {
			publicCheck = "privateChecking";
		} 
		
		if(publicCheck != null) {
			publicCheck = publicCheck.trim();
			if (publicCheck.equals("on")) {
				publicCheck = "publicChecking";
			}
		}
		

		todoListService.insert(tododate , email , content , publicCheck);
			
		return "redirect:/jejufriends/admin/adminCalender";
	}
	
	
	/**
	 * 
	 * @param deleteTodoListNumber TodoList ListNumber
	 * @return 0 success , 1 fail
	 */
	@ResponseBody
	@PreAuthorize("hasRole('ROLE_ADMIN') or hasRole('ROLE_SUPERADMIN')")
	@GetMapping("deleteTodoList")
	public String deleteTodoList(Integer deleteTodoListNumber) {
		Integer result = todoListService.deleteTodoList(deleteTodoListNumber);
		if(result >= 1) {
			return "0";
		} else {
			return "1";
		}
	}
}
