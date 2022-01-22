package com.nadri.user.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@ToString
@Setter
@Getter
public class User {

	private int no;
	private String id;
	private String password; 
	private String name;
	private int age;
	private String gender;
	private int tel;
	private String address;
	private int point;
	private String deleteCheck; 
	private String email;
	private String type;
	@JsonFormat(pattern = "yyyy년 M월 d일")
	private Date createdDate;
	private String smsCheck;
	private String emailCheck;
}
