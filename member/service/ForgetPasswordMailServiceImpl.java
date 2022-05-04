package jejufriends.member.service;

import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import jejufriends.member.domain.ForgetMember;
import jejufriends.member.repository.ForgetPasswordRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@RequiredArgsConstructor
public class ForgetPasswordMailServiceImpl implements ForgetPasswordMailService {
	
	private final JavaMailSender mailSender;
	private final ForgetPasswordRepository forgetPasswordRepository;
	
	//회원 가입 시 사용할 이메일 양식 너무느려서 비동기 
	@Override
	@Async("executor")
	public String joinEmail(String email , String authNum ) {
		String setFrom = "jejufriends001@gmail.com"; //email-config에 설정한 자신의 이메일 주소를 입력.
		String toMail = email; //수신받을 이메일
		String title = "Jeuju Frirends 비밀번호 변경 인증번호입니다."; //이메일 제목
		String content = "저희 Jeuju Frirends 홈페이지를 이용해주셔서 감사합니다." +
				"<br><br>" + 
				"입력하실" + 
				"인증 번호는 " + authNum + "입니다." + 
				"<br>" + 
				"해당 인증번호를 인증번호 확인란에 기입하여 주세요."; 
		mailSend(setFrom, toMail, title, content);
		return authNum;
	}
	
	//이메일 전송 메서드
	@Override
	public void mailSend(String setFrom, String toMail, String title, String Content) {
		try {
			MimeMessage message = mailSender.createMimeMessage();
			//true 매개값을 전달하면 MultiPart 형식의 메세지 전달이 가능. 문자 인코딩 설정도 가능.
			MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
			helper.setFrom(setFrom);
			helper.setTo(toMail);
			helper.setSubject(title);
			helper.setText(Content, true);
			mailSender.send(message);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean findByMember(String email) {
		Integer checkExistMember = forgetPasswordRepository.findMember(email);
		//존재한다면 true
		if(checkExistMember >= 1) {
			return true;
		} else {
			return false;
		}
		
	}

	@Override
	public void updatePassword(ForgetMember forgetMember) {
		log.warn("ForgetPassword update Password error pwd = {}" , forgetMember.getPwd());
		forgetPasswordRepository.updatePassword(forgetMember);
	}

}
