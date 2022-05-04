package jejufriends.member.repository;

import org.springframework.stereotype.Repository;

import jejufriends.member.domain.KakaoMember;

@Repository
public interface KaKaoLoginRepository {	
	Integer kakaoTalkIdExistCheck(KakaoMember kakaoMember);
	void addMemberForKAKAO(KakaoMember kakaoMember);	
}
