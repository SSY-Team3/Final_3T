package com.act.walk;

import java.util.ArrayList;

import com.act.walk.WalkDTO;

public interface IWalkDAO
{
	public ArrayList<WalkDTO> list();
	public ArrayList<WalkDTO> IndexTagList();
	public ArrayList<WalkDTO> gradeList();
	// 오늘 대리산책 예약 취소건수
	public int walkCancelNotice(String memSid);
	
	// 오늘 대리산책 후기 달린 건수
	public int walkReviewNotice(String memSid);
	
	// 오늘 대리산책 공고글 반려당한 건수
	public int walkCompanionNotice(String memSid);
	
	// 견주입장에서 본인이 오늘 결제한 대리산책의 시작일 ~ 종료일
	public ArrayList<WalkDTO> walkStartEndNotice(String memSid);
}
