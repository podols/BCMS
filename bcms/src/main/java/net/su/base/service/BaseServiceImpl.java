package net.su.base.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import net.su.base.dataAccessObject.BaseDataAccessObject;
import net.su.base.valueObject.BaseValueObject;

import org.springframework.stereotype.Service;

@Service
public class BaseServiceImpl implements BaseService {
	
	@Resource
	private BaseDataAccessObject baseDao;
	
	public Map<String, Object> newspeedSelect(int receiveSeq)throws Exception{
		Map<String, Object> map = new HashMap<String,Object>();
		System.out.println("서비스 넘어왔나??");
		List<BaseValueObject> newspeed = baseDao.newspeedSelect(receiveSeq);
		map.put("newspeed", newspeed);
		System.out.println("서비스 넘어갔나????"+newspeed);
		
		return map;
		
	}
	public int newpeedSize(int receiveSeq)throws Exception{
		System.out.println("서비스 넘어왔나??");
		int newpeedSize = baseDao.newpeedSize(receiveSeq);
		System.out.println("서비스 넘어갔나????"+newpeedSize);
		return newpeedSize;
		
	}
}
