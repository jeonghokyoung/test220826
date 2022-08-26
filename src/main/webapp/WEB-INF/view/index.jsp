<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
header{text-align:center; height:250px;width:100%;border:1px solid black}
tinsert{}
main{display:flex;height:600px;width:100%;border:5px solid pink;}
aside{overflow: scroll;height:600px;width:20%;border:1px solid orange}
#content{text-align:center; height:600px;width:80%;}

footer{height:100px;width:100%;border:1px solid black}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
function getlist(){
	//$.ajax();->$.ajax({});->$.ajax({url,성공했을 때 함수 구현});
	$.ajax({
		url:"/list",
		success:function(result){$("#list").html(result);}
	});
}

function search(search){
	//$("#content").html(search);
	$.ajax({
		url:"/find?search="+search,
		success:function(result){$("#list").html(result);}
	});
	
}

function insert(){
	var name=document.getElementById("name").value
	var hp=document.getElementById("hp").value
	var memo=document.getElementById("memo").value
	//document.querySelector("#name");
	console.log(name);
	console.log(hp);
	console.log(memo);
	//전화번호부를 입력하면 DB입력이되고 리스트에 출력
	//(DB입력 후 결과는 리스트를 가지고오라)
	/*
	$.ajax({
		url:"/insert",
		type:"post", //입력하는것은 post방식으로 보낸다 defalt는 get이다.
		dataType:"text",
		data:{"name": nema,"hp":hp, "memo":memo}
		success:function(result){$("#list").html(result);}
	});
	*/
	
	$.ajax({
		url:"/insert?name="+name+"&hp="+hp+"&memo="+memo,
		success:function(result){$("#list").html(result);}
	});
	
	document.querySelector("#name").value="";
	document.querySelector("#hp").value="";
	document.querySelector("#memo").value="";
}

function getPhonebook(idx){
	console.log(idx);
	$.ajax({
		url:"/findOne?idx="+idx,
		success:function(result){$("#content").html(result);}
	});
}

 function deletelist(idx){

	$.ajax({
		url:"/delete?idx="+idx,
		success:function(result){$("#list").html(result);
		$("#content").html("삭제가 완료되었습니다");
		}
	});
	
 }
	/*
	 	function update(idx){
			var name=document.getElementById("name").value;
			var hp=document.getElementById("hp").value;
			var memo=document.getElementById("memo").value;
			
			$.ajax({
				url:"/update?name="+name+"&hp="+hp+"&memo="+memo,
				success:function(result){$("#content").html(result);}
		});
	*/

		  
</script>

</head>

<body onload="getlist()">

<header>
<nav><h1>전화번호부</h1></nav>
<div id="tinsert">
<h3>전화번호부입력</h3>
<form action="/insertProc" method="post">
<lable for="name">이름:</lable>
<input type="text" id="name" name="name">
<br>
<lable for="hp">전화번호:</lable>
<input type="text" id="hp" name="hp">
<br>
<lable for="memo">메모:</lable>
<input type="text" id="memo" name="memo">
<br>
<!-- <input type="submit" value="전화번호입력"> -->
</form>
<input type="button" value="전화번호입력" onclick="insert()">
</div>
</header>

<main>
<aside>
<div id="search">검색<input type="text" name="search" onkeyup="search(this.value)"></div>
<div id="list">전체리스트 or 검색리스트 결과</div>
</aside>
<div id="content">선택 결과</div>
</main>
<footer></footer>
</body>
</html>