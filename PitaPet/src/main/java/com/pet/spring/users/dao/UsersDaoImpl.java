package com.pet.spring.users.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.spring.users.dto.UsersDto;

@Repository
public class UsersDaoImpl implements UsersDao{

	@Autowired
	private SqlSession session;
	
	@Override
	public boolean isExist(String inputId) {
		String id=session.selectOne("users.isExist",inputId);
		if(id==null) {
			return false;
		}else {
			return true;
		}
	}

	@Override
	public void insert(UsersDto dto) {
		session.insert("users.insert",dto);
		
	}

	@Override
	public UsersDto getData(String id) {
		// TODO Auto-generated method stub
		return session.selectOne("users.getData",id);
	}

	@Override
	public void updatePwd(UsersDto dto) {
		session.update("users.pwdUpdate", dto);
		
	}

	@Override
	public void updateInfo(UsersDto dto) {
		session.update("users.updateInfo",dto);
		
	}

	@Override
	public void deleteUser(String id) {
		session.delete("users.deleteUser",id);
		
	}

	@Override
	public void updateDonate(UsersDto dto) {
		session.update("users.updateDonate", dto);
	}

}
