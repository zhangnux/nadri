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
public class LodService {	

	private int serviceNo;              // 서비스번호
	private String serviceName;         // 서비스이름
	
}
