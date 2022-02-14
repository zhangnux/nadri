package com.nadri.user.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;


@NoArgsConstructor
@AllArgsConstructor
@Data
@Builder
public class User {

	private int no;
	private String id;
	private String password; 
	private String name;
	private Date birth;
	private String gender;
	private String tel;
	private String address;
	private int point;
	private String deleteCheck; 
	private String email;
	private String type;
	private Date createdDate;
	private String smsCheck;
	private String emailCheck;
	private Date deletedDate;
}
