package com.test.esh.controller;

import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.esh.dto.DeptDTO;
import com.test.esh.dto.PagingDTO;
import com.test.esh.dto.PositionDTO;
import com.test.esh.dto.RankDTO;
import com.test.esh.dto.UserDTO;
import com.test.esh.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger log = LoggerFactory.getLogger(UserController.class);

	private final UserService userService;

	public UserController(UserService userService) {
		this.userService = userService;
	}

	// 사용자 목록 조회 (페이징 처리)
	@GetMapping("/userList.do")
	public String getUserList(@ModelAttribute("userDto") UserDTO userDto, Model model, PagingDTO paging,
			@RequestParam(value = "nowPage", required = false) Integer nowPage,
			@RequestParam(value = "cntPerPage", required = false) Integer cntPerPage,
			@RequestParam(name = "searchKey", required = false, defaultValue = "user_dept") String searchKey,
			@RequestParam(name = "searchValue", required = false) String searchValue) throws Exception {

		System.out.println("***** GET - UserList.do *****");
		
		int total = userService.getUserListCnt(userDto);
		model.addAttribute("total", total);
		log.info("total  :  {}", total);

		if (nowPage == null && cntPerPage == null) {
			nowPage = 1;
			cntPerPage = 5;
		} else if (nowPage == null) {
			nowPage = 1;
		} else if (cntPerPage == null) {
			cntPerPage = 5;
		}
		paging = new PagingDTO(total, nowPage, cntPerPage);
		model.addAttribute("paging", paging);
		log.info("paging  :  {}", paging);

		model.addAttribute("userList", userService.getUserList(paging));
		log.info("userList  :  {}", userService.getUserList(paging));
		
		if (searchValue != null) {

			model.addAttribute("searchKey", searchKey);
			log.info("searchKey  :  {}", searchKey);

			model.addAttribute("searchValue", searchValue);
			log.info("searchValue  :  {}", searchValue);
			
			int searchTotal = userService.getSearchUserListCnt(searchKey, searchValue);
			model.addAttribute("total", searchTotal);
			log.info("searchtotal  :  {}", searchTotal);
			
			paging = new PagingDTO(searchTotal, nowPage, cntPerPage);
			model.addAttribute("paging", paging);
			log.info("searchpaging  :  {}", paging);

			model.addAttribute("userList", userService.getSearchUserList(searchKey, searchValue, paging.getStart(), paging.getEnd()));
			log.info("searchuserList  :  {}", userService.getSearchUserList(searchKey, searchValue, paging.getStart(), paging.getEnd()));
		}

		return "user/userList";
	}

	// 사용자 등록 화면
	@GetMapping("/userReg.do")
	public String userReg(Model model) throws Exception {
		List<DeptDTO> deptList = userService.getDeptList();
		List<PositionDTO> positionList = userService.getPositionList();
		List<RankDTO> rankList = userService.getRankList();

		log.info("deptList  :  {}", deptList);
		log.info("positionList  :  {}", positionList);
		log.info("rankList  :  {}", rankList);

		for (DeptDTO dept : deptList) {
			System.out.println(dept);
		}
		for (PositionDTO position : positionList) {
			System.out.println(position);
		}
		for (RankDTO rank : rankList) {
			System.out.println(rank);
		}

		model.addAttribute("deptList", deptList);
		model.addAttribute("positionList", positionList);
		model.addAttribute("rankList", rankList);
		return "user/userReg";
	}

	// 사용자 등록 실행
	@PostMapping("/userReg.do")
	public String setUser(UserDTO userDto) throws Exception {
		System.out.println("사용자등록 실행!!");
		userService.setUser(userDto);

		log.info("userDto  :  {}", userDto);

		return "redirect:/user/userList.do";
	}


	// 사용자 수정 페이지
	@GetMapping("/userModify.do")
	public String userModify(@RequestParam("userId") String userId, Model model) throws Exception {

		List<UserDTO> modifyUser = userService.getModifyUserById(userId);
		List<DeptDTO> deptList = userService.getDeptList();
		List<PositionDTO> positionList = userService.getPositionList();
		List<RankDTO> rankList = userService.getRankList();

		model.addAttribute("modifyUser", modifyUser);
		model.addAttribute("deptList", deptList);
		model.addAttribute("positionList", positionList);
		model.addAttribute("rankList", rankList);

		log.info("userId  :  {}", userId);
		log.info("modifyUser  :  {}", modifyUser);

		return "user/userModify";
	}

	// 사용자 수정 동작
	@PostMapping("/userModify.do")
	public String setUserModify(UserDTO userDto) throws Exception {
		userService.setUserModify(userDto);

		log.info("userDto  :  {}", userDto);

		return "redirect:/user/userList.do";
	}

	// 사용자 삭제
	@PostMapping("/userDelete.do")
	public String userDelete(@RequestParam("userId") String userId) throws Exception {

		userService.userDelete(userId);
		log.info("userId  :  {}", userId);

		return "user/userList";
	}

	// 아이디 중복검사 ajax
	@PostMapping("/idCheck.do")
	@ResponseBody
	public int idCheck(@RequestParam("userId") String userId) throws Exception {
		int result = userService.idCheck(userId);
		log.info("ControlleridcheckUserId  :  {}", userId);
		return result;
	}

}
