<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!doctype html>
<html>
<head>
<meta charset="UTF-8">
<title>用户主页</title>

<style>
*{margin:0;padding:0}
body{font-size:14px;font-family:"å¾®è½¯éé»";background:url("photo/2.jpg") top no-repeat;background-attachment:fixed;z-index:0;background-size:100%;}
.box{width:960px;height:2000px;margin:100px auto;position:relative;z-index:1;}

/*åå®¹åå¸åºå*/
.box .boxcenter{width:500px;height:200px;background:#fff;position:absolute;top:80px;left:180px;border:1px solid green;border-radius:6px;}
.box .boxcenter .boxc_t{height:30px;line-height:30px;}
.box .boxcenter .boxc_t h4{padding-left:20px;background:#3BBFB4;border-top-left-radius:6px;border-top-right-radius:6px;}
.box .boxcenter .boxc_c{width:460px;height:100px;border:1px solid #A6C8FF;margin:8px auto;text-indent:10px;box-shadow:0 0 4px #A6C8FF;}
.box .boxcenter .boxc_b{width:80px;height:30px;position:absolute;right:10px;bottom:8px;}
.box .boxcenter .boxc_b a{font-size:14px;color:#fff;line-height:30px;background:#3bbfb4;border-radius:6px;display:block;text-align:center;text-decoration:none;}
.box .boxcenter .boxc_b a:hover{background:#2C8E86;}
.box .timeline{width:60px;height:100%;position:absolute;top:100px;left:80px;border-right:2px solid #5d7895;}/**/
.timeline .timeline_t{width:50px;height:50px;border-radius:50%;border:1px solid #fff;background:url("") no-repeat;background-size:100%;}
.timeline .nextbox{width:380px;height:80px;position:absolute;top:260px;left:60px;}
.a{width:380px;height:80px;background:#fff;border-radius:6px;margin-top:30px;font-size:16px;line-height:20px;text-indent:20px;word-break:break-all;position:relative;left:6px;}
.a .b{width:6px;height:6px;border-radius:50%;border:2px solid #fff;background:#9DCFE1;position:absolute;top:35px;left:-10px;}
#time{font-size:20px;color:#ababab;}
#hour{font-size:12px;color:#92CADE;}
</style>

</head>
<body>

<div class="box">

	<!--åå®¹åå¸åºå-->
	<div class="boxcenter">
		<div class="boxc_t"><h4>个性名片</h4></div>

		<div class="boxc_c" contenteditable="false" id="aa"></div>

		<div class="boxc_b"><a id="aau" href="">返回上一层</a></div>
	</div>
	
	<!--æ¶åè½´çº¿-->
	<div class="timeline">
		<div id="user" class="timeline_t">				
		</div>
		<div class="nextbox"></div>
	</div>
	<div class="timeline">
		<div class="timeline_t">				
		</div>
		<div class="nextbox"></div>
	</div>
	
</div>

<script type="text/javascript" src="jquery.min.js"></script>
<script type="text/javascript">	
//èªå¨å è½½ä¹åå¾è®°å½
$(function(){
	 var thisURL = document.URL;  
     var  getval =thisURL.split('?')[1];  
     var showval= getval.split("=")[1];
     showval=parseInt(showval);
     ad="search.jsp?cc="+showval;
		$("#aau").attr('href',ad);
	$("#user").css("background-image","url("+"UserPicture/"+showval+".jpeg"+")");
	var url="search_log";
	$.post(url,{"user_id":showval},function(data,status){
	var datas=eval('('+data+')');

	$(".boxc_c").text("个性标签");
	for(var i=0;i<datas.length;i++)

	{
		$(".nextbox").prepend("<div class='a'>"+
			"<div class='b'></div>"+
			"<span id='time'>"+datas[i].time+"&nbsp;&nbsp;"+

			"</span>"+
			"<br>"+
			"<p style='padding:4px'>"+datas[i].result+"</p>"+
			"</div>");	
		}

	})
});
</script>

</body>
</html>