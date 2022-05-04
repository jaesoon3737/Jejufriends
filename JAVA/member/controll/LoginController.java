package jejufriends.member.controll;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jejufriends.member.domain.LoginMember;
import jejufriends.member.service.LoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * Commit Date : 2022.03.22
 * @author jaesoon
 *
 */
@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("jejufriends/login")
public class LoginController {
	
	private final LoginService loginService;
	/**
	 * 
	 * @param model form
	 * @return
	 */
	@GetMapping()
	public String loginForm(Model model) {
		model.addAttribute("loginMember" , new LoginMember());
		return "login/login";
	}
	/**
	 * 
	 * @param email  : Duplication Check
	 * @return		 : true = exist , false = not exist
	 */
	@ResponseBody
	@GetMapping("emailduplication")
	public boolean loginEmailduplication(@RequestParam String email) {
		boolean emailDuplicate = loginService.loginEmailduplication(email);
		
		return emailDuplicate;
	}
}
