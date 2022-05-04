package jejufriends.member.controll;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jejufriends.member.domain.WithDrawMemberClear;
import jejufriends.member.service.WithDrawAccountService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * Commit Date : 2022.03.15
 * @author jaesoon
 *
 */

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/jejufriends/member/withdraw")
public class WithdrawController {
	
	
	private final WithDrawAccountService withDrawAccountService;
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	/**
	 * 
	 * @param bcryptPasswordEncoder  : security encryption
	 */
	@Autowired
	private void setBCryptPasswordEncoder(BCryptPasswordEncoder bcryptPasswordEncoder) {
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
	}
	/**
	 * 
	 * @return location withdraw form , next MyPageRestAjaxContoller
	 */
	@Secured({"ROLE_USER" , "ROLE_ADMIN"}) 
	@GetMapping
	public String MemberWithdraw() {
		return "mypage/withdraw";
	} 
	
	@Secured({"ROLE_WITHDRAW" , "ROLE_ADMIN"}) 
	@PostMapping("clear")
	public String withdrawClear(@Valid  @ModelAttribute WithDrawMemberClear withDrawMemberClear , 
			BindingResult bindingResult , HttpServletRequest request , Authentication authentication ) {
		
		if(bindingResult.hasErrors()) {
			return "withdraw/withdrawClear";
		}
		String pwd = withDrawMemberClear.getPwd();
		
		if(pwd != null) {
			String encryPwd = bcryptPasswordEncoder.encode(pwd);
			withDrawMemberClear.setPwd(encryPwd);
		}
		String email = withDrawMemberClear.getEmail();
		withDrawAccountService.deleteRollback(withDrawMemberClear); 
		return "redirect:/jejufriends";
	} 
}
