package jejufriends.member.controll;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import jejufriends.member.domain.Member;
import jejufriends.member.service.SignUpMemberService;
import jejufriends.member.service.TabooWordService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
/**
 * Commit Date : 2022.03.13
 * @author jaesoon
 *
 */
@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("jejufriends/signup")
public class SignUpController {
	
	private final TabooWordService tabooWordService;
	private final SignUpMemberService signService;
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
	 * @param model sign up form
	 * @return
	 */
	@GetMapping
	public String signUpForm(Model model) {
		
		model.addAttribute("member" , new Member());
		return "signup/signUp";
	}
	
	/**
	 * 
	 * @param member			: sign up Member information , domain.member
	 * @param bindingResult		: validation
	 * @param model				: fail , return info
	 * @return					: success -> login.jsp / fail -> return sign up
	 */
	@PostMapping
	public String signUp(@Valid @ModelAttribute Member member , BindingResult bindingResult  
												, Model model) {
				
		if(bindingResult.hasErrors()) {
			return "signup/signUp";
		}
		
		//성공시
		//비밀번호 엔크립션
		boolean singNickNameCheck = signService.signNickNameCheckSelect(member.getNickName());

		if(singNickNameCheck) {
		
			model.addAttribute("errorAlert" , "error");
			return "signup/signUp";
		}
			
		String encryPwd = bcryptPasswordEncoder.encode(member.getPwd());
		member.setPwd(encryPwd);
		
		//가입
		signService.addMember(member);
				
		return "redirect:/jejufriends/login";
	} 
    /**
     * 
     * @param email		: sign up email Duplication Check , key Up
     * @param response  : response
     */
	@ResponseBody
	@GetMapping("emailCheck")
	public void emailCheck(String email , HttpServletResponse response) {
		String data = signService.emailCheckSelect(email);
		//log.info("emailCheck = {}" , email);
		//log.info("data = {}" , data);
		try {
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.print(data);
		} catch (IOException io) {
			
		}
		
	}
	
	/**
	 * 
	 * @param email  : sign up email Duplication Check  , Jquery Validation
	 * @return
	 */
	@ResponseBody
	@RequestMapping("emailduplication")
	public boolean emailDuplication(@RequestParam String email) {
		String emailDuplication = signService.emailCheckSelect(email);
		
		if(emailDuplication.equals("회원 가입이 가능한 아이디입니다.")) {
			return true;
		} else if (emailDuplication.equals("이미 사용중인 아이디 입니다.")) {
			return false;
		} else {
			return false;
		}
	}
	
	
	/**
	 * 
	 * @param nickName  sign up nickName Duplication Check 
	 * @param response
	 */
	@ResponseBody
	@GetMapping("nickCheck")
	public void nickNameCheck(String nickName, HttpServletResponse response) {
		String data = tabooWordService.nickNameCheckSelectTaBoo(nickName);
		try {
			response.setContentType("text/plain;charset=utf-8");
			PrintWriter pw = response.getWriter();
			pw.print(data);
		} catch (IOException io) {
			
		}
		
	}
	
	
}
