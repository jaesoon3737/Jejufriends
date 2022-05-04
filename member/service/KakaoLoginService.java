package jejufriends.member.service;

import java.util.Map;

import jejufriends.member.domain.KakaoMember;


public interface KakaoLoginService {
	
	String getReturnAccessToken(String code);
	Map<String, Object> getLoginMemberInfo(String accessToken);
	boolean kakaoTalkIdCheckExist(KakaoMember kakaoMember);
	void addMemberForKAKAO(KakaoMember kakaoMember);
	
}
