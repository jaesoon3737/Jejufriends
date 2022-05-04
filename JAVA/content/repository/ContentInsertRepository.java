package jejufriends.content.repository;

import java.util.List;

import jejufriends.content.domain.ContentInsertVO;

public interface ContentInsertRepository {
	public Integer foodContentInsert(ContentInsertVO contentInsertVO);
	public Integer hotelContentInsert(ContentInsertVO contentInsertVO);
	public Integer activityContentInsert(ContentInsertVO contentInsertVO);
	public Integer landmarkContentInsert(ContentInsertVO contentInsertVO);
	public List<String> contentSelect(String name);
}
