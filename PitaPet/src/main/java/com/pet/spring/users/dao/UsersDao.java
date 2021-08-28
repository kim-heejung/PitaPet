package com.pet.spring.users.dao;

import com.pet.spring.users.dto.UsersDto;

public interface UsersDao {
	//인자로 전달된 아이디가 존재하는지 여부를 리턴하는 메소드
	public boolean isExist(String inputId);
	//인자로 전달된 가입하는 회원의 정보를 DB에 저장하는 메소드
	public void insert(UsersDto dto);
	//인자로 전달하는 아이디에 해당하는 정보를 리턴하는 메소드
	public UsersDto getData(String id);
	
	public void updatePwd(UsersDto dto);
	
	public void updateInfo(UsersDto dto);
	
	public void deleteUser(String id);
	
	public void updateDonate(UsersDto dto);
}
