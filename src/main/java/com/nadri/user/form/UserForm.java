package com.nadri.user.form;

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
	private String age;
	private String gender;
}
