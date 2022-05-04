package jejufriends.member.controll;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
/**
 * Commit Date : 2022.03.22
 * @author jaesoon
 *		
 *			error handling
 */
@Controller
public class ErrorController {
	/**
	 * 
	 * @return error 403 page location
	 */
	@RequestMapping("/jejufriends/error403")
	public String error403() {
		return "error/error403";
	}
}
