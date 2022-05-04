package jejufriends.member.service;

import java.util.List;
import java.util.Vector;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

import org.springframework.stereotype.Service;

import jejufriends.member.domain.TabooContainsMember;
import jejufriends.member.domain.TabooWord;
import jejufriends.member.repository.SignUpMemberRepository;
import jejufriends.member.repository.TabooRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

/**
 * Commit Date : 2022.03.29
 * @author jaesoon
 *
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class TabooWordServiceImpl implements TabooWordService{
	
	
	private final TabooRepository tabooRepository;
	private final SignUpMemberRepository signUpMemberRepository;
	private static List<TabooWord> taboo;
	/**
	 *   banned word list Map put
	 */
	@PostConstruct
	public void init() {
		taboo = signUpMemberRepository.tabooNickNameCheckSelect();
		log.info("SignUpMemberServiceImpl PostConstruct error");
	}
	
	/**
	 * 
	 */
	@Override
	public String nickNameCheckSelectTaBoo(String nickName) {
		boolean tabooCheckBoolean = false;
		String nickNameCheck = signUpMemberRepository.nickNameCheckSelect(nickName);	
		
		log.warn("nickNameCheckSelect error nick = {}" , nickNameCheck);
		if(nickName.length() >= 3 && nickNameCheck == null) {  
		   for(TabooWord tabooGet : taboo) {
			   String NickNameContainCheck = tabooGet.getTabooWordCheck();
			   if(nickName.contains(NickNameContainCheck)) {
				   tabooCheckBoolean = true;
				   break;
			   }
		   }
		   if(tabooCheckBoolean) {
				return "1";
		   } else {
				return "2";
		   }
		} else {
			return "3";
		}
	}
	/**
	 *  금지어 목록
	 */
	@Override
	public List<TabooWord> findAll() {
		return taboo;
	}
	/**
	 *  금지어를 포함한 회원 목록 
	 */
	@Override
	public List<TabooContainsMember> tabooContainsMemberList() {
		List<TabooContainsMember> tabooContainsMemberCheckList = tabooRepository.tabooMemberfindAll();
		List<TabooContainsMember> MemberList = new Vector<TabooContainsMember>();
		
		for(TabooContainsMember tabooContainsCheck : tabooContainsMemberCheckList) {
			String checkMemberNickName = tabooContainsCheck.getNickName();
			Integer checkMemberEnabled = tabooContainsCheck.getEnabled();
			Integer checkMemberCaution = tabooContainsCheck.getCautionCount();
			
			
			for(TabooWord taboos : taboo) {
				if(checkMemberNickName.contains(taboos.getTabooWordCheck())) {
					MemberList.add(tabooContainsCheck);
					break;
				} 
				if(checkMemberEnabled == 0) {
					MemberList.add(tabooContainsCheck);
					break;
				}
				if(checkMemberCaution != 0) {
					MemberList.add(tabooContainsCheck);
					break;
				}
			}
			
		}
		
		return MemberList;
	}
	/**
	 *   금지어 인설트
	 */
	@Override
	public Integer insertTaboo(TabooWord tabooword) {
		String tabooExistCheckWord =  tabooword.getTabooWordCheck();
		for(TabooWord tabooExistCheck : taboo ) {
			if(tabooExistCheck.getTabooWordCheck().equals(tabooExistCheckWord)) {
				return 1;
			}
		}
		tabooRepository.insertTaboo(tabooword);
		// 맵최대값 구하기 taboo.entrySet().stream().max((entry1, entry2) -> entry1.getValue() > entry2.getValue() ? 1 : -1).get().getKey();
		setTaboo();
		return 0;
	}
	
	/**
	 *  금지어 삭제 
	 */
	@Override
	public Integer deleteTabooWord(Integer deleteTabooNumber) {
		Integer result = tabooRepository.deleteTabooWord(deleteTabooNumber);
		setTaboo();
		return result;
		
	}
	
	/**
	 *  리스트 셋팅 
	 */
	private void setTaboo() {
		taboo = signUpMemberRepository.tabooNickNameCheckSelect();
	}
}
