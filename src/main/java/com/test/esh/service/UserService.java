package com.test.esh.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.test.esh.dto.DeptDTO;
import com.test.esh.dto.PagingDTO;
import com.test.esh.dto.PositionDTO;
import com.test.esh.dto.RankDTO;
import com.test.esh.dto.UserDTO;
import com.test.esh.mapper.UserMapper;

@Service("UserService")
public class UserService {
	
	private static final Logger log = LoggerFactory.getLogger(UserService.class);
	
	private final UserMapper userMapper;
	
	public UserService(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
	
	// 사용자 목록 조회
	public List<UserDTO> getUserList(PagingDTO paging){
		List<UserDTO> userList = userMapper.getUserList(paging);
		System.out.println("**Service!!");
		log.info("userList  :  {}", userList);
		return userList;
	}
	
	// 부서 조회
	public List<DeptDTO> getDeptList(){
		List<DeptDTO> deptList = userMapper.getDeptList();
		log.info("deptList  :  {}", deptList);
		return deptList;
	}
	
	// 직책 조회
	public List<PositionDTO> getPositionList(){
		List<PositionDTO> positionList = userMapper.getPositionList();
		log.info("positionList  :  {}", positionList);
		return positionList;
	}
			
	// 직급 조회
	public List<RankDTO> getRankList(){
		List<RankDTO> rankList = userMapper.getRankList();
		log.info("rankList  :  {}", rankList);
		return rankList;
	}
	
	//사용자 등록
	public int setUser(UserDTO useDto) {
		int result = userMapper.setUser(useDto);
		return result;
	}
	
	//사용자 검색
	public List<UserDTO> getSearchUserList(String searchKey, String searchValue, @Param("start")Integer start,  @Param("end")Integer end){

		List<UserDTO> userList = userMapper.getSearchUserList(searchKey, searchValue, start, end);
		
		return userList;
	}

	//등록된 사용자 수 cnt
	public int getUserListCnt(UserDTO userDto){
		int total = userMapper.getUserListCnt(userDto);
		return total;
	}
	
	//검색된 사용자 수 cnt
	public int getSearchUserListCnt(String searchKey, String searchValue){
		int total = userMapper.getSearchUserListCnt(searchKey, searchValue);
		return total;
	}
	
	// 선택 사용자 정보 가져오기
	public List<UserDTO> getModifyUserById(@Param("userId")String userId){
		List<UserDTO> modifyUser = userMapper.getModifyUserById(userId);;
		return modifyUser;
	}
	
	// 사용자 수정
	public int setUserModify(UserDTO useDto) {
		int result = userMapper.setUserModify(useDto);
		return result;
	}
	
	// 사용자 삭제
	public int userDelete(String userId) {
		int result = userMapper.userDelete(userId);
		log.info("serviceuserId  :  {}", userId);
		return result;
	}
	
	// 아이디 중복 검사 ajax
	public int idCheck(String userId) {
		int result = userMapper.idCheck(userId);
		log.info("serviceidcheckuserId  :  {}", userId);
		return result;
	}
}
