<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 
${phonebook.name}<br>
${phonebook.hp}<br>
${phonebook.memo}<br>
<input type ="button" value="수정" onclick ="update(${phonebook.idx})"/>
<input type ="button" value="삭제" onclick="deletelist(${phonebook.idx})"/>

<h3>전화번호부 수정</h3>

<form action="/insertProc" method="post">


<input type="text" id="idx1" name="idx" value="${phonebook.idx}" hidden="hidden">

<lable for="name">이름:</lable>
<input type="text" id="name1" name="name" value="${phonebook.name}">
<br>
<lable for="hp">전화번호:</lable>
<input type="text" id="hp1" name="hp" value="${phonebook.hp}" >
<br>
<lable for="memo">메모:</lable>
<input type="text" id="memo1" name="memo"value="${phonebook.memo}" >
<br>
<!-- <input type="submit" value="전화번호입력"> -->
</form>
<input type="button" value="전화번호수정" onclick="update()">