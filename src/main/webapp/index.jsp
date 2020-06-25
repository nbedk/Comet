<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">  
<html xmlns="http://www.w3.org/1999/xhtml">  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />  
<title>Comet4J Hello World</title> 
<script type="text/javascript" src="js/libs/jquery/jquery.min.js"></script> 
<script type="text/javascript" src="js/libs/comet4j/comet4j.js"></script>
<script type="text/javascript">  
function init(){  
        var kbDom = document.getElementById('kb');   
        JS.Engine.on({  
                test : function(aa){//侦听一个channel  
                        kbDom.innerHTML = aa; 
                        console.log(aa);
                }  
        }); 
        JS.Engine.start('conn'); 
        JS.Engine.on(
            'test',function(cId,channelList,engine){
                  console.dir('连接已建立，连接ID为：' + cId);
            });
         
}  
function test(){
    var kbDom = document.getElementById('kb');  
 
    JS.Engine.start('conn'); 
    JS.Engine.on({  
            test : function(aa){//侦听一个channel  
                    kbDom.innerHTML = aa; 
                    console.log(aa);
            } 
    }); 
}
</script>  
</head>  
<body onload="init();">  
    <span id="kb">...</span> <br/>  
    <button onclick="test();">click</button>
</body>  
</html>  