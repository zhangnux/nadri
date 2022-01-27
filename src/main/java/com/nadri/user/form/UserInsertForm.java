package com.nadri.user.form;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
public class UserInsertForm {
	
	private String id;
	private String name;
	private String email;
	private String password;
	private int tel;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdDate;
}
