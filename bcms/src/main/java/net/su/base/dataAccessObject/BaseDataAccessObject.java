package net.su.base.dataAccessObject;

import java.util.List;

import net.su.base.valueObject.BaseValueObject;

import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

@Repository
public class BaseDataAccessObject extends SqlSessionDaoSupport{
	
	public List<BaseValueObject> newspeedSelect(int receiveSeq) throws Exception{
		System.out.println("Dao 넘아왔나?");
		return getSqlSession().selectList("baseMapper.newspeedSelect",receiveSeq);
	}
	public int newpeedSize(int receiveSeq) throws Exception{
		System.out.println("Dao 넘아왔나?");
		return getSqlSession().selectOne("baseMapper.newpeedSize",receiveSeq);
	}
}