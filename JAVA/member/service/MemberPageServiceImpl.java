package jejufriends.member.service;


import java.util.List;


import javax.annotation.PostConstruct;
import org.springframework.stereotype.Service;

import jejufriends.member.domain.Member;
import jejufriends.member.domain.TabooWord;
import jejufriends.member.domain.UpdatePassword;
import jejufriends.member.domain.UserInfoChange;
import jejufriends.member.repository.MemberPageRepository;
import jejufriends.member.repository.SignUpMemberRepository;
import jejufriends.member.utils.CustomPattern;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Service
@RequiredArgsConstructor
public class MemberPageServiceImpl implements MemberPageService{
	
	private final MemberPageRepository memberPageRepository;
	private final SignUpMemberRepository signUpMemberRepository;
	private static List<TabooWord> taboo;
	
	@PostConstruct
	public void init() {
		taboo = signUpMemberRepository.tabooNickNameCheckSelect();
		log.warn("taboo PostConstruct error");
	}
	
	@Override
	public boolean myPagePwdCheck(String email, String pwd) {
		log.info("pwdCheck email = {}" , email);
		log.info("pwdCheck pwd = {}" , pwd);
		Member myPageCheckObj =	memberPageRepository.myPagePwdCheck(email);
		
		if(myPageCheckObj.getPwd().equals(pwd)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Member userInfoSelect(String email) {
		//PhonNumber **
		log.info("memberemail = {} " , email);
		Member member = memberPageRepository.userInfoSelect(email);
		log.info("member = {} " , member);
		//kakao 회원이라면 셋팅을 하고 들어가기,
		if(member.getCheckSnsId() == 1 ) {
			member.setGender("KaKaoMember");
		} else {
			if(member.getGender().equals("male")) {
				member.setGender("male");
			} else {
				member.setGender("female");
			}
		}
		return member;
	}

	@Override
	public String userInfoRole(String email) {
		return memberPageRepository.userInfoRole(email);
	}

	@Override
	public String emailChangeStar(String email) {
		//eamil ** 처리하기 
		String star = "*";
		int atIndex = email.indexOf("@");
		String emailSubStringOne = email.substring(0, 1);
		String emailSubStringOneAndAtIndex = email.substring(1, atIndex);
		int emailSubStringOneAndAtIndexLength = emailSubStringOneAndAtIndex.length();
		String emailSubStringAtIndexAndEnd = email.substring(atIndex);
		
		StringBuilder StarEmailStringBuilder = new StringBuilder();
		StarEmailStringBuilder.append(emailSubStringOne);
		
		for(int i = 0;i<emailSubStringOneAndAtIndexLength;i++) {
			StarEmailStringBuilder.append(star);
		}
		
		StarEmailStringBuilder.append(emailSubStringAtIndexAndEnd);
		
		return StarEmailStringBuilder.toString();
	}
	@Override
	public String phoneNumberChangeStar(String phoneNumber) {
		
		
		if(phoneNumber == null ) {
			return "";
		} else {
			String star = "*";
			String phoneNumberSubStringOne = phoneNumber.substring(0, 5);
			String phoneNumberSubStringTwo = phoneNumber.substring(9);
			
			StringBuilder StarPhoneNumberStringBuilder = new StringBuilder();
			StarPhoneNumberStringBuilder.append(phoneNumberSubStringOne);
			
			for(int i = 0; i < 4 ; i++) {
				StarPhoneNumberStringBuilder.append(star);
			}
			StarPhoneNumberStringBuilder.append(phoneNumberSubStringTwo);
			
			String phoneNumberChangeStar = StarPhoneNumberStringBuilder.toString();	
			return phoneNumberChangeStar;
		}
	
	}

	@Override
	public void updatePasswordMemberInfo(UpdatePassword updatePassword) {
		
		memberPageRepository.updatePasswordMemberInfo(updatePassword);
		
		log.info("updatePassword result");
	}

	@Override
	public String userPasswordSearch(String email) {
		String oldPassword = memberPageRepository.userPasswordSearch(email);
		return oldPassword;
	}

	@Override
	public int userInfoUpdate(UserInfoChange userInfoChange) {
		
		String nickName = userInfoChange.getNickName();
		String phoneNumber = userInfoChange.getPhoneNumber();
		boolean phoneNumberPatternCheck = phoneNumberValidation(phoneNumber);
		
		if(!phoneNumberPatternCheck) {
			log.info("핸드폰번호가 핸드폰 유형이 아님");
			
			return 1;
		}
		
	   for(TabooWord tabooGet : taboo) {
		   String NickNameContainCheck = tabooGet.getTabooWordCheck();
		   if(nickName.contains(NickNameContainCheck)) {
			   //불건전한 닉네임
			   log.info("불건전한 닉네임");
			   return 2;
		   }
	   }
	   int UpdateSucessCheck = memberPageRepository.userInfoUpdate(userInfoChange);
	   if(UpdateSucessCheck == 0 ) {
		   log.info("업데이트 실패");
		   return 3;
	   } else {
		   return 0;
	   }
	}
	
	private boolean phoneNumberValidation(String phoneNumber) {
		return CustomPattern.IS_PHONENUMBER.matcher(phoneNumber).matches();
	}

	@Override
	public int userDelete(String email) {
		int result = memberPageRepository.userDelete(email);
		return result;
	}

}
