package jejufriends.member.controll;


import java.io.IOException;
import java.io.PrintWriter;
import java.security.Principal;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Map;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import jejufriends.member.domain.Member;
import jejufriends.member.domain.UpdatePassword;
import jejufriends.member.service.MemberPageService;
import jejufriends.member.service.TabooWordService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


/**
 * Commit Date : 2022.03.27
 * @author jaesoon
 *
 */
@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/jejufriends/member/mypage")
public class MyPageController {
	
	private final TabooWordService tabooWordService;
	private final MemberPageService memberPageService;
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
	private void setBCryptPasswordEncoder(BCryptPasswordEncoder bcryptPasswordEncoder) {
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
	}
	
	@Secured({"ROLE_USER" , "ROLE_ADMIN" , "ROLE_SUPERADMIN" , "ROLE_WITHDRAW"}) 
	@GetMapping
	public String mypageForm(Model model) {
		return "mypage/mypage";
	}
	
	
	@Secured({"ROLE_USER" , "ROLE_ADMIN" , "ROLE_SUPERADMIN" , "ROLE_WITHDRAW"}) 
	@GetMapping("memberinfo")
	public String myPageMemberInfoForm(@ModelAttribute("updatePassword") UpdatePassword updatePassword  , Principal principal , Model model , HttpServletRequest request) {
		String email = principal.getName();
		
		//User 찾아오기
		Member member = memberPageService.userInfoSelect(email);
		String emailChangeStar = memberPageService.emailChangeStar(email);
		String role = memberPageService.userInfoRole(email);
		String phoneNumber = member.getPhoneNumber();
		String ChangePhoneNumber = memberPageService.phoneNumberChangeStar(phoneNumber);
		
		if (member.getBirth() != null) {
			Date beforeMemberBirth = member.getBirth();
			LocalDate memberBirthLocal = LocalDate.ofInstant(beforeMemberBirth.toInstant(), ZoneId.systemDefault());
			String memberBirth = memberBirthLocal.format(DateTimeFormatter.BASIC_ISO_DATE);
			model.addAttribute("memberBirth" , memberBirth);
		}
		
		model.addAttribute("ChangePhoneNumber" , ChangePhoneNumber);
		model.addAttribute("emailChangeStar" , emailChangeStar);
		model.addAttribute("member" , member);
		model.addAttribute("userRole", role);
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);

		if(flashMap!=null) {
					
		    if (model.asMap().containsKey("org.springframework.validation.BindingResult")){
		    	
		        model.addAttribute("org.springframework.validation.BindingResult.updatePassword",
		                model.asMap().get("org.springframework.validation.BindingResult"));
		      
		    }
		    if (model.asMap().containsKey("errorAlertPassword")){
		    	
		        model.addAttribute("errorAlertPassword",
		                model.asMap().get("errorAlertPassword"));
		    }
		    
    		return "mypage/mypagememberinfo";
        } else {
        	model.addAttribute("updatePassword" , new UpdatePassword());
        }
		return "mypage/mypagememberinfo";
	}
	
	@Secured({"ROLE_USER" , "ROLE_ADMIN" , "ROLE_SUPERADMIN" , "ROLE_WITHDRAW"}) 
	@GetMapping(value="nickNameTabooCheck")
	public void nickNameTabooCheckAjax(@RequestParam String nickName , HttpServletResponse response){
		String data = tabooWordService.nickNameCheckSelectTaBoo(nickName);
		try {
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.print(data);
		} catch (IOException io) {
			
		}
	}
	
	
	// Binding 순서
	@Secured({"ROLE_USER" , "ROLE_ADMIN" , "ROLE_WITHDRAW" , "ROLE_SUPERADMIN"}) 
	@PostMapping("updatepassword")
	public String updatePassword(@Valid @ModelAttribute UpdatePassword updatePassword , BindingResult bindingResult ,
			RedirectAttributes redirectAttribute , Principal principal , Model model) {
		
		if(bindingResult.hasErrors()) {		
			redirectAttribute.addFlashAttribute("updatePasswordCheck" , updatePassword);
			redirectAttribute.addFlashAttribute("org.springframework.validation.BindingResult" , bindingResult);
			return "redirect:/jejufriends/member/mypage/memberinfo";
		}
	
		String email = principal.getName();
		
		if(email == null) {
			return "redirect:/jejufriends/member/mypage/memberinfo";
		}

		String updatePasswordEncy = bcryptPasswordEncoder.encode(updatePassword.getNewPwd());
		updatePassword.setEmail(email);
		
		String checkPwd = memberPageService.userPasswordSearch(email);
		
		if(bcryptPasswordEncoder.matches(updatePassword.getPwd() , checkPwd)) {		
			updatePassword.setPwd(updatePasswordEncy);
			redirectAttribute.addFlashAttribute("errorAlertPassword" , "sucess");
			memberPageService.updatePasswordMemberInfo(updatePassword);
			return "redirect:/jejufriends/member/mypage/memberinfo";
		} else {
			redirectAttribute.addFlashAttribute("errorAlertPassword" , "errorNumber");
			return "redirect:/jejufriends/member/mypage/memberinfo";
		}
	}

}
