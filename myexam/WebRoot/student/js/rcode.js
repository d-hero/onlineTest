function createCode(){ 
     code = ""; 
     var codeLength = 4;//验证码的长度  
  /*  <!--  var checkCode2 = document.getElementById("code2");  -->*/
     var random = new Array(2,3,4,5,6,7,8,9,'a','b','c','d','e','f','g','h','i','j','k','m','n','p','q','r',  
     's','t','u','v','w','x','y','z');//随机数  

     	code = "";
     	for(var i = 0; i < codeLength; i++) {//循环操作  
        var index = Math.floor(Math.random()*32);//取得随机数的索引（0~33）  
        
        	 code+= random[index];//根据索引取得随机数加到code上  

    	}  
    	
    	
        document.getElementById("rcodeValue").value = code;//把code值赋给验证码  
}  ;
//产生验证码  
window.onload = createCode;

function rcreate(){
	createCode();//刷新验证码  
	document.getElementById("rcodeInput").value = "";//清空文本框  
}