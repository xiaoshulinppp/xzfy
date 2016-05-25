package com.unionfly.completesyn.security;

import javax.security.auth.callback.Callback;
import javax.security.auth.callback.CallbackHandler;

import org.apache.ws.security.WSPasswordCallback;

public class ClientPasswordCallback implements CallbackHandler {

	public void handle(Callback[] callbacks) {
		WSPasswordCallback pc = (WSPasswordCallback) callbacks[0];
		// Identifier和Password不能为空,否则无法通过验证
		pc.setIdentifier("user_name"); // username
		pc.setPassword("password"); // password
	}
}
