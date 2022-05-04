package jejufriends.member.controll;

import java.util.Map;
import java.util.Random;
import java.util.concurrent.ConcurrentHashMap;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import jejufriends.member.domain.EmailForgetPassword;
import jejufriends.member.domain.ForgetMember;
import jejufriends.member.service.ForgetPasswordMailService;
import jejufriends.member.utils.CustomPattern;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * Commit Date : 2022.03.27
 * @author jaesoon
 * 		   
 * 			forgetPassword , findPassword
 * 				check Exist Member
 *				email Authentication Number 
 *				change Password
 */
@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("jejufriends/forgetPassword")
public class ForgetPasswordController {
	

	/**
	 * testCode짤것  hashtable은 동기화가 걸려있어서 락이 있음. 따라서 멀티쓰레드에서 안정성을 보장해주지만 병목현상이 있음. 
	 * Concurrent는 HashMap과 다르게 읽기는 동기화가 걸려있지 않지만 put에 동기화가 걸려있어서 락처리가 되기 때문에 싱크로나이즈드를 따로 처리하지않고 멀티 쓰레드 환경에서 안정성을 보장한다. 
	 * 단, get을 쓸 때는 즉 읽기의 행동을 할 때에는 동기화가 적용되지 않는다.
	 * 따라서 이메일처리시 Async 를 사용하여 처리하기 때문에 멀티쓰레드 환경에서 사용가능한 해쉬맵을 사용했어야 했기에 컨커런트 해쉬맵을 사용함.
	 */
	private final ForgetPasswordMailService forgetPasswordMailService;
	private Map<String , String> matchingMap = new ConcurrentHashMap<String, String>();
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	 
	@Autowired
	private void setBCryptPasswordEncoder(BCryptPasswordEncoder bcryptPasswordEncoder) {
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
	}
	
	private boolean checkNumberValidation(String checkNumber) {
		return CustomPattern.IS_ONLY_NUMBER.matcher(checkNumber).matches();
	}
	
	/**
	 * 
	 * @param forgetMember : requester
	 * @param checkNumber  : email authentication number
	 * @param redirectAttribute : for fail = restPwd , success = findPassword 
	 * @return
	 */
	@PostMapping
	public String findPasswordMapping(@ModelAttribute ForgetMember forgetMember , @RequestParam("checkNumber")String checkNumber , RedirectAttributes redirectAttribute) {
		
			String forgetMemberEmail =  forgetMember.getEmail();
			boolean checkNumberValid = checkNumberValidation(checkNumber);
			
			if(!checkNumberValid) {
				redirectAttribute.addAttribute("errorAlert" , "errorNumber");
				redirectAttribute.addFlashAttribute("email" , forgetMember.getEmail());
				return "redirect:/jejufriends/forgetPassword/restPwd";
			}
			
			//exist = true
			boolean MemberExistCheck = forgetPasswordMailService.findByMember(forgetMemberEmail);	
			
			if(MemberExistCheck) {
				if(checkNumber.equals(matchingMap.get(forgetMemberEmail))) {
					redirectAttribute.addFlashAttribute("email" , forgetMember.getEmail());
					matchingMap.remove(forgetMemberEmail);
					return "redirect:/jejufriends/forgetPassword/findPassword";	
				} else {
					redirectAttribute.addAttribute("errorAlert" , "errorNumber");
					redirectAttribute.addFlashAttribute("email" , forgetMember.getEmail());
					return "redirect:/jejufriends/forgetPassword/restPwd";
				}
			} else {	
				redirectAttribute.addAttribute("errorAlert" , "errorEmail");
				return "redirect:/jejufriends/forgetPassword/restPwd";
			}
		
	}
	
	/**
	 * 
	 * @param forgetMember   : requester
	 * @param bindingResult  : password Validation
	 * @param model
	 * @return               : fail = findPassword , success = login
	 */
	@PostMapping("update")
	public String findPasswordUpdate(@Valid @ModelAttribute ForgetMember forgetMember ,
			BindingResult bindingResult , Model model) {
		String settingPassword = bcryptPasswordEncoder.encode(forgetMember.getPwd());

		if(bindingResult.hasErrors()) {		
			model.addAttribute("email" , forgetMember.getEmail());
			return "login/findPassword";
		}
		
		forgetMember.setPwd(settingPassword);
		forgetPasswordMailService.updatePassword(forgetMember);
		return "redirect:/jejufriends/login";
	}
	
	/**
	 * 
	 * @param model
	 * @param email      :  email authentication number for email
	 * @param errorAlert :  if not exist
	 * @return
	 */
	@GetMapping("/restPwd")
	public String restPwdForm(Model model ,@RequestParam(value="email" , required = false) String email ,@RequestParam(value="errorAlert" , required = false) String errorAlert) {		
		if(email != null) {
			model.addAttribute("email" , email);
		}
		
		if(errorAlert != null) {
			if(errorAlert.equals("errorNumber")) {
				model.addAttribute("errorAlertNumber" , errorAlert);
			} else if (errorAlert.equals("errorEmail")) {
				model.addAttribute("errorAlertEmail" , errorAlert);
			} else {
				return "login/restPwd";
			}
		}
		return "login/restPwd";
	}
	

	@GetMapping("/findPassword")
	public String findPasswordForm(HttpServletRequest request , Model model) {
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
	
		if(flashMap!=null) {
	         String  email =(String)flashMap.get("email");
	         model.addAttribute("email" , email);
        }
		
		model.addAttribute("forgetMember" , new ForgetMember());
		return "login/findPassword";
	}
	
	/**
	 * 
	 * @param emailForgetPasswordVlid : email , password Validation , using pattern
	 * @param bindingResult           : email , password Validation
	 * @param model
	 * @return
	 */
	@GetMapping
	@ResponseBody
	public String mailCheck(@Valid EmailForgetPassword emailForgetPasswordVlid ,BindingResult bindingResult , Model model) {
		
		if(bindingResult.hasErrors()) {
			if(emailForgetPasswordVlid.getEmail() != null) {
				model.addAttribute("email" , emailForgetPasswordVlid.getEmail());	
			}
			return "login/restPwd";
		}
		
	   String email = emailForgetPasswordVlid.getEmail();
	   String randomNumber = makeRandomNumber();
	   matchingMap.put(email, randomNumber);
	   
	   return forgetPasswordMailService.joinEmail(email , randomNumber);				
	}
	
	/**
	 *  random authentication number create
	 * @return
	 */
	private String makeRandomNumber() {
		Random r = new Random();
		int checkNum = r.nextInt(888888) + 111111;
		
		return String.valueOf(checkNum);
	}
}
