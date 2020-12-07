package common.wrapper;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

import common.util.Utils;

public class EncryptWrapper extends HttpServletRequestWrapper{

	//부모타입의 기본생성자 없으므로 파라미터생성자를 통해
	//부모에 HttpServletRequest객체를 전달한다.
	public EncryptWrapper(HttpServletRequest request) {
		super(request);
	}

	/*
	 * 사용자 입력값 name이 password인 경우만,
	 * 암호화처리한 value값을 리턴한다.
	 * */
	@Override
	public String getParameter(String name) {
		//패스워드 일때만
		if("password".equals(name)|| "memberPassword".equals(name)) {
			return Utils.getSha512(super.getParameter(name));
		}else {
			return super.getParameter(name);	//원래 맨날 호출하던 그거		
		}
	}
	

	
	
}
