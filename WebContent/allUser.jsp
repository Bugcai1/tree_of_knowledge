<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html class=" js flexbox flexboxlegacy canvas canvastext webgl no-touch geolocation postmessage no-websqldatabase indexeddb hashchange history draganddrop websockets rgba hsla multiplebgs backgroundsize borderimage borderradius boxshadow textshadow opacity cssanimations csscolumns cssgradients no-cssreflections csstransforms csstransforms3d csstransitions fontface generatedcontent video audio localstorage sessionstorage webworkers applicationcache svg inlinesvg smil svgclippaths" style="" lang="en"><head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<link rel="stylesheet" href="allUser_files/reset.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="allUser_files/stars.css"> <!-- CSS reset -->
	<link rel="stylesheet" href="allUser_files/style.css"> <!-- Resource style -->
	<script src="allUser_files/modernizr.js"></script> <!-- Modernizr -->
  	<title>queryAll</title>
	<style>
		body{ font-family: "microsoft yahei";overflow-y: scroll;}
	</style>
</head>
<body>
	<div id="stars1"></div>
	<div id="stars2"></div>
	<div id="stars3"></div>
	<ul id="itemList" class="cd-items cd-container">
		
	</ul> <!-- cd-items -->

	<div id="userIDView">
		
    	</div>
    
    
   
    
			
<script src="allUser_files/jquery-2.js"></script>
<script src="allUser_files/velocity.js"></script>
<script src="allUser_files/main.js"></script> <!-- Resource jQuery -->


<!------------------------------------------------------------------------------------------------>
<script type="text/javascript">//页面加载的时候加载全部人员的信息
    	window.onload=function(){
	    	var url="queryAllUsers";
	    	
	    	$.post(url,{"action":"queryAll"},function(data){
	    		var num=data.length;
	    		var text="";
			var viewText="";
			    
	    		for(var i=0;i<num;i++) {
					text=text+"<li class=\"cd-item\">"
						+"<img src=\""+"UserPicture/"+data[i].ID+".jpeg\" alt=\""+data[i].name+"\" style=\"height:250px;width:250px\">"
						+"<a href=\"#0\" id=\""+data[i].ID+"\" class=\"cd-trigger\" style=\"width:250px\">"+data[i].name+"</a>"
						+"</li>";
	
					viewText=viewText+"<div id=\""+data[i].ID+"View\" class=\"cd-quick-view\">"
						+"<div class=\"cd-slider-wrapper\">"
						+"<ul class=\"cd-slider\">"
						+"<li class=\"selected\"><img style=\"height:100%\" src=\""+"UserPicture/"+data[i].ID+".jpeg\" alt=\""+data[i].name+"\"></li>"
						+"</ul>"
						+"</div>"
						+"<div class=\"cd-item-info\">"
						+"<h2>"+data[i].name+"</h2>"
						+"<p>性别："+data[i].sex+"&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href=\"search.jsp?="+data[i].ID+"\">前往此人</a></p>"
						+"<p>工作："+data[i].work+"</p>"
						+"<p>手机："+data[i].phone+"</p>"
						+"<p><a href=\"#\" id=\"back\" onclick=\"back()\">返回上一层</a></p>"
						+"</div>"
						+"<a href=\"#0\" class=\"cd-close\">Close</a>"
						+"</div>";
	    		}
	    		$("#itemList").append(text);
	    		//alert(text);
	    		$("#userIDView").append(viewText);
	    		//alert(viewText);

	    		var jsElem = document.createElement('script');
	    		jsElem.src='allUser_files/main.js';
	    		document.getElementsByTagName('head')[0].appendChild(jsElem);
		},'json');
	};
	function back(){
			window.history.back(-1);
	}
</script>
<!------------------------------------------------------------------------------------------------>



</body></html>

