package jejufriends.member.service;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.stereotype.Service;

import jejufriends.member.domain.AdminMemberInfoChange;
import jejufriends.member.domain.AdminUserInfo;
import jejufriends.member.domain.Paging;
import jejufriends.member.domain.PagingKeyword;
import jejufriends.member.repository.AdminRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class MemberManagementServiceImpl implements MemberManagementService {
	
	private final AdminRepository adminRepository;
	
	@Override
	public List<AdminUserInfo> findAll(Paging paging) {
	    //log.info("columnOrderBy = {}" , paging.getColumnOrderBy());
	    List<AdminUserInfo> userInfoList = adminRepository.memberfindAll(paging);
	    

	    
		for(AdminUserInfo userSetting : userInfoList) {
			String authoruty = userSetting.getAuthority();
			if(authoruty.equals("ROLE_ADMIN")) {
				userSetting.setAuthority("관리자");
			} else if(authoruty.equals("ROLE_SUPERADMIN")) {
				userSetting.setAuthority("최고 관리자");
			} else if(authoruty.equals("ROLE_USER")) {
				userSetting.setAuthority("회원");
			}
			
		}
		//date - > String LastDate , RegistRationDate
		DateFormat df = new SimpleDateFormat("yyyy년 MM월 dd일");
		for(AdminUserInfo memberinfo : userInfoList) {
			String resultLastDate = df.format(memberinfo.getLastDate());
			String resultRegistRationDate = df.format(memberinfo.getRegistRationDate());
			memberinfo.setLastDateString(resultLastDate);
			memberinfo.setRegistRationDateString(resultRegistRationDate);
		}
		
		return userInfoList;
	}
	
	@Override
	public Integer countMember(PagingKeyword pagingKeyword) {
		return adminRepository.countMember(pagingKeyword);
	}
	/**
	 *  login after last date update , 
	 */
	@Override
	public void updateLastDate(String userEmail) {
		adminRepository.updateLastDate(userEmail);
	}

	@Override
	public AdminUserInfo memberInfofind(String email) {
		AdminUserInfo member = adminRepository.memberInfofind(email);
		DateFormat df = new SimpleDateFormat("yyyy년 MM월 dd일");
		String resultLastDate = df.format(member.getLastDate());
		String resultRegistRationDate = df.format(member.getRegistRationDate());
		member.setLastDateString(resultLastDate);
		member.setRegistRationDateString(resultRegistRationDate);
		
		return member;
	}
	
	/**
	 * Admin Page Member Update  if , result = 1 success
	 */
	@Override
	public Integer memberInfoChange(AdminMemberInfoChange adminMemberInfoChange) {
		Integer result = adminRepository.memberInfoChange(adminMemberInfoChange);
		Integer resultGrade = adminRepository.memberInfoChangeGrade(adminMemberInfoChange);
		return result;
	}


	@Override
	public Integer adminAuthority(Long idNumber, String authority) {
		authority.trim();
		
		if(authority.equals("유저")) {
			log.info("result 유저 = {}" , idNumber);
			return adminRepository.adminAuthorization(idNumber);
		} else if(authority.equals("관리자")) {
			log.info("result 관리자");
			return adminRepository.adminDeauthorization(idNumber);
		} else if(authority.equals("최고 관리자")) {
			return null;
		} else {
			return null;
		}
	}

	@Override
	public boolean nickNameDuplication(String nickName) {
		String selectNickName = adminRepository.findNickNameDuplication(nickName);
		
		
		if(selectNickName == null) {
			return false;
		} else if (selectNickName.equals(nickName)) {
			return true;
		} else {
			return false;
		}

	}
}
