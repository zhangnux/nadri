package com.nadri.user.form;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserForm {
	
	private String id;
	private String password;
	private String name;
	private String email;
	private String tel;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	private String gender;
}
