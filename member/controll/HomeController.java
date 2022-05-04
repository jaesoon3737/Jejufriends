package jejufriends.member.controll;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HomeController {
	
	@RequestMapping(value = "/jejufriends", method = RequestMethod.GET)
	public String home() {
		return "index";
	}
	
	@GetMapping()
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "/jejufriends/withdraw/withdrawClear")
	public String withdrawClear() {
		return "withdraw/withdrawClear";
	}
	

}
