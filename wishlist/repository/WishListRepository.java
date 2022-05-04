package jejufriends.wishlist.repository;

import java.util.List;

import jejufriends.course.domain.WishList;
import jejufriends.member.domain.Member;

public interface WishListRepository {
	List<WishList> selectWishListAll(Member member);
	void deleteWicum(WishList wishList);
	void deleteEmail(Member member);
}
