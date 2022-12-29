package com.test.esh.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.esh.dto.PagingDTO;
import com.test.esh.dto.UserDTO;
import com.test.esh.service.UserService;

@Controller
public class MainController {
	
	private static final Logger log = LoggerFactory.getLogger(UserController.class);
	
	private final UserService userService;
	
	public MainController(UserService userService) {
		this.userService = userService;
	}

	@GetMapping("/main.do")
	public String mainPage(@ModelAttribute("userDto") UserDTO userDto, Model model, PagingDTO paging,
			@RequestParam(value = "nowPage", required = false) Integer nowPage,
			@RequestParam(value = "cntPerPage", required = false) Integer cntPerPage,
			@RequestParam(name = "searchKey", required = false, defaultValue = "user_dept") String searchKey,
			@RequestParam(name = "searchValue", required = false) String searchValue) throws Exception {
		
		System.out.println("**Main!!");
		
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
		
		return "mainPage/main";
	}
}
