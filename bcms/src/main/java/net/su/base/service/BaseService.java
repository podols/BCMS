package net.su.base.service;

import java.util.Map;

public interface BaseService {
	public Map<String, Object> newspeedSelect(int receiveSeq) throws Exception;
	public int newpeedSize(int receiveSeq) throws Exception;
}
