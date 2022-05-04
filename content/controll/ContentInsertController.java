package jejufriends.content.controll;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import jejufriends.content.domain.ContentInsertVO;
import jejufriends.content.service.ContentInsertService;
import jejufriends.content.service.ContentSelectService;


@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping("/jejufriends/content")
public class ContentInsertController {
	
	private final ContentInsertService contentinsertService;
	private final ContentSelectService contentSelectService;
	
	@Secured({"ROLE_ADMIN" , "ROLE_SUPERADMIN"})
	@RequestMapping("form")
	public String contentInsertForm(Model model , HttpServletRequest request) {
		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);
		if(flashMap!=null) {
		    if (model.asMap().containsKey("emptys")){
		        model.addAttribute("emptys" , "필요한 값이 존재하지 않습니다. 확인 후 등록을 진행해주세요." ); 
		    }
		    if (model.asMap().containsKey("duplicationfName")){
		        model.addAttribute("duplicationfName" , "중복된 업체가 있습니다 확인 후 재 등록해주세요." ); 
		    }
		}
		return "contentInsert/contentInsertForm";
	}
	
	@Secured({"ROLE_ADMIN" , "ROLE_SUPERADMIN"})	
	@PostMapping("write")
	public String write(ContentInsertVO contentInsertVO, @RequestParam(value="file" ,required = false) List<MultipartFile> files , RedirectAttributes model) throws IOException {
		
		if(files == null) {
			model.addFlashAttribute("emptys" , "error");
		   return "redirect:/jejufriends/content/form";
		}
		
		if(contentInsertVO.getAddressR()== null || contentInsertVO.getAddressR().equals("") ) {
			contentInsertVO.setAddressR("주소 없음");
		}
		
		if(contentInsertVO.getUpAddress() == null || contentInsertVO.getUpAddress().equals("")) {
			contentInsertVO.setUpAddress("주소 없음");
		}
		
		if(contentInsertVO.getCheckCategory() == null || contentInsertVO.getCheckCategory().equals("")) {
			model.addFlashAttribute("emptys" , "error");
			return "redirect:/jejufriends/content/form";
		}
		
		if(contentInsertVO.getName() == null || contentInsertVO.getName().equals("")) {
			model.addFlashAttribute("emptys" , "error");
			return "redirect:/jejufriends/content/form";
		}
		
		String addressR = contentInsertVO.getAddressR();
		String upAddress = contentInsertVO.getUpAddress();
		
		
		
		StringBuilder sb = new StringBuilder();
		sb.append(addressR);
		sb.append("  상세 주소 : ");
		sb.append(upAddress);
		String address = sb.toString();
		
		
		StringBuilder sbBreakTime = new StringBuilder();
		sbBreakTime.append(contentInsertVO.getBreakStartTime());
		sbBreakTime.append(" ~ ");
		sbBreakTime.append(contentInsertVO.getBreakEndTime());
		String breakTime = sbBreakTime.toString();
		
		StringBuilder sbOpclTime = new StringBuilder();
		sbOpclTime.append(contentInsertVO.getOpenTime());
		sbOpclTime.append(" ~ ");
		sbOpclTime.append(contentInsertVO.getClosedTime());
		String opclTime = sbOpclTime.toString();
		
		contentInsertVO.setOpcl(opclTime);
		contentInsertVO.setBreakTime(breakTime);
		contentInsertVO.setAddress(address);
		
		String name = contentInsertVO.getName();
		Integer selectResult = contentSelectService.contentSelect(name);
		
		if(selectResult == 1) {
			model.addFlashAttribute("duplicationfName" , "error");
			return "redirect:/jejufriends/content/form";
		}
		
		contentinsertService.contentInsert(contentInsertVO , files);
		
		return "redirect:/jejufriends/content/form";
	}
}
