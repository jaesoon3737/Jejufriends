package jejufriends.member.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import jejufriends.member.domain.Member;
import jejufriends.member.domain.TabooWord;



@Repository
public interface SignUpMemberRepository {
	void addMember(Member member);
	String emailCheckSelect(String emailCheck);
	Integer signEmailCheckSelect(String emailCheck);
	Integer signNickNameCheckSelect(String nickNameCheck);
	String nickNameCheckSelect(String nickNameCheck);
	List<TabooWord> tabooNickNameCheckSelect();
}
