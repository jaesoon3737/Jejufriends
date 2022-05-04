package jejufriends.content.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;


import jejufriends.content.repository.ContentInsertRepository;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ContentSelectServiceImp implements ContentSelectService{
	
	private final ContentInsertRepository contentInsertRepository;
	
	@Override
	public Integer contentSelect(String name) {
		List<String> resultList = new ArrayList<String>();
		resultList = contentInsertRepository.contentSelect(name);
		
		Integer result = -1;
		
		for(String resultSelect :resultList) {
			boolean resultBoolean = resultSelect.equals(name);
			if(resultBoolean) {
				result = 1;
			}
		}
		
		return result;
	}

}
