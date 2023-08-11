package com.act.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MemberController
{
	@Autowired
	private IMemberService memberService;


	// 메인페이지로 가는 액션
	@RequestMapping("/mainpage.action")
	public String main()
	{
		String result = "";
		result = "/WEB-INF/views/index/MainPage.jsp";

		return result;
	}

	// 로그인(+ 회원가입버튼) 페이지로 가는 액션
	@RequestMapping("/loginpage.action")
	public String loginJoinPage()
	{
		String result = "";

		result = "/WEB-INF/views/member/LoginPage.jsp";

		return result;

	}

	// 회원가입 폼 페이지로 가는 액션
	@RequestMapping("/joinpage.action")
	public String joinForm()
	{
		String result = "";
		result = "/WEB-INF/views/member/JoinPage.jsp";
		return result;
	}

	// 아이디 중복확인
	@RequestMapping("/searchidform.action") // 액션명 파일명으로 바꾸기?
	public String idDupli(HttpServletRequest request)
	{
		String view = "";

		String jmId = request.getParameter("jmId");
		int result = memberService.searchId(jmId);

		request.setAttribute("result", result);

		view = "/WEB-INF/ajax/SearchIdForm.jsp";

		return view;
	}

	// 닉네임 중복확인
	@RequestMapping("/searchnickform.action") // 액션명 파일명으로 바꾸기?
	public String nickDupli(HttpServletRequest request)
	{
		String view = "";

		String jmNickName = request.getParameter("jmNickName");
		int result = memberService.searchNick(jmNickName);

		request.setAttribute("resultNick", result);
		view = "/WEB-INF/ajax/SearchNickForm.jsp";
		return view;
	}

	// 설명 써주세
	@RequestMapping("/join.action")
	public String join(HttpSession session, MemberDTO dto)
	{
		String result = "";
		int num = memberService.join(session, dto);

		if (num != 1)
			result = "redirect:join.action";
		else
			result = "redirect:mainpage.action";

		return result;
	}

	// 회원인지 아닌지 조회, 로그인 성공/실패
	@RequestMapping("/memberlogin.action")
	public String loginCount(MemberDTO dto, HttpSession session)
	{

		String url = "";

		String memNickName = memberService.searchMemNickName(dto);
		String memSid = memberService.searchMemsid(dto);
		
		if (memSid.equals("0"))

		{
			url = "redirect:loginpage.action?error=1";

		} else
		{
			
			session.setAttribute("memNickName", memNickName);
			session.setAttribute("memSid", memSid);
			url = "redirect:mainpage.action";
		}

		return url;
	}

	// 로그아웃하고(session) 다시 메인페이지로 가기
	@RequestMapping("/logout.action")
	public String logOut(HttpSession session)
	{
		session.removeAttribute("memSid");
		String view = "redirect:mainpage.action";
		return view;
	}

	// 아이디찾는 폼으로 가기
	@RequestMapping("/findidpage.action")
	public String findIdForm()
	{
		String view = "/WEB-INF/views/member/FindIdPage.jsp";
		return view;
	}

	// 이름, 주민번호로 아이디 찾기
	@RequestMapping("/findidform.action")
	public String findId(HttpServletRequest request)
	{
		String view = "";

		String result = "";

		MemberDTO dto = new MemberDTO();
		dto.setJmName(request.getParameter("jmName"));
		dto.setJmSsn(request.getParameter("jmSsn"));

		// "0" 또는 특정 jmId 를 반환
		result = memberService.findId(dto);

		if (result.equals("0"))
		{
			result = "아이디가 존재하지 않습니다.";
		} else
		{
			result = "등록된 아이디는 [" + result + "] 입니다.";
		}

		request.setAttribute("result", result);

		view = "/WEB-INF/ajax/FindIdForm.jsp";

		return view;
	}

	// 비밀번호 재설정을 위해 아이디, 이름, 주민번호를 입력받는 폼
	@RequestMapping("/findpwpage.action")
	public String pwRemakeForm()
	{
		String view = "/WEB-INF/views/member/FindPwPage.jsp";
		return view;
	}

	// 입력받은 아이디, 이름, 주민번호에 해당하는 회원이 있는지 검사
	@RequestMapping("/findpw.action")
	public String findPw(MemberDTO dto, HttpSession session)
	{
		String view = "";

		String result = "";

		// "0" 또는 특정 memSid 를 반환
		result = memberService.findPw(dto);

		if (result.equals("0")) // 회원정보 없음
		{
			// result에 0이 담긴채로 FindPwPage.jsp 을 요청, 이 때는 alert이 뜸
			session.setAttribute("result", result);
			view = "redirect:findpwpage.action";
		} else // 회원정보 있음
		{
			// memSid에 조회한 memSid을 담아 넘겨주며 비밀번호 재설정 페이지를 요청.
			session.setAttribute("memSid", result);
			view = "/WEB-INF/views/member/UpdatePwPage.jsp";
		}

		return view;
	}

	// 비밀번호 재설정하기
	@RequestMapping("/updatepw.action")
	public String updatePw(MemberDTO dto, HttpSession session)
	{
		String view = "";

		int result = 0;

		// 0 or 성공시 1
		result = memberService.updatePw(dto);

		if (result > 0)
		{
			session.removeAttribute("memSid"); // null로 만들어주고
			view = "redirect:mainpage.action";
		}
		return view;
	}

	// 메뉴바를 통해 마이페이지로 가기, 디폴트 알림창
	@RequestMapping("/mypage.action")
	public String myPage()
	{
		String result = "";
		result = "/WEB-INF/views/index/MyPage.jsp";
		return result;
	}
	
	// 마이페이지 알림창. AJAX로 처리.

	@RequestMapping("/mypagenoticeform.action")
	public String myPageNotice()
	{
		String result = "";
		// AJAX
		result = "/WEB-INF/ajax/MyPageNoticeForm.jsp";
		return result;
	}

	// 마이페이지 내 정보 및 반려견 관리. AJAX로 처리.
	@RequestMapping("/mypageinfoform.action")
	public String myPageInfo()
	{
		String result = "";
		// AJAX
		result = "/WEB-INF/ajax/MyPageInfoForm.jsp";
		return result;
	}

	// 마이페이지 나의 활동. AJAX로 처리.
	@RequestMapping("/mypageactiveform.action")
	public String myPageActive()
	{
		String result = "";
		// AJAX
		result = "/WEB-INF/ajax/MyPageActiveForm.jsp";
		return result;
	}

	// 마이페이지 나의 신고. AJAX로 처리.
	@RequestMapping("/mypagereportform.action")
	public String myPageReport()
	{
		String result = "";
		// AJAX
		result = "/WEB-INF/ajax/MyPageReportForm.jsp";
		return result;
	}
	
	// 마이페이지 내 정보 및 반려견관리의 반려견 등록하는 폼 모달.
	@RequestMapping("/petinsertpage.action")
	public String petInsertPage()
	{
		String result = "";
		result = "/WEB-INF/views/member/PetInsertPage.jsp";
		return result;
	}
	
	// 마이페이지 내 정보 및 반려견관리의 반려견 등록하는 폼 없애기. AJAX로 처리.
	@RequestMapping("/petinsertcancel.action")
	public String petInsertCancel()
	{
		String result = "";
		// AJAX
		result = "/WEB-INF/ajax/PetInsertCancel.jsp";
		return result;
	}
	
	// 마이페이지 내 정보 및 반려견관리의 반려견 수정하는 폼. AJAX로 처리.
	@RequestMapping("/petupdateform.action")
	public String petUpdateForm()
	{
		String result = "";
		// AJAX
		result = "/WEB-INF/ajax/PetUpdateForm.jsp";
		return result;
	}
	
	// 마이페이지 내 정보 및 반려견관리의 반려견 수정하는 폼 없애기. AJAX로 처리.
	@RequestMapping("/petupdatecancel.action")
	public String petUpdateCancel()
	{
		String result = "";
		// AJAX
		result = "/WEB-INF/ajax/PetInsertCancel.jsp";
		return result;
	}
	
	// 마이페이지에서 자세히보러가기 클릭시 예약정보확인
	@RequestMapping("/reservationinfo.action")
	public String getReservationInfo()
	{
		String result = "";
		
		result = "/WEB-INF/views/index/ReservationInfo.jsp";
		return result;
	}

	// 멤버 리스트 전체 출력 ajax
	@RequestMapping("/memberlistform.action")
	public String memberlistform()
	{
		String result = "";
		
		result = "/WEB-INF/ajax/member/MemberListForm.jsp";
		return result;
	}

}