package jejufriends.member.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class MD5Encoding {
	private String result;
	
	public MD5Encoding(String input) throws UnsupportedEncodingException , NoSuchAlgorithmException{
		MessageDigest mdMD5 = MessageDigest.getInstance("MD5");
		mdMD5.update(input.getBytes("utf-8"));
		byte[] md5Hash = mdMD5.digest();
		StringBuilder hashMD5file = new StringBuilder();
		for(byte hashs :md5Hash) {
			String hashStr = String.format("%02x", hashs);
			hashMD5file.append(hashStr);
		}
		result = hashMD5file.toString();
		
	
	}
	public String toString() {
		return result;
	}
}
