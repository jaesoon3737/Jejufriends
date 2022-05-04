package jejufriends.member.repository;

import java.util.List;

import org.springframework.stereotype.Repository;

import jejufriends.member.domain.TabooContainsMember;
import jejufriends.member.domain.TabooWord;

@Repository
public interface TabooRepository {
	void insertTaboo(TabooWord tabooword);
	Integer deleteTabooWord(Integer deleteTabooNumber);
	List<TabooContainsMember> tabooMemberfindAll();
}
