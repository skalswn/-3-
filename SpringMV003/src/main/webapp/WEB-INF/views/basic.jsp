<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>      
<c:set var="cpath" value="${pageContext.request.contextPath}"/>      
<!DOCTYPE html>
<html lang="en">
<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">
  	$(document).ready(function(){
  		//alert("제이쿼리 시작");
  		loadlist();
  	});
  	function loadlist(){
  		$.ajax({
  			url: "${cpath}/boardList.Ajax",
  			type: "get",
  			dataType: "json",
  			success: listview,
  			error: function(){alert("error");}
  		});
  	}
  	function listview(data){
  		//alert(data);
  		var blist="<table class='table table-hover table-bordered'>";
  		blist+="<tr>"
  		blist+="<td>번호</td>";
  		blist+="<td>제목</td>";
  		blist+="<td>작성자</td>";
  		blist+="<td>작성일</td>";
  		blist+="<td>조회수</td>";
  		blist+="<td>수정</td>";
  		blist+="<td>삭제</td>";
  		blist+="</tr>";
  		$.each(data,function(index,obj){
  			blist+="<tr>";
  		  	blist+="<td>"+(index+1)+"</td>";
  		  	blist+="<td id = 't"+obj.idx+"'><a onclick='boardview("+obj.idx+")'>"+obj.title+"</td>";
  		  	blist+="<td id = 'w"+obj.idx+"'>"+obj.writer+"</td>";
  		  	blist+="<td>"+obj.indate+"</td>";
  		  	blist+="<td id = 'ct"+obj.idx+"'>"+obj.count+"</td>";
  			if("${mvo.memid}"==obj.id){
  	  			blist+="<td id='u"+obj.idx+"'>"
  	  			blist+="<button type='button' class='btn btn-success btn-sm change' onclick='goupdate("+obj.idx+")'>수정</button>";
  	  			blist+="</td>"
  	  			blist+="<td>"
  	  			blist+="<button type='button' class='btn btn-warning btn-sm delete' onclick='godelete("+obj.idx+")'>삭제</button>";
  	  			blist+="</td>"
  	  		}else{
  	  			blist+="<td id='u"+obj.idx+"'>"
  	  	  		blist+="<button disabled class='btn btn-success btn-sm change' onclick='goupdate("+obj.idx+")'>수정</button>";
  	  	  		blist+="</td>"
  	  	  		blist+="<td>"
  	  	  		blist+="<button disabled class='btn btn-warning btn-sm delete' onclick='godelete("+obj.idx+")'>삭제</button>";
  	  	  		blist+="</td>"
  	  		}
  		    blist+="</tr>";
  		 	blist+="<tr class="+obj.idx+" style='display:none'>";
  		 	blist+="<td>내용</td>";
  		 	blist+="<td colspan='6' id='c"+obj.idx+"'>";
  		 	if("${mvo.memid}"==obj.id){
  		 		blist+="<textarea rows'7' class='form-control'>"+obj.content+"</textarea>"
  		 		blist+="<button type='button' class='btn btn-success btn-sm change' onclick='gochange("+obj.idx+")'>수정하기</button> &nbsp;";
  		 		blist+="<button type='button' class='btn btn-warning btn-sm' onclick='goback("+obj.idx+")'>취소하기</button>&nbsp&nbsp;";
  	  			blist+="<button type='button' class='btn btn-danger btn-sm back' onclick='boardview("+obj.idx+")'>닫기</button>";
  		 	}else{
  		 		blist+="<textarea rows'7' class='form-control' readonly=readonly>"+obj.content+"</textarea>"
  		 		blist+="<button disabled type='button' class='btn btn-success btn-sm change' onclick='gochange("+obj.idx+")'>수정하기</button> &nbsp;";
  		 		blist+="<button disabled class='btn btn-warning btn-sm' onclick='goback("+obj.idx+")'>취소하기</button>&nbsp&nbsp;";
  	  			blist+="<button type='button' class='btn btn-danger btn-sm back' onclick='boardview("+obj.idx+")'>닫기</button>";
  		 	}
  		 	
  			/* "<button type='reset' class='btn btn-warning btn-sm'>취소하기</button>&nbsp&nbsp;"; */
  			/*foreach 문에서 리셋은 작동하지 않으니 버튼의 방식을 활용  */
  			blist+="</td>";
  			blist+="</tr>";
  		});
  		if(${!empty mvo}){
  			blist+="<tr>";
  	  		blist+="<td colspan='7'>";
  	  		blist+="<button class='btn btn-primary btn-sm' onClick='goform()'>글쓰기</button></td>";
  	  		blist+="</tr>";
  	  		}
  	  		blist+="</table>";
  	  		$(".blist").html(blist);
  	}
  	function goform(){
  		if($(".insertfrom").css("display")=="block"){
  			 //jQuery('.insertfrom').css("display", "none");
  			$(".insertfrom").slideUp(); 
  		}else{
  			//jQuery(".insertfrom").css("display","block");
  			$(".insertfrom").slideDown();
  		}
  	}
  	function goinsert(){
  		//var title=$("#title").val();
  		//var content=$("#content").val();
  		//var writer=$("#writer").val();
  		var fdata=$("#frm").serialize();
  		$.ajax({
  			url:"${cpath}/boardinsert.Ajax",
  			type:"post",
  			data:fdata,
  			success:loadlist,
  			error: function(){alert("에러_글쓰기");}
  		});
  		//$("#title").val("");
  		//$("#content").val("");
  		//$("#writer").val("");
  		$(".cancel").trigger("click")
  		$(".insertfrom").css("display","none");
  	}
  	function goback(idx){
  		$.ajax({
  			url:"${cpath}/boardback.Ajax",
  			type:"post",
  			data:{"idx":idx},
  			success:function(data){
  				var content=data.content;
  		  		var newcontent="<textarea rows'7' class='form-control'>"+content+"</textarea><button type='button' class='btn btn-success btn-sm change' onclick='gochange("+idx+")'>수정하기</button> &nbsp;<button type='button' class='btn btn-warning btn-sm' onclick='goback("+idx+")'>취소하기</button>&nbsp&nbsp;<button type='button' class='btn btn-danger btn-sm back' onclick='boardview("+idx+")'>닫기</button>";
  		  		$("#c"+idx).html(newcontent);
	  			},
  			error: function(){alert("에러_취소");}
  		});//$("#c"+idx).text(data.content)
  	}
  	function boardview(idx){
  		if($("."+idx).css("display")=="none"){
 			 //jQuery('.insertfrom').css("display", "none");
  			$("."+idx).css("display","table-row");
  			
 		}else{
 			//jQuery(".insertfrom").css("display","block");
 			$("."+idx).css("display","none");
 		}
  		if($("."+idx).css("display")!="none"){
  			$.ajax({
  	  			url:"${cpath}/boardcount.Ajax",
  	  			type:"get",
  	  			data:{"idx":idx},
  	  			dataType: "json",
  	  			success:function(data){
  	    			$("#ct"+idx).text(data.count);
  	  			},
  	  			error: function(){alert("에러 카운트");}
  	  		});
  		}
  		
  	}
  
  	function godelete(idx){
  	if (confirm("정말로 삭제하시겠습니까?")==true){
  		$.ajax({
  			url:"${cpath}/boarddelete.Ajax",
  			type: "get",
  			data: {"idx":idx},
  			success:loadlist, 
  			error: function(){alert("에러");}
  		});
  		alert("삭제 되었습니다.")
  	}else{
  		loadlist();
  	}
  	}
  	
  	function gochange(idx){
  		var content=$("#c"+idx).val();
  		$.ajax({
  			url:"${cpath}/boardreplace.Ajax",
  			type: "post",
  			data: {"idx":idx,"content":content},
  			success:loadlist, 
  			error: function(){alert("에러");}
  		});
  	}
  	function goupdate(idx){
  		var title=$("#t"+idx).text();
  		var newTitle="<input type='text' id='tt"+idx+"' class='from-control' value='"+title+"'>";
  		$("#t"+idx).html(newTitle);
  		var writer=$("#w"+idx).text();
  		var newWriter="<input type='text' id='ww"+idx+"' class='from-control' value='"+writer+"'>";
  		$("#w"+idx).html(newWriter);
  		var newUpdate="<button class='btn btn-success btn-sm' onclick='update("+idx+")'>수정_하기</button>";
  		$("#u"+idx).html(newUpdate);
  		};
  	function update(idx){
  		var title=$("#tt"+idx).val();
  		var writer=$("#ww"+idx).val();
  		$.ajax({
  			url:"${cpath}/boardupdate.Ajax",
  			type: "post",
  			data: {"idx":idx,"title":title,"writer":writer},
  			success:loadlist, 
  			error: function(){alert("에러");}
  		});
  		
  	}
  </script>
