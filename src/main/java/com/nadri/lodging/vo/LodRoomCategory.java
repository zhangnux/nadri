package com.nadri.lodging.vo;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Getter
@Setter
@ToString
public class LodRoomCategory {

	private int roomCategoryNo;                 // 룸카테고리 번호
	private String roomCategoryName;            // 룸카테고리 이름
	
}
