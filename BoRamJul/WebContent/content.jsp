<%@page import="com.DTO.ExBoardDTO"%>
<%@page import="com.DAO.ExboardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	// 제목을 클릭하였을 때 get방식으로 넘어오는 no, pageNum, sel, find를 변수에 할당
	int no = Integer.parseInt(request.getParameter("no"));
	String pageNum = request.getParameter("pageNum");
	String sel = request.getParameter("sel");
	String find = request.getParameter("find");
	
	
	ExboardDAO manager = ExboardDAO.getInstance();
	// 제목을 클릭했을 때 조회수 증가
	manager.readCount(no);
	// no에 해당하는 데이터베이스의 데이터를 board 객체에 할당
	ExBoardDTO board = manager.getBoard(no);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세부내용</title>
</head>
<body>
	<center>
		<h3>작성글</h3>
		<table border="1" width="600">
			<tr>
				<td width="50">이름</td>
				<td width="250"><%=board.getName() %></td>
				<td width="50">조회수</td>
				<td width="250"><%=board.getReadCount() %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td colspan="3"><%=board.getSubject() %></td>
			</tr>
			<tr>
				<td>내용</td>
				<td colspan="3"><pre><%=board.getContent() %></pre></td>
			</tr>
			<tr align="center">
				<td colspan="4">
					<%
						if(sel == null && find == null){ // 검색을 하지 않았을 때
					%>
					<%-- 버튼을 클릭하면 해당 페이지로 이동 / 수정과 삭제는 get방식으로 no값 및 pageNum을 전달 --%>
					<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%=pageNum%>'">
					<input type="button" value="수정" onclick="location.href='updateForm.jsp?no=<%=no%>&pageNum=<%=pageNum%>'"> 
					<input type="button" value="삭제" onclick="location.href='deleteForm.jsp?no=<%=no%>&pageNum=<%=pageNum%>'">
					<input type="button" value="답글" onclick="location.href='replyForm.jsp?no=<%=no%>&pageNum=<%=pageNum%>'">
					<%		
						}else{ // 검색 기능을 사용하였을 때
					%>
					<input type="button" value="글목록" onclick="location.href='list.jsp?pageNum=<%=pageNum%>&sel=<%=sel%>&find=<%=find%>'">
					<input type="button" value="수정" onclick="location.href='updateForm.jsp?no=<%=no%>&pageNum=<%=pageNum%>&sel=<%=sel%>&find=<%=find%>'"> 
					<input type="button" value="삭제" onclick="location.href='deleteForm.jsp?no=<%=no%>&pageNum=<%=pageNum%>&sel=<%=sel%>&find=<%=find%>'">
					<input type="button" value="답글" onclick="location.href='replyForm.jsp?no=<%=no%>&pageNum=<%=pageNum%>&sel=<%=sel%>&find=<%=find%>'">
					<%		
						}
					%>
				</td>
			</tr>
		</table>
	</center>
</body>
</html>