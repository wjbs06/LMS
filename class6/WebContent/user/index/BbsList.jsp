<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.util.List" %>
<%@ page import="com.user.model.DTO.memDTO" %>
<!DOCTYPE html PUBLIC
 "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Nanum+Gothic" rel="stylesheet">
		<style type="text/css">
								
				*{
					font-family: 'Nanum Gothic', sans-serif;
				}
				
				table,th,td{
					border: 1px solid gray;
				}
				
				table {
					width : 80%;
					margin: 10px auto 50px auto;
					border-collapse: collapse;
					/* border: 1px soid gray; */
				}
				
				th{
					background-color: #cccccc;
				}
				
				tr:hover{
					background-color: #e7eae5;
				}
		
				td {
					text-align: center;
				}
			
				td>a{
					display: block;
					color:gray;
					text-decoration: none;
				}
			.btn {
			    border: none;
			    color: white;
			    padding: 14px 28px;
			    font-size: 16px;
			    cursor: pointer;
			}
		
			.btn {background-color: #2196F3;} /* Blue */
			.btn:hover {background: #0b7dda;}
			
			.search{
				   width: 321px;
				   margin: 20px auto;
			}
		</style>
		<jsp:include page="${realpath }/layout/Header.jsp" />
		<script type="text/javascript">
			
			//검색창
		    function searchCheck(frm){
		        //검색
		        if($('input[name="keyWord"]').val() ==""){
		            alert("검색 단어를 입력하세요.");
		            $('input[name="keyWord"]').focus();
		            return;
		        }
		        frm.submit();      
		    }
			
			//검색 뒤로가기
		    function back(frm){
		    	location.href='BbsList.com';
				
			}
		
		</script>	
				<div class="main" style="overflow: auto">
					<!-- main list -->
					<h2>공지사항 리스트 페이지</h2>
					<div class="search">
			            <form name="serach">
			            <select name="keyField">
			                <option value="bbsNo">글번호</option>
			                <option value="bbsName">글제목</option>
			                <option value="bbsW">글쓴이</option>  
			            </select>
			            <input type="text" name="keyWord" />
			            <input type="button" value="검색" onclick="searchCheck(form)" style="background-color:#2196F3; border: none; color: white; padding: 8px; cursor: pointer;" />
			            <input type="button" value="뒤로" onclick="back(form)" style="background-color:#2196F3; border: none; color: white; padding: 8px; cursor: pointer;" />
			            </form>
				    </div>
						<table>
							<tr>
								<th style="width: 10%;">No.</th>
								<th style="width: 50%;">제목</th>
								<th style="width: 15%;">이름</th>
								<th style="width: 15%;">작성일시</th>
								<th style="width: 10%;">조회수</th>
							</tr>
							<c:forEach items="${List }" var="list">
							<tr>
								<td><a href="../user/BbsDetail.com?idx=${list.bbsNo }">
								${list.bbsNo }</a></td>							
								<td><a href="../user/BbsDetail.com?idx=${list.bbsNo }">${list.bbsName}</a></td>
								<td><a href="../user/BbsDetail.com?idx=${list.bbsNo }">${list.bbsW}</a></td>
								<td><a href="../user/BbsDetail.com?idx=${list.bbsNo }">${list.bbsDate }</a></td>
								<td><a href="../user/BbsDetail.com?idx=${list.bbsNo }">${list.bbsView }</a></td>
							</tr>
							</c:forEach>
							</table>					
							<div align="center">
								<a href="../user/BbsAdd.com"><button class="btn">공지 사항 입력</button></a> 				
							</div>
							<br>
				</div>
				<jsp:include page="${realpath }/layout/Footer.jsp" />
	</body>
</html>