package jejufriends.member.controll;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.concurrent.atomic.AtomicLong;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;



import jejufriends.member.domain.KakaoMember;
import jejufriends.member.service.KakaoLoginService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * Commit Date : 2022.03.23
 * @author jaesoon
 *
 */
@Slf4j
@Controller
@RequestMapping("/jejufriends/login")
@RequiredArgsConstructor
public class KakaoController {
	
	private final KakaoLoginService kakaoLoginService;
	private static AtomicLong atomic = new AtomicLong(1);
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	/**
	 * 
	 * @param bcryptPasswordEncoder security encryption
	 */
	@Autowired
	private void setBCryptPasswordEncoder(BCryptPasswordEncoder bcryptPasswordEncoder) {
		this.bcryptPasswordEncoder = bcryptPasswordEncoder;
	}
	
	/**
	 *  KAKAO Login get URL
	 * @param request
	 * @return
	 * @throws Exception
	 */
    @RequestMapping(value = "getKakaoAuthUrl")
	public @ResponseBody String getKakaoAuthUrl(
			HttpServletRequest request) throws Exception {
		String reqUrl = 

		return reqUrl;
	}
	

    
	/**
	 *  KAKAO User Linked
	 * @param code
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value = "kakao")
	public String oauthKakao(
			@RequestParam(value = "code", required = false) String code
			, Model model) throws Exception {
	
        String accessToken = kakaoLoginService.getReturnAccessToken(code);
        Map<String, Object> userInfo = kakaoLoginService.getLoginMemberInfo(accessToken);
        
        String kakaoId = userInfo.get("id").toString().substring(1);
        String kakaoName = userInfo.get("nickname").toString();
        String kakaoPwd = userInfo.get("kakaoPwd").toString();
        String encryPwd = bcryptPasswordEncoder.encode(kakaoPwd);

        long number = atomic.incrementAndGet();
        log.warn("kakao atomic error = {}" , number);
        
        StringBuilder sbNickName = new StringBuilder();
        sbNickName.append(kakaoName);
        sbNickName.append(number);
        String kakaoNickName = sbNickName.toString();
        
        StringBuilder sbId = new StringBuilder();
        sbId.append(kakaoId);
        sbId.append("@kakaotalk.com");
        String kakaoIdEmailTrans = sbId.toString();

      
        //checkSnsId = 1 �� ��� sns ���̵�
        //checkSnsID = 0 �ϰ�� �Ϲ� ȸ�� db ����Ʈ 0 
        KakaoMember kakaoMember = new KakaoMember(kakaoIdEmailTrans, encryPwd , kakaoNickName , kakaoName, 1);
        
        // true �� ��� ����
        boolean KakaoMemberExist = kakaoLoginService.kakaoTalkIdCheckExist(kakaoMember);
        
        //Security Member add
        if(KakaoMemberExist) {
        	List<GrantedAuthority> memberRole = new ArrayList<GrantedAuthority>();
        	memberRole.add(new SimpleGrantedAuthority("ROLE_USER"));
        	User user = new User(kakaoMember.getUsername(),"",memberRole);
        	Authentication auth = new UsernamePasswordAuthenticationToken(user, null , memberRole);
        	SecurityContextHolder.getContext().setAuthentication(auth);
        	log.warn("kakao login auth check = {}" , auth);
        	return "redirect:/jejufriends";
        } else {
        	kakaoLoginService.addMemberForKAKAO(kakaoMember);
        	List<GrantedAuthority> memberRole = new ArrayList<GrantedAuthority>();
        	memberRole.add(new SimpleGrantedAuthority("ROLE_USER"));
        	User user = new User(kakaoMember.getUsername(),"",memberRole);
        	Authentication auth = new UsernamePasswordAuthenticationToken(user, null , memberRole);
        	SecurityContextHolder.getContext().setAuthentication(auth);
        	log.warn("kakao login auth check = {}" , auth);
        	return "redirect:/jejufriends";
        }
	}
 }