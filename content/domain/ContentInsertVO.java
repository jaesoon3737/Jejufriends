package jejufriends.content.domain;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@ToString
public class ContentInsertVO {
	private String checkCategory;
	private Integer num;
	private String name;
	private String bigIntro;
	private String smallIntro;
	private String menu1;  // value cost , key menuname 
	private String menu2;
	private String menu3;
	private String cost1;
	private String cost2;
	private String cost3;
	private String address;
	private String photo1;
	private String photo2;
	private String photo3;
	private String oriPhoto;
	private String phone;
	private String opcl;  // 운영시간
	private String breakTime;
	private String breakStartTime;
	private String breakEndTime;
	private String openTime;
	private String closedTime;
	private Integer choosed;
	private String review;
	private Integer star;
	private Integer views;
	private Integer division;
	private String xLocation;
	private String yLocation;
	private String postNumber;
	private String upAddress;
	private String addressR;
	
	
	public ContentInsertVO(String checkCategory, Integer num, String name, String bigIntro, String smallIntro,
			String menu1, String menu2, String menu3, String cost1, String cost2, String cost3, String address,
			String photo1, String photo2, String photo3, String oriPhoto, String phone, String opcl, String breakTime,
			String closedTime, Integer choosed, String review, Integer star, Integer views, Integer division,
			String xLocation, String yLocation, String postNumber, String upAddress, String addressR) {
		super();
		this.checkCategory = checkCategory;
		this.num = num;
		this.name = name;
		this.bigIntro = bigIntro;
		this.smallIntro = smallIntro;
		this.menu1 = menu1;
		this.menu2 = menu2;
		this.menu3 = menu3;
		this.cost1 = cost1;
		this.cost2 = cost2;
		this.cost3 = cost3;
		this.address = address;
		this.photo1 = photo1;
		this.photo2 = photo2;
		this.photo3 = photo3;
		this.oriPhoto = oriPhoto;
		this.phone = phone;
		this.opcl = opcl;
		this.breakTime = breakTime;
		this.closedTime = closedTime;
		this.choosed = choosed;
		this.review = review;
		this.star = star;
		this.views = views;
		this.division = division;
		this.xLocation = xLocation;
		this.yLocation = yLocation;
		this.postNumber = postNumber;
		this.upAddress = upAddress;
		this.addressR = addressR;
	}
	
	
	
	
	
	
	
}
