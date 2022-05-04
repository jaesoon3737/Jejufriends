package jejufriends.member.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import jejufriends.member.domain.KakaoMember;
import jejufriends.member.repository.KaKaoLoginRepository;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;



@Slf4j
@Service
@RequiredArgsConstructor
public class KakaoLoginServiceImplel implements KakaoLoginService {
	
	
	private final KaKaoLoginRepository kakaoLoginMyBatisRepository;
	
	@Override
	public String getReturnAccessToken(String code) {
		String accessToken = null;
		String refreshToken = null;
		// ���� URL
		String reqURL ="";

        try {
            URL url = new URL(reqURL);

            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //  URL������ ����¿� ��� �� �� �ְ�, POST Ȥ�� PUT ��û�� �Ϸ��� setDoOutput�� true�� �����ؾ���.
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //	POST ��û�� �ʿ�� �䱸�ϴ� �Ķ���� ��Ʈ���� ���� ����
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream(), "UTF-8"));
            StringBuilder sb = new StringBuilder();
            sb.append(");
            sb.appendey
            sb.append("&");     // ������ ������ ���� ���
            sb.append("&code=" + code);
            bw.write(sb.toString());
            bw.flush();
       
            int responseCode = conn.getResponseCode();
            log.info("kakao token error responseCode= {}" , responseCode);
            log.warn("kakao token error refreshToken= {}" , refreshToken);
            
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
            String line = "";
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            accessToken = element.getAsJsonObject().get("access_token").getAsString();
            refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();
            
            br.close();
            bw.close();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return accessToken;
	}

	@Override
	public Map<String, Object> getLoginMemberInfo(String accessToken) {
		   Map<String, Object> userInfo = new HashMap<String, Object>();
	        String reqURL = "https://kapi.kakao.com/v2/user/me";
	        try {
	            URL url = new URL(reqURL);
	            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	            conn.setRequestMethod("GET");

	            //    ��û�� �ʿ��� Header�� ���Ե� ����
	            conn.setRequestProperty("Authorization", "Bearer " + accessToken);

	            int responseCode = conn.getResponseCode();
	            log.warn("kakao userInfo error responseCode= {}" , responseCode);
	            
	            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));

	            String line = "";
	            String result = "";

	            while ((line = br.readLine()) != null) {
	                result += line;
	            }
	            	
	            JsonParser parser = new JsonParser();
	            JsonElement element = parser.parse(result);
	            log.info("kakao token error responseCode= {}" ,result);
	            log.info("kakao token error responseCode= {}" , element);
	            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
	            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
	            Integer id = element.getAsJsonObject().get("id").getAsInt();
	            String connected_at = element.getAsJsonObject().get("connected_at").getAsString();
	            String pwdAlpha = connected_at.substring(0,4);
	            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
	         
	         if(kakao_account.getAsJsonObject().get("email") != null) {
	            String email = kakao_account.getAsJsonObject().get("email").getAsString();
	            userInfo.put("email", email);
	          }
	            userInfo.put("accessToken", accessToken);
	            userInfo.put("nickname", nickname);
	            userInfo.put("id", id);
	            userInfo.put("pwdAlpha", pwdAlpha);
	            
	            
	            String kakaoPwdOne = userInfo.get("id").toString();
	            String kakaoPwdTwo = userInfo.get("pwdAlpha").toString();
	            StringBuilder sb = new StringBuilder();
	            sb.append(kakaoPwdOne);
	            sb.append(kakaoPwdTwo);
	            
	            String kakaoPwd = sb.toString();
	            
	            userInfo.put("kakaoPwd", kakaoPwd);

	        } catch (IOException e) {
	            e.printStackTrace();
	        }

	        return userInfo;
	}

	@Override
	public boolean kakaoTalkIdCheckExist(KakaoMember kakaoMember) {
		Integer ExistCheck = kakaoLoginMyBatisRepository.kakaoTalkIdExistCheck(kakaoMember);
		if(ExistCheck >= 1) {
			return true;
		}
		return false;
	}

	@Override
	public void addMemberForKAKAO(KakaoMember kakaoMember) {
		kakaoLoginMyBatisRepository.addMemberForKAKAO(kakaoMember);
	}

}
