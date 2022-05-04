package jejufriends.content.service;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import jejufriends.content.domain.ContentInsertVO;
import jejufriends.content.repository.ContentInsertRepository;
import jejufriends.member.utils.MD5Encoding;
import jejufriends.member.utils.Path;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
@RequiredArgsConstructor
public class ContentInsertServiceImp implements ContentInsertService {
	
	private final ContentInsertRepository contentInsertRepository;
	
	@Override
	public Integer contentInsert(ContentInsertVO contentInsertVO , List<MultipartFile> multipartFiles) throws IOException{
		String uploadPath  = Path.FILE_STORE;
	
		if(multipartFiles != null) {
			for(int i = 0;i<multipartFiles.size();i++) {
				MultipartFile file = multipartFiles.get(i);
				
				if(!file.isEmpty()) {
			         String fileName = Md5(file);
			         String fullPath = uploadPath + fileName;
			         file.transferTo(new File(fullPath));
			         
			         if(contentInsertVO.getPhoto1() == null) {
			        	 contentInsertVO.setPhoto1(fileName);
			        	
			         } else {
			        	  if(contentInsertVO.getPhoto2() == null) {
					        	 contentInsertVO.setPhoto2(fileName);
					        	
					      } else {
					    	  if(contentInsertVO.getPhoto3() == null) {
						        	 contentInsertVO.setPhoto3(fileName);
						        
						         }
					      }
			         }
			         
			         if(contentInsertVO.getPhoto2() == null) {
			        	 contentInsertVO.setPhoto2(fileName);
			         }
			         
			         if(contentInsertVO.getPhoto3() == null ) {
			        	 contentInsertVO.setPhoto3(fileName);
			         }
			         
			         if(contentInsertVO.getOriPhoto() == null) {
			        	 String oriFname = file.getOriginalFilename();
			        	 StringBuilder sboriFname = new StringBuilder();
			        	 if(oriFname == null) {
			        		 sboriFname.append(oriFname);
			        	 }
			        	 
			        	 if(oriFname != null) {
			        		 sboriFname.append(oriFname);
			        	 }
			        	 String oriFnames = sboriFname.toString();
			        	 contentInsertVO.setOriPhoto(oriFnames);
			         }
			      }
			}
		} 
		
		
		if(contentInsertVO.getBreakTime() == null || contentInsertVO.getBreakTime().equals("")) {
			contentInsertVO.setBreakTime("브레이크 타임 없음");
		}
		
		if(contentInsertVO.getOpcl() == null || contentInsertVO.getOpcl().equals("")) {
			contentInsertVO.setOpcl("오픈 시간 등록되지 않음");
		}
				
		if(contentInsertVO.getCost1() == null || contentInsertVO.getCost1().equals("")) {
			contentInsertVO.setCost1("0");
		}
		
		if(contentInsertVO.getCost2() == null || contentInsertVO.getCost2().equals("")) {
			contentInsertVO.setCost2("0");
		}
		
		
		if(contentInsertVO.getCost3() == null || contentInsertVO.getCost3().equals("")) {
			contentInsertVO.setCost3("0");
		}
		
		if(contentInsertVO.getPhone() == null || contentInsertVO.getPhone().equals("") ) {
			contentInsertVO.setPhone("0");
		}
		
		if(contentInsertVO.getBigIntro() == null || contentInsertVO.getBigIntro().equals("") ) {
			contentInsertVO.setBigIntro("제목 없음");
		}
		
		if(contentInsertVO.getSmallIntro() == null || contentInsertVO.getSmallIntro().equals("") ) {
			contentInsertVO.setSmallIntro("인트로 없음");
		}
		
		String checkCategory = contentInsertVO.getCheckCategory();
		Integer count = -1;
		if(checkCategory.equals("food")) {
			log.info("안녕하십니까 인설트 객체입니다 = {}" , contentInsertVO);
			contentInsertRepository.foodContentInsert(contentInsertVO);
			count = 1;
		}
		
	    if(checkCategory.equals("hotel")) {
	    	contentInsertRepository.hotelContentInsert(contentInsertVO);
	    	count = 1;
	    }
	    	
	    if(checkCategory.equals("landmark")) {
	    	log.info("안녕하십니까 랜드마크 입니다 = {}" , contentInsertVO);
	    	contentInsertRepository.landmarkContentInsert(contentInsertVO);
	    	count = 1;
	    }
	
	    if(checkCategory.equals("activity")) {
	    	contentInsertRepository.activityContentInsert(contentInsertVO);
	    	count = 1;
	    }
	    
		return count;
	}
	
	
	private String Md5(MultipartFile file) {
		String ofname = file.getOriginalFilename();
		String saveFileName = "";
		try {
			saveFileName = new MD5Encoding(ofname).toString();
		}catch(Exception e) {
			throw new IllegalStateException(e);
		}
		return ofname;
	}

}
