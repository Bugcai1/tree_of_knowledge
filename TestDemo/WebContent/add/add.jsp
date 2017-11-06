<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %> 
<html>
	<head>
		<meta charset="UTF-8">
		<title>添加关系</title>
		<script src="add/jquery-1.10.2.js"></script>
		<style>
			*{padding:0px;margin:0px}
			table,thead{width: 100%;}
			tr th{width:20%;height:30px;background-color: #23B7E5;font-size: 16px;padding: 2px 0px;color:#fff;}
			tr td{text-align: center;padding: 5px 0px;background-color: #fff;font-size: 14px;}
			tr td a{padding: 2px 5px;border:1px solid #ddd;cursor: pointer;}
			ul li{list-style-type: none;overflow: hidden;}
			.body{
			width: 100%;
			height: 100%;
			background: white;
		}
		#top{
			height: 400px;
			width: 100%;
			margin-top:15px;
			margin-bottom:15px;  
			background: yellow;
			overflow-y:scroll;
		}
		#teacher{
			height: 200px;
			width: 30%;
			margin-left:2.5%;
			float: left;
			border-bottom: 1px dashed red;
		}
		#brother{
			height: 200px;
			width: 30%;
			margin-left: 2.5%;	
			float: left;
			border-bottom: 1px dashed blue;
		}
		#student{
			height: 200px;
			width: 30%;
			margin-left: 2.5%;
			float: left;
			border-bottom: 1px dashed blue;
		}
		.hide{
			width: 150px;
			height: 60px;
			display: none;
		}
			
			#div_teacher ul li p{50%;text-align: right;flex: 1;}
			
			#div_student ul li p{50%;text-align: right;flex: 1;}
		
			#div_brother ul li p{50%;text-align: right;flex: 1;}
			#div2 ul{overflow: hidden;}
			#div2 ul li{float: left;width:150px;height:120px;border:1px solid #ddd;margin-right: 10px;}
			#div2 ul li img{width: 100%;height: 100%;}
			.div_panel{min-height: 200px;}
		</style>
	</head>
	<body>
		<div id="top">
			<div id="div2">
				<ul>
					
				</ul>
			</div>
		</div>
		<div id="teacher">
			<div id="div_teacher" ondrop="drop_teacher()" ondragover="allowDrop(event)">
				<div class="div_panel">
					<table border="0" cellspacing="0" cellpadding="0">
						<caption><h2>添加的教师</h2></caption>
						<thead>
							<tr>
								<th>姓名</th>
								<th>性别</th>
								<th>工作</th>
								<th>年龄</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="ul_panel"></tbody>
					</table>
				</div>
			</div>
		</div>
		<div id="brother">
			<div id="div_brother" ondrop="drop_brother()" ondragover="allowDrop(event)">
				<div class="div_panel">
					<table border="0" cellspacing="0" cellpadding="0">
						<caption><h2>添加的师兄弟</h2></caption>
						<thead>
							<tr>
								<th>姓名1</th>
								<th>性别</th>
								<th>工作</th>
								<th>年龄</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="u2_panel"></tbody>
					</table>
				</div>
			</div>
		</div>
		<div id="student">
			<div id="div_brother" ondrop="drop_student()" ondragover="allowDrop(event)">
				<div class="div_panel">
					<table border="0" cellspacing="0" cellpadding="0">
						<caption><h2>添加的学生</h2></caption>
						<thead>
							<tr>
								<th>姓名2</th>
								<th>性别</th>
								<th>工作</th>
								<th>年龄</th>
								<th>操作</th>
							</tr>
						</thead>
						<tbody id="u3_panel"></tbody>
					</table>
				</div>
			</div>
		</div>
		<div>
			<input type="button" name="btn" value="提交" onclick="addpeople()"/>
		</div>
	</body>
	<script type="text/javascript">
		function addpeople()
		{
			$.post("search",{i:15},function(data,status){
				alert(data);
				alert(data.name);
				//$("ul").append(data);
			});
		}
	</script>
	<script>
		var name="";
		var work="";
		var sex="";
		var age="";
		var data_brother=[];
		var data_student=[];
		var data_teacher=[];
		function allowDrop(e){
			e.preventDefault();
		}
		function drag(t){
			name=$(t).siblings("#inp_name").val();
			sex=$(t).siblings("#inp_sex").val();
			work=$(t).siblings("#inp_work").val();
			age=$(t).siblings("#inp_age").val();
		}
		function addJson(data,name,sex,work,age){
			for(var j=0;j<data.length;j++){
				if(data[j].name==name){
					return;
				}
			}
			data.push({
				name:name,
			 	sex:sex,
				work:work,
			 	age:age,
			});
		}

		function addHtml_teacher(){
			var text_html='';
			$("#ul_panel").html("");
			for(var i=0;i<data_teacher.length;i++){
				text_html+='<tr><td>'+data_teacher[i].name+'</td><td>'+data_teacher[i].sex+'</td>'+'<td>'+data_teacher[i].work+'</td>'+'<td>'+(data_teacher[i].age)+'</td>'+'<td><a onclick="reduce_teacher(\'\'+'+i+',this)">删除</a></td></tr>';
			}
			$("#ul_panel").append(text_html);
		}
		function addHtml_brother(){
			var text_html=''
			var totalMoney=0;
			$("#u2_panel").html("");
			for(var i=0;i<data_brother.length;i++){
				text_html+='<tr><td>'+data_brother[i].name+'</td><td>'+data_brother[i].sex+'</td>'+'<td>'+data_brother[i].work+'</td>'+'<td>'+(data_brother[i].age)+'</td>'+'<td><a onclick="reduce_brother(\'\'+'+i+',this)">删除</a></td></tr>';
			}
			$("#u2_panel").append(text_html);
		}
		function addHtml_student(){
			var text_html='';
			var totalMoney=0;
			$("#u3_panel").html("");
			for(var i=0;i<data_student.length;i++){
				text_html+='<tr><td>'+data_student[i].name+'</td><td>'+data_student[i].sex+'</td>'+'<td>'+data_student[i].work+'</td>'+'<td>'+(data_student[i].age)+'</td>'+'<td><a onclick="reduce_student(\'\'+'+i+',this)">删除</a></td></tr>';
			}
			$("#u3_panel").append(text_html);
		}
		function drop_teacher(){
			addJson(data_teacher,name,sex,work,age);
			addHtml_teacher();
		}
		function drop_student(){
			addJson(data_student,name,sex,work,age);
			addHtml_student();
		}
		function drop_brother(){
			addJson(data_brother,name,sex,work,age);
			addHtml_brother();
		}

		function reduce_teacher(a,t){
			data_teacher.splice(a,1);
			addHtml_teacher();
		}
		function reduce_student(a,t){
			data_student.splice(a,1);
			addHtml_student();
		}
		function reduce_brother(a,t){
			data_brother.splice(a,1);
			addHtml_brother();
		}
		
	</script>
</html>