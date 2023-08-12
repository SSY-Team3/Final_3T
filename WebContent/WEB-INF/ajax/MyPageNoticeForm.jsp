<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<link rel="icon" href="./images/logo_transparent.png"/>
<meta charset="UTF-8"> 
<title>마이페이지_알림창</title>

<script type="text/javascript">
	
	$().ready(function()
	{
		$(".detailBtn").click(function()
		{
			window.location.href = "reservationinfo.action";
		});
	});
	
</script>
<style type="text/css">

.noNotice {margin: 20px 0px 0px 150px;}

</style>
</head>
<body>
			<div class="row">
				<div class="col-md-6 container-mypage" style="height: 440px; overflow: auto;">
					
					<h3><span class="badge" >알림</span></h3>
					<div><!-- 알림 목록 시작 -->
					
						<c:choose>
						<c:when test="${countWalkCancel==0 && countSittingCancel==0 &&
										countWalkReview==0 && countSittingReview==0 &&
										countWalkCompanion==0 && countSittingCompanion==0 &&
										countProfilCompanion==0}">
							<div class="noNotice"><h2><span>오늘 들어온 알림이 없습니다.</span></h2></div>
						</c:when>
						<c:otherwise>
						
							<c:forEach begin="1" end="${countWalkCancel}" varStatus="loop">
								<div class="card">
									<div class="card-header d-flex justify-content-between"">
									대리산책
									</div>	
							    	  <div class="row g-0">
							    	    <div class="col-md cardInfo" >
							    	      <div class="card-body">
							    	        <div class="oneText">
							    		        <span class="card-text" style="font-size: 14pt;">예약이 취소됐습니다. 대리산책에서 확인해보세요.</span>
							    	        </div>
							    	      </div>
							    	    </div>
							    	  </div>
							    </div>	
							</c:forEach>
							
							<c:forEach begin="1" end="${countSittingCancel}" varStatus="loop">
								<div class="card">
									<div class="card-header d-flex justify-content-between"">
									펫시팅
									</div>	
							    	  <div class="row g-0">
							    	    <div class="col-md cardInfo" >
							    	      <div class="card-body">
							    	        <div class="oneText">
							    		        <span class="card-text" style="font-size: 14pt;">예약이 취소됐습니다. 펫시팅세어 확인해보세요.</span>
							    	        </div>
							    	      </div>
							    	    </div>
							    	  </div>
							    </div>	
							</c:forEach>
							
							<c:forEach begin="1" end="${countSittingCancel}" varStatus="loop">
								<div class="card">
									<div class="card-header d-flex justify-content-between"">
									펫시팅
									</div>	
							    	  <div class="row g-0">
							    	    <div class="col-md cardInfo" >
							    	      <div class="card-body">
							    	        <div class="oneText">
							    		        <span class="card-text" style="font-size: 14pt;">예약이 취소됐습니다. 펫시팅세어 확인해보세요.</span>
							    	        </div>
							    	      </div>
							    	    </div>
							    	  </div>
							    </div>	
							</c:forEach>
							
							<c:forEach begin="1" end="${countWalkReview}" varStatus="loop">
								<div class="card">
									<div class="card-header d-flex justify-content-between"">
										대리산책
									</div>	
							    	  <div class="row g-0">
							    	    <div class="col-md cardInfo" >
							    	      <div class="card-body">
							    	        <div class="oneText">
							    		        <span class="card-text" style="font-size: 14pt;">후기가 달렸습니다. 대리산책에서 확인해보세요.</span>
							    	        </div>
							    	      </div>
							    	    </div>
							    	  </div>
							    </div>	
							</c:forEach>
							
							<c:forEach begin="1" end="${countSittingReview}" varStatus="loop">
								<div class="card">
									<div class="card-header d-flex justify-content-between"">
										펫시팅
									</div>	
							    	  <div class="row g-0">
							    	    <div class="col-md cardInfo" >
							    	      <div class="card-body">
							    	        <div class="oneText">
							    		        <span class="card-text" style="font-size: 14pt;">후기가 달렸습니다. 펫시팅에서 확인해보세요.</span>
							    	        </div>
							    	      </div>
							    	    </div>
							    	  </div>
							    </div>		
							</c:forEach>
							
							<c:forEach begin="1" end="${countWalkCompanion}" varStatus="loop">
								<div class="card">
									<div class="card-header d-flex justify-content-between"">
										대리산책
									</div>	
							    	  <div class="row g-0">
							    	    <div class="col-md cardInfo" >
							    	      <div class="card-body">
							    	        <div class="oneText">
							    		        <span class="card-text" style="font-size: 14pt;">공고글의 신고가 반려당했습니다. 
							    		        수정이 필요합니다. </span>
							    	        </div>
							    	      </div>
							    	    </div>
							    	  </div>
							    </div>		
							</c:forEach>
							
							<c:forEach begin="1" end="${countSittingCompanion}" varStatus="loop">
								<div class="card">
									<div class="card-header d-flex justify-content-between"">
										펫시팅
									</div>	
							    	  <div class="row g-0">
							    	    <div class="col-md cardInfo" >
							    	      <div class="card-body">
							    	        <div class="oneText">
							    		        <span class="card-text" style="font-size: 14pt;">돌봄장소의 신고가 반려당했습니다.
							    		        수정이 필요합니다. </span>
							    	        </div>
							    	      </div>
							    	    </div>
							    	  </div>
							    </div>		
							</c:forEach>
							
							<c:forEach begin="1" end="${countProfilCompanion}" varStatus="loop">
								<div class="card">
									<div class="card-header d-flex justify-content-between"">
										프로필
									</div>	
							    	  <div class="row g-0">
							    	    <div class="col-md cardInfo" >
							    	      <div class="card-body">
							    	        <div class="oneText">
							    		        <span class="card-text" style="font-size: 14pt;">프로필의 신고가 반려당했습니다.
							    		        수정이 필요합니다. </span>
							    	        </div>
							    	      </div>
							    	    </div>
							    	  </div>
							    </div>		
							</c:forEach>
						</c:otherwise>
						
						</c:choose>	
					    
					</div><!-- 알림 목록 끝 -->
				
				</div><!-- 1행1열 끝 -->
				
				
				<div class="col-md-6 container-mypage" style="height: 440px; overflow: auto;">
					<h3><span class="badge">내가 결제한 예약</span></h3>
					
					<div><!-- 예약내역 시작 -->
					<c:choose>
					<c:when test="${empty MemWalkStartEnd && empty MemSittingStartEnd}">
						<div class="noNotice"><h2><span>오늘 들어온 알림이 없습니다.</span></h2></div>
					</c:when>
					<c:otherwise>
						
						<c:forEach items="${MemWalkStartEnd }" var="MemWalkStartEnd">
							<div class="card">
								<div class="card-header d-flex justify-content-between">
									대리산책
									<button type="button" class="detailBtn" value="${MemWalkStartEnd.wbSid }">
									자세히보러가기
									</button>
								</div>	
						    	  <div class="row g-0">
						    	    <div class="col-md cardInfo" >
						    	      <div class="card-body">
						    	        <div class="oneText">
						    		        <span class="card-text"><small class="text-muted">시작일~종료일</small></span><br>
						    		        <span class="card-text" style="font-size: 14pt;">
						    		        ${MemWalkStartEnd.wbStart } ~ ${MemWalkStartEnd.wbEnd }
						    		        </span>
						    	        </div>
						    	      </div>
						    	    </div>
						    	  </div>
						    </div>
						</c:forEach>
						
						<c:forEach items="${MemSittingStartEnd }" var="MemSittingStartEnd">
							<div class="card">
								<div class="card-header d-flex justify-content-between">
									펫시팅
									<button type="button" class="detailBtn" value="${MemSittingStartEnd.sbSid }">
									자세히보러가기
									</button>
								</div>	
						    	  <div class="row g-0">
						    	    <div class="col-md cardInfo" >
						    	      <div class="card-body">
						    	        <div class="oneText">
						    		        <span class="card-text"><small class="text-muted">시작일~종료일</small></span><br>
						    		        <span class="card-text" style="font-size: 14pt;">
						    		        ${MemSittingStartEnd.sbStart } ~ ${MemSittingStartEnd.sbEnd }
						    		        </span>
						    	        </div>
						    	      </div>
						    	    </div>
						    	  </div>
						    </div>
						</c:forEach>
					</c:otherwise>
					</c:choose>
					
					</div><!-- 예약 내역 끝 -->
					
				</div><!-- 1행 2열 끝 -->
				
			</div><!-- 1행 끝 -->
			
			<div class="row">
				<div class="col-md-6 container-mypage" style="height: 440px; overflow: auto;">
					<h3><span class="badge">나에게 들어온 예약/대리산책</span></h3>
					<div><!-- 대리산책러 예약내역 시작 -->
						<div class="card">
							<div class="card-header d-flex justify-content-between"">
								대리산책 <button type="button" class="detailBtn">자세히보러가기</button>
							</div>	
					    	  <div class="row g-0">
					    	    <div class="col-md cardInfo" >
					    	      <div class="card-body">
					    	        <div class="oneText">
					    		        <span class="card-text"><small class="text-muted">시작일~종료일</small></span><br>
					    		        <span class="card-text" style="font-size: 14pt;">2023-08-04 14:00 ~ 2023-08-04 16:00</span>
					    	        </div>
					    	      </div>
					    	    </div>
					    	  </div>
					    </div>
					
					
						<div class="card">
							<div class="card-header d-flex justify-content-between"">
								대리산책 <button type="button" class="detailBtn">자세히보러가기</button>
							</div>	
					    	  <div class="row g-0">
					    	    <div class="col-md cardInfo" >
					    	      <div class="card-body">
					    	        <div class="oneText">
					    		        <span class="card-text"><small class="text-muted">시작일~종료일</small></span><br>
					    		        <span class="card-text" style="font-size: 14pt;">2023-08-04 14:00 ~ 2023-08-04 16:00</span>
					    	        </div>
					    	      </div>
					    	    </div>
					    	  </div>
					    </div>
					
						<div class="card">
							<div class="card-header d-flex justify-content-between"">
								대리산책 <button type="button" class="detailBtn">자세히보러가기</button>
							</div>	
					    	  <div class="row g-0">
					    	    <div class="col-md cardInfo" >
					    	      <div class="card-body">
					    	        <div class="oneText">
					    		        <span class="card-text"><small class="text-muted">시작일~종료일</small></span><br>
					    		        <span class="card-text" style="font-size: 14pt;">2023-08-04 14:00 ~ 2023-08-04 16:00</span>
					    	        </div>
					    	      </div>
					    	    </div>
					    	  </div>
					    </div>
					    
					</div><!-- 대리산책러 예약내역 시작 -->
				</div><!-- 2행1열 끝 -->
				
				<div class="col-md-6 container-mypage" style="height: 440px; overflow: auto;">
					<h3><span class="badge">나에게 들어온 예약/펫시팅</span></h3>
					<div><!-- 펫시터 예약내역 시작 -->
						<div class="card">
							<div class="card-header d-flex justify-content-between">
								펫시팅 <button type="button" class="detailBtn">자세히보러가기</button>
							</div>	
					    	  <div class="row g-0">
					    	    <div class="col-md cardInfo" >
					    	      <div class="card-body">
					    	        <div class="oneText">
					    		        <span class="card-text"><small class="text-muted">시작일~종료일</small></span><br>
					    		        <span class="card-text" style="font-size: 14pt;">2023-08-08 14:00 ~ 2023-08-10 16:00</span>
					    	        </div>
					    	      </div>
					    	    </div>
					    	  </div>
					    </div>
						
						<div class="card">
							<div class="card-header d-flex justify-content-between">
								펫시팅 <button type="button" class="detailBtn">자세히보러가기</button>
							</div>	
					    	  <div class="row g-0">
					    	    <div class="col-md cardInfo" >
					    	      <div class="card-body">
					    	        <div class="oneText">
					    		        <span class="card-text"><small class="text-muted">시작일~종료일</small></span><br>
					    		        <span class="card-text" style="font-size: 14pt;">2023-08-08 14:00 ~ 2023-08-10 16:00</span>
					    	        </div>
					    	      </div>
					    	    </div>
					    	  </div>
					    </div>
					    
					    <div class="card">
							<div class="card-header d-flex justify-content-between">
								펫시팅 <button type="button" class="detailBtn">자세히보러가기</button>
							</div>	
					    	  <div class="row g-0">
					    	    <div class="col-md cardInfo" >
					    	      <div class="card-body">
					    	        <div class="oneText">
					    		        <span class="card-text"><small class="text-muted">시작일~종료일</small></span><br>
					    		        <span class="card-text" style="font-size: 14pt;">2023-08-08 14:00 ~ 2023-08-10 16:00</span>
					    	        </div>
					    	      </div>
					    	    </div>
					    	  </div>
					    </div>
					    
					</div><!-- 펫시터 예약내역 끝 -->
				</div><!-- 2행 2열 끝 -->
			</div><!-- 2행 끝 -->
</body>
</html>




