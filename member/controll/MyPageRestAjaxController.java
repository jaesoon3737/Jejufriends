package jejufriends.member.controll;

import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


import jejufriends.member.domain.DeleteUser;
import jejufriends.member.domain.UpdatePassword;
import jejufriends.member.domain.UserInfoChange;
import jejufriends.member.service.MemberPageService;
import jejufriends.member.service.WithDrawAccountService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * Commit Date : 2022.03.28
 * @author jaesoon
 *
 */
@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping("/jejufriends/rest")
public class MyPageRestAjaxController {
	
	private final MemberPageService memberPageService;
	private final WithDrawAccountService withDrawAccountService;
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	/**
	 * 
	 * @param bcryptPasswordEncoder : security password encryption
	 */
	@Autowired
	private void setBCryptPasswordEncoder(BCryptPasswordEncoder bcryptPasswordEncoder) {
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
	}
	
	/**
	 * 
	 * @param userInfoChange : Member(User) Information
	 * @param bindingResult  : UserInfoChange Valid  email 
	 * @return				 : 0 = 정보변경 성공 , 1 = 핸드폰 번호 오류 , 2 = 불건전한 닉네임 , 3 = 서버, 클라이언트 오류 , 4 = validation 오류
	 */
	@Secured({"ROLE_USER" , "ROLE_ADMIN" , "ROLE_SUPERADMIN" ,"ROLE_WITHDRAW"}) 
	@PostMapping("updateinfo")
	public String userInfoUpdateAjax(@Valid @ModelAttribute UserInfoChange userInfoChange ,
												BindingResult bindingResult,  Principal principal){
		String email = principal.getName();
		userInfoChange.setEmail(email);
		
		if(bindingResult.hasErrors()) {	
			return "4";
		}
		
		int resultInt = memberPageService.userInfoUpdate(userInfoChange);
		String result =String.valueOf(resultInt);
		
		return result;
	}
	
	/**
	 * 
	 * @param deleteUser     : delete Member
	 * @param bindingResult  : deleteUser Valid = pwd ( pattern )
	 * @param principal      : security get Session
	 * @param request		 : logout request
	 * @param authentication : logout
	 * @return				 : 3 = Validation Error , 2 = password not match , 1 = success
	 * @throws IOException   : request
	 * @throws ServletException : request
	 */
	@Secured({"ROLE_USER" , "ROLE_ADMIN" , "ROLE_SUPERADMIN" , "ROLE_WITHDRAW"}) 
	@PostMapping("userdelete")
	public String userDeleteAjax(@Valid @RequestBody DeleteUser deleteUser , BindingResult bindingResult,
										Principal principal , HttpServletRequest request , 
												Authentication authentication) throws IOException, ServletException {
		String email = principal.getName();
		String checkPwd = memberPageService.userPasswordSearch(email);
		String pwd = deleteUser.getPwd();
		
		if(bindingResult.hasErrors()) {	
				return "3";
		}
		
		boolean pwdMatch = bcryptPasswordEncoder.matches(pwd , checkPwd);
		if(pwdMatch) {
			int result = withDrawAccountService.insertWithDrawAccount(email);
			// security ROLE update -> ROLE_WITHDRAW
			int resultUpdate = withDrawAccountService.updateWithDrawAccount(email);

			//int result = memberPageService.userDelete(email);
	        
			if (authentication != null && authentication.getDetails() != null) {
	            try {
	                request.getSession().invalidate();
	                return "4";
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }  
			return String.valueOf(result);
		} else {
			return "2";
		}

	}
	
	/**
	 * 
	 * @param updatePassword  : newPwd , pwd , pwdCheck validation
	 * @param bindingResult   : validation
	 * @param principal       : security get Session
	 * @param model           :
	 * @return				  : 2 , 3 = validation error , 1 = success , 4 = fail 
	 */
	@Secured({"ROLE_USER" , "ROLE_ADMIN" , "ROLE_SUPERADMIN" , "ROLE_WITHDRAW"}) 
	@PostMapping("updatepassword")
	public String userUpdatePassword(@Valid @ModelAttribute UpdatePassword updatePassword ,
											BindingResult bindingResult , Principal principal , Model model) {
			
			if(bindingResult.hasErrors()) {	
				List<ObjectError> errors = bindingResult.getAllErrors();
				for(ObjectError error : errors) {
					log.warn("error = {}" , error.getDefaultMessage());
					if(error.getDefaultMessage().contentEquals("특수문자,영어,숫자 를 조합하여 10~20자리를 입력하세요")) {
						return "2";
					} else {
						return "3";
					}
				}
				
			}
			String email = principal.getName();
			updatePassword.setEmail(email);
			
			String oldUserPwd = memberPageService.userPasswordSearch(email);
			String updatePasswordEncypt = bcryptPasswordEncoder.encode(updatePassword.getNewPwd());
			boolean passwordValid = bcryptPasswordEncoder.matches(updatePassword.getPwd() , oldUserPwd);
			
			if(passwordValid) {
				updatePassword.setPwd(updatePasswordEncypt);
				memberPageService.updatePasswordMemberInfo(updatePassword);
				return "1";
			} else {
				return "4";
			}
	}
}
