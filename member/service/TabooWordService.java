package jejufriends.member.service;

import java.util.List;

import jejufriends.member.domain.TabooContainsMember;
import jejufriends.member.domain.TabooWord;

public interface TabooWordService {
	String nickNameCheckSelectTaBoo(String nickName);
	List<TabooWord> findAll();
	Integer insertTaboo(TabooWord tabooword);
	Integer deleteTabooWord(Integer deleteTabooNumber);
	List<TabooContainsMember> tabooContainsMemberList();
}
