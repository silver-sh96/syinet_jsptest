package com.test.esh.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import com.test.esh.dto.DeptDTO;
import com.test.esh.dto.PagingDTO;
import com.test.esh.dto.PositionDTO;
import com.test.esh.dto.RankDTO;
import com.test.esh.dto.UserDTO;

@Mapper("UserMapper")
public interface UserMapper {
	
	// 사용자 목록 조회
	public List<UserDTO> getUserList(PagingDTO paging);
	
	// 부서 조회
	public List<DeptDTO> getDeptList();
	
	// 직책 조회
	public List<PositionDTO> getPositionList();
		
	// 직급 조회
	public List<RankDTO> getRankList();
	
	// 사용자 등록
	public int setUser(UserDTO userDto);
	
	// 사용자 검색
	public List<UserDTO> getSearchUserList(@Param("searchKey")String searchKey, @Param("searchValue")String searchValue, @Param("start")Integer start,  @Param("end")Integer end);

	// 사용자 리스트 수 구하기
	public int getUserListCnt(@Param("userDto")UserDTO userDto);
	
	// 검색된 사용자 리스트 수 구하기
	public int getSearchUserListCnt(@Param("searchKey")String searchKey, @Param("searchValue")String searchValue);
	
	// 선택 사용자 정보 가져오기
	public List<UserDTO> getModifyUserById(@Param("userId")String userId);
	
	// 사용자 수정
	public int setUserModify(UserDTO userDto);
	
	// 사용자 삭제
	public int userDelete(@Param("userId")String userId);
	
	// 아이디 중복 검사 ajax
	public int idCheck(@Param("userId")String userId);
	
}
