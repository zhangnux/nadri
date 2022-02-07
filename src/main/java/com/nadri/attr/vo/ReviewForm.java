package com.nadri.attr.vo;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class ReviewForm {
	
	private int no;
	private int star;
	private String content;
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Date date;
	private int attNo;
	private int userNo;
	private List<MultipartFile> upfiles;
	
}
