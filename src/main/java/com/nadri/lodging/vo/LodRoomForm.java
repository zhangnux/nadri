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
public class LodRoomForm {

	private int roomFormNo;                 // 룸유형번호
	private int roomFormName;               // 룸유형이름
	
}
