package jejufriends.member.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jejufriends.member.repository.LoginRepository;

@Service
public class LoginServiceImpl implements LoginService{
	
	
	private final LoginRepository loginRepository;
	
	@Autowired
	public LoginServiceImpl(LoginRepository loginRepository) {
		this.loginRepository = loginRepository;
	}
	
	@Override
	public boolean loginEmailduplication(String email) {
		int checkEamilDuple = loginRepository.loginEmailduplication(email);
		
		if(checkEamilDuple >= 1) {
			return true;
		} else if (checkEamilDuple == 0) {
			return false;
		} else {
			return true;
		}
	}

}
