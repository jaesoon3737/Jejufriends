package jejufriends.member.handler;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import lombok.extern.slf4j.Slf4j;


@Slf4j
public class JejuMemberlogoutSuccessHandler implements LogoutSuccessHandler{
	

	@Override
	public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
			throws IOException, ServletException {
		
        if (authentication != null && authentication.getDetails() != null) {
            try {      
                 log.info("logout ¼º°ø");
                 request.getSession().invalidate();
           
            } catch (Exception e) {
                e.printStackTrace();
            }
        } 
        
        HttpSession session = request.getSession();
        String accessToken = (String)session.getAttribute("access_token");
        if(accessToken != null) {
	       	 kakaoLogout(accessToken);
        }
        
        response.setStatus(HttpServletResponse.SC_OK);
        response.sendRedirect("/jejufriends");
	}
	
	private void kakaoLogout(String accessToken) {
        String reqURL = "https://kapi.kakao.com/v1/user/logout";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
            
            int responseCode = conn.getResponseCode();
            log.warn("kakao logout error = {}" , responseCode);
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String result = "";
            String line = "";
            
            while ((line = br.readLine()) != null) {
                result += line;
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
	}


}
