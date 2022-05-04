package jejufriends.member.repository;

import org.springframework.stereotype.Repository;

@Repository
public interface LoginRepository {
	int loginEmailduplication(String email);
}
