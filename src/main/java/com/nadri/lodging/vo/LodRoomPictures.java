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
public class LodRoomPictures {

	private LodRoom lodRoom;             // 룸번호
	private String roomPicture;          // 룸사진
}
