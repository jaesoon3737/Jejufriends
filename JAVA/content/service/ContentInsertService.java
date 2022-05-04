package jejufriends.content.service;

import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import jejufriends.content.domain.ContentInsertVO;

public interface ContentInsertService {
	public Integer contentInsert(ContentInsertVO contentInsertVO , List<MultipartFile> multipartFiles) throws IOException;
}
