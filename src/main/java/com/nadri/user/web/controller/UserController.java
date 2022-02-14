package com.nadri.user.web.controller;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.nadri.user.form.ModifyForm;
import com.nadri.coupon.service.UserCouponService;
import com.nadri.user.exception.DeleteErrorException;
import com.nadri.user.exception.LoginErrorException;
import com.nadri.user.exception.ModifyErrorException;
import com.nadri.user.form.InsertForm;
import com.nadri.user.form.KakaoLoginForm;
import com.nadri.user.service.UserService;
import com.nadri.user.util.SessionUtils;
import com.nadri.user.vo.User;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/user")
public class UserController {
	
	private static final String NORMAL_LOGIN_TYPE = "normal";
	private static final String KAKAO_LOGIN_TYPE = "kakao";
	

	@Autowired
	private UserService userService;

	@GetMapping("/login.nadri")
	public String loginform() {
		return "user/loginForm";
	}
	
	@PostMapping("/login.nadri")
	public String login(String id, String password) {
		if (!StringUtils.hasText(id) || !StringUtils.hasText(password)) {
			throw new LoginErrorException("아이디와 비밀번호는 필수 입력값입니다.");
		}
		// UserService의 사용자 인증 서비스 호출
		User user = userService.login(id, password);
		SessionUtils.addAttribute("LOGIN_USER", user);

		return "redirect:/home.nadri";
	}

	// 카카오 로그인 요청을 처리한다.
	@PostMapping("/kakao-login")
	public String loginWithKakao(KakaoLoginForm form) {
		log.info("카카오 로그인 인증정보 : " + form);
		
		User user = User.builder()
					.id(form.getId())
					.name(form.getName())
					.email(form.getEmail())
					.gender(form.getGender())
					.type(KAKAO_LOGIN_TYPE)
					.build();
		
		User savedUser = userService.loginWithKakao(user);
		
		if (savedUser != null) {
			SessionUtils.addAttribute("LOGIN_USER", savedUser);
		} else {
			SessionUtils.addAttribute("LOGIN_USER", user);
		}
		
		return "redirect:/home.nadri";
	}
	
	@GetMapping("/logout.nadri")
	public String logout() {
		// 사용자정보를 세션에서 삭제
		SessionUtils.sessionInvlidate();
		return "redirect:/home.nadri";
	}

	// 회원가입폼 요청페이지
	@GetMapping("/insert.nadri")
	public String joinform() {
		return "user/joinForm";
	}

	// 회원가입 
	@PostMapping("/insert.nadri")
	public String join(InsertForm form) {
		
		User user = User.builder()
				.id(form.getId())
				.password(form.getPassword())
				.name(form.getName())
				.email(form.getEmail())
				.tel(form.getTel())
				.gender(form.getGender())
				.birth(form.getBirth())
				.type(NORMAL_LOGIN_TYPE)
				.build();

			userService.insertUser(user);
			return "redirect:joinCompleted.nadri";
	}
	
	// 회원가입 완료화면
	@GetMapping("/joinCompleted.nadri")
	public String joinCompleted() {
		return "user/joinCompleted";
	}
	
	// 유저 디테일
	@GetMapping("/detail.nadri")
	public String detail() {
		return "user/detail";
	}
	
	// 정보 수정 폼
	@GetMapping("/modify.nadri")
	public String modifyform() {
		return "user/modifyForm";
	}
	
	// 유저 회원변경
	@PostMapping("/modify.nadri")
	public String modify(ModifyForm form) {
		// 세션에 로그인 된 유저 정보를 loginedUser에 담기
		User loginedUser = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		
		if (loginedUser.getId().equals(form.getPassword())) {
			throw new ModifyErrorException("아이디와 비밀번호가 같습니다.");
		}
		
		// 새 User객체 user 생성 후 form의 값 받아오기
		User user = new User();
		BeanUtils.copyProperties(form, user);
		
		// form 값 받아온 user의 아이디는 로그인 된 유저의 id로 설정
		user.setId(loginedUser.getId());
		
		// id로 불러온 새 유저는 savedUser에 저장
		User savedUser = userService.updateUser(user);
		
		// 세션에 저장된 LOGIN_USER에 savedUser값 전달
		SessionUtils.addAttribute("LOGIN_USER", savedUser);
		
		return "redirect:detail.nadri";
			
	}
	
	// 유저 삭제
	@GetMapping("/delete.nadri")
	public String deleteForm() {
		
		return "user/deleteForm";
	}

	@PostMapping("/delete.nadri")
	public String delete(String password) {
		// 세션에서 로그인된 유저 정보 가져와 loginUser에 담기
		User loginUser = (User) SessionUtils.getAttribute("LOGIN_USER");
		
		if(!password.equals(loginUser.getPassword())) {
			throw new DeleteErrorException("비밀번호가 일치하지 않습니다.");
		}
		
		if (password.equals(loginUser.getPassword())) {
			
			userService.deleteUser(password);
			
			SessionUtils.removeAttribute("LOGIN_USER");
			return "user/delCompleted";
		}
		return "redirect:delete.nadri";
	}
	
}