</head>
<body>
<div class="container">
  <h2>스프링 웹 MVC02(회원인증)</h2>
  <div class="panel panel-default">
    <div class="panel-heading">
    <c:if test="${empty mvo}">
    <form class="form-inline" action="${cpath}/login">
	<div class="form-group">
		<label for="memid">ID:</label> 
		<input type="text" class="form-control" id="memid" name="memid">
	</div>
	<div class="form-group">
		<label for="mempass">비밀번호:</label>
		<input type="password"	class="form-control" id="mempass" name="mempass">
	</div>
		<button type="submit" class="btn btn-default">로그인</button>
	</form>
    </c:if>
    <c:if test="${!empty mvo}">
    <div class="form-group">
        	<label>${mvo.memname}님의 방문을 환영합니다.</label>
        	<button class="btn btn-info btn-sm" onClick="location.href='${cpath}/logout.do'">로그아웃</button>
    </div>
    </c:if>
    </div>
    <!--1.게시판 목록  -->
    <div class="panel-body blist"></div>
    <!--2.게시판 글쓰기 -->
    <div class="panel-body insertfrom" style="display: none;">
   <form id="frm" class="form-horizontal" method="post">
  <!--2-1제목 -->
  <input type="text" style="display:none;"  name="id" id="id" value="${mvo.memid}"/>
  	<div class="form-group">
    <label class="control-label col-sm-2" for="title">제목:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="title" id="title" placeholder="제목을 입력하세요">
    </div>
  	</div>
  <!--2-2작성자  -->
  	<div class="form-group">
    <label class="control-label col-sm-2" for="writer">작성자:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" name="writer" id="writer" placeholder="작성자 이름" value="${mvo.memname}" readonly=readonly>
    </div>
  	</div>
  <!--2-3내용 -->
  <div class="form-group">
  <label class="control-label col-sm-2" for="content" >내용:</label>
  <div class="col-sm-10">
  <textarea class="form-control" rows="10" name="content" id="content" placeholder="내용을 입력하세요"></textarea>
	</div>
	</div>
	<!--2-4 제출하기  -->
 <div class="form-group">
   <div class="col-sm-offset-2 col-sm-10">
      <button type="button" class="btn btn-success btn-sm" onclick="goinsert()">글쓰기</button>
      <button type="reset" class="btn btn-warning btn-sm cancel">취소</button>
    </div>
	</div>
     </form>
     </div>
     <!--3. 게시판 보기  -->
    <!--  <div class="panel-body bview" style="display: none;"></div> -->	
     <!--4.  -->
    <div class="panel-footer">빅데이터 분석 서비스 개발자 과정(나민주)</div>

  </div>
</div>
</body>
</html>
