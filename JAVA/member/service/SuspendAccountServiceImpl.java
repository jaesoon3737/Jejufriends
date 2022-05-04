package jejufriends.member.service;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;

import jdk.internal.org.jline.utils.Log;
import jejufriends.member.domain.Member;
import jejufriends.member.domain.TabooContainsMember;
import jejufriends.member.domain.TabooWord;
import jejufriends.member.repository.SignUpMemberRepository;
import jejufriends.member.repository.SuspendRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
/**
 * Commit Date : 2022.04.02
 * @author jaesoon
 *
 */
@Slf4j
@Service
@RequiredArgsConstructor
public class  SuspendAccountServiceImpl implements  SuspendAccountService {
	
	private final TabooWordService tabooWordService;
	private final SuspendRepository suspendRepository;

	/**
	 *  idNumber : suspendAccount
	 *  enabled : enabledAccount
	 * 
	 * 			if , suspendAccount enabled	-> cautionCount -1
	 * 			if , suspendAccount disabled
	 */
	@Override
	public Integer suspendAccount(Long idNumber , Integer enabled) {
		Integer result = -1;
		if(enabled == 1) {
			// enabled == 1 , Account status enabled  -> disabled
			
			result = suspendRepository.suspendAccount(idNumber);
		} else if (enabled == 0) {
			// enabled == 0 , Account status disabled -> enabled
			result = suspendRepository.suspendAccountEnable(idNumber);
			Member member = suspendRepository.findMember(idNumber);
			if(member.getCautionCount() > 0) {
				suspendRepository.cautionAccountMinus(idNumber);
			}
		}
		return result;
	}
	/**
	 * idNumber : cautionAccount
	 * 
	 * 		Member CautionCount + 1  , if CautionCount >= 3  -> CautionCount ==3
	 */
	@Override
	public Integer cautionAccount(Long idNumber) {
		//cationAccount cautionCount + 1
		Integer result = suspendRepository.cautionAccount(idNumber);
		//findMember
		Member member = suspendRepository.findMember(idNumber);
		int cautionCount = member.getCautionCount();
		// cautionCount MaxCount 3
		if(cautionCount >= 3) {
			suspendRepository.cautionCount3Account(idNumber);
		}
		
		return result;
	}
	
	/**
	 * idNumber : memberidNumber
	 */
	@Override
	public Member findMember(Long idNumber) {
		
		return suspendRepository.findMember(idNumber);
	}
	
	/**
	 * memberList : banned Member list 
	 */
	@Override
	public Integer tabooContainsMemberForDefaultNickNameChange(List<TabooContainsMember> memberList) {
		// member nickName update
		List<TabooWord> bannedWordList = tabooWordService.findAll();
		List<TabooContainsMember> nickNameChangeMemberList = new ArrayList<>();
		for(TabooWord bannedWord : bannedWordList) {
			String bannedCheckWord = bannedWord.getTabooWordCheck();
			for(TabooContainsMember member : memberList) {
				if(member.getNickName().contains(bannedCheckWord)) {
					log.info("memberList  get mail= {}" , member.getEmail() );
					nickNameChangeMemberList.add(member);
					log.info("memberList = {}" , nickNameChangeMemberList );
				}
			}
		
		}
		for(int i = 0; i<nickNameChangeMemberList.size();i++) {
		log.info("memberList = {}" , nickNameChangeMemberList.get(i) );
		}
		
		if(nickNameChangeMemberList.size() >= 1) {
			suspendRepository.tabooContainsMemberForDefaultNickNameChange(nickNameChangeMemberList);
		}
		
		List<TabooContainsMember> suspendslist = new ArrayList<TabooContainsMember>();
		// select Caution3 for SuspendAccount
		if(memberList != null) {
			suspendslist = suspendRepository.tabooContainsMemberForDefaultNickNameChangeCaution3SuspendAccount(memberList);
		}
		for(TabooContainsMember suspendMember : suspendslist) {
			Integer count = suspendMember.getCautionCount();
			Long idNumber = suspendMember.getIdNumber();
			if(count >= 3) {
				suspendRepository.suspendAccount(idNumber);
				suspendRepository.cautionCount3Account(idNumber);
			}
		}
		return null;
	}

}
