package com.unionfly.completesyn.security;

import java.io.IOException;

import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;
import javax.security.auth.callback.UnsupportedCallbackException;

import org.apache.log4j.Logger;
import org.apache.ws.security.WSPasswordCallback;

public class ServerPasswordCallback implements CallbackHandler {
	Logger log = Logger.getLogger(ServerPasswordCallback.class);

	public void handle(Callback[] callbacks) throws IOException,
			UnsupportedCallbackException {
		WSPasswordCallback pc = (WSPasswordCallback) callbacks[0];
		if (pc.getIdentifier().equals("user_name")) { // username
			pc.setPassword("password"); // password
			System.out.println("通过安全认证");
		} else {
			throw new SecurityException("服务端用户验证失败");
		}
	}

}
