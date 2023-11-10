<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<%
	String context = request.getContextPath();
%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	function getDeptName(pDeptno) {
		console.log(pDeptno);
		// 테스트용
		// alert("pDeptno : " + pDeptno);
		
		// 과제 : Ajax로 부서명을 보내고 부서명을 받음 -> data만 받아옴
		$.ajax(
				{
					url: "<%=context%>/getDeptName",
					data: {deptno : pDeptno},
					dataType: 'text',
					success:function(deptName){
						// alert("success ajax Data : " + deptName);
						$('#deptName').val(deptName);	/* input Tag */
						$('#msg').html(deptName);		/* span id Tag */
					}
				});
	}
	
	function getDept(pDeptno) {
		//alert("pDeptno : " + pDeptno);
		
		// Json으로 받아옴
		$.ajax(
				{
					url: "sample/sendVO2",
					data: {deptno : pDeptno},
					dataType: 'json',
					success:function(sampleVo){
						resultStr = sampleVo.firstName + " " + sampleVo.lastName + " " + sampleVo.mno; 
						alert("ajax getDept resultStr : " + resultStr);
						$('#RestDept').val(resultStr);	/* input Tag */
					}
				});
	}



</script>
</head>
<body>
<h2>회원 정보</h2>
<table>
	<tr><th>사번</th><th>이름</th><th>업무</th><th>부서</th><th>근무지</th></tr>
	<c:forEach var="emp" items="${listEmp}">
		<tr><td>${emp.empno }</td><td>${emp.ename }</td>
			<td>${emp.job }</td>
			<td>${emp.deptno} 
			    <input type="button" id="btn_idCheck" value="부서명" onmouseover="getDeptName(${emp.deptno })">
			</td>
			<td>${empDept.loc }</td>
		</tr>
	</c:forEach>
</table>

	deptName:  <input type="text" id="deptName"  readonly="readonly"><p>
    Message :  <span id="msg"></span><p>
    
    RestController sendVO2: <input type="text" id="RestDept"    readonly="readonly"><p>
	RestController sendVO2: sendVO2<input type="button" id="btn_Dept"  value="부서명"  
	                                      onclick="getDept(10)"><p>
    
	 
</body>
</html>