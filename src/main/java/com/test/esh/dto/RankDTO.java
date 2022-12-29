package com.test.esh.dto;

public class RankDTO {

	private String rankNum;
	private String rankName;
	
	public String getRankNum() {
		return rankNum;
	}
	public String getRankName() {
		return rankName;
	}
	
	@Override
	public String toString() {
		return "RankDTO [rankNum=" + rankNum + ", rankName=" + rankName + "]";
	}
	
}
