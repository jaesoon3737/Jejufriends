package jejufriends.wishlist.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jejufriends.course.domain.WishList;
import jejufriends.member.domain.Member;
import jejufriends.wishlist.repository.WishListRepository;

@Service
public class WishListServiceImpl implements WishListService {
	private final WishListRepository wishListRepository;
	
	@Autowired
	public WishListServiceImpl(WishListRepository wishListRepository) {
		this.wishListRepository = wishListRepository;
	}
	
	@Override
	public List<WishList> wishListAll(Member member) {
		return wishListRepository.selectWishListAll(member);
	}

	@Override
	public void removeOne(WishList wishList) {
		wishListRepository.deleteWicum(wishList);
	}

	@Override
	public void removeAll(Member member) {
		wishListRepository.deleteEmail(member);
	}

}
