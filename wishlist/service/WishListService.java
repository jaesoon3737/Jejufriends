package jejufriends.wishlist.service;

import java.util.List;

import jejufriends.course.domain.WishList;
import jejufriends.member.domain.Member;

public interface WishListService {
	List<WishList> wishListAll(Member member);
	void removeOne(WishList wishList);
	void removeAll(Member member);
}
