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
public class LodRoom {

	private int no;                 		 	// 룸번호
	private LodInformation lodinformation;   	// 숙소번호
	private String name;             	 	 	// 룸이름
	private int roomPerPerson;           		// 룸 기준인원
	private int roomMaxPerson;           		// 룸 최대인원
	private int price;               	 		// 룸 가격
	private int discountPrice;        			// 룸 할인가격
	private LodRoomCategory lodRoomCategory;  	// 룸카테고리번호
	private LodRoomForm lodRoomForm;            // 룸 유형번호
}
