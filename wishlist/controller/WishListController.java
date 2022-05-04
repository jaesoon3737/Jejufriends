package jejufriends.wishlist.controller;

import java.util.List;

import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import jejufriends.course.domain.WishList;
import jejufriends.member.domain.Member;
import jejufriends.wishlist.service.WishListService;
import lombok.RequiredArgsConstructor;

@Controller
@RequestMapping("/jejufriends/wishlist")
@RequiredArgsConstructor
public class WishListController {
	private final WishListService wishListService;
	
	@Secured({"ROLE_ADMIN" , "ROLE_SUPERADMIN", "ROLE_USER"})
	@GetMapping("wishlist.do")
	public String wishList() {
		return "/wishlist/wishlist";
	}
	
	@Secured({"ROLE_ADMIN" , "ROLE_SUPERADMIN", "ROLE_USER"})
	@PostMapping("wishlistList")
	@ResponseBody
	public List<WishList> wishListList(Member member) {
		return wishListService.wishListAll(member);
	}
	
	@Secured({"ROLE_ADMIN" , "ROLE_SUPERADMIN", "ROLE_USER"})
	@PostMapping("removeOne")
	@ResponseBody
	public void removeOne(WishList wishList) {
		wishListService.removeOne(wishList);
	}
	
	@Secured({"ROLE_ADMIN" , "ROLE_SUPERADMIN", "ROLE_USER"})
	@PostMapping("removeAll")
	@ResponseBody
	public void removeAll(Member member) {
		System.out.println("member.getEmail: " + member.getEmail());
		wishListService.removeAll(member);
	}
}
