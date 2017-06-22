<!DOCTYPE html>
<html>
	<head>
		<meta charset="US-ASCII">
		<title>Login Page</title>
		<script src="https://www.google.com/recaptcha/api.js"></script>
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>

		<script>
	        function detect() {           
	        	if ($('#g-recaptcha-response').val() != '') {
	        	    var v = $('#g-recaptcha-response').val()
	        		console.log(v);
	        	    
	        	    
	        	    $("#form").submit(function(e) {
		                $.ajax({
		                    url: '/GoogleLoginServlet',
		                    type: 'POST',
		                    dataType: 'json',
		                    data: {
		                    	"g-recaptcha-response": v
		                    },
		                    success: function (data) {		                    	
		                        if (data.status === "success") {
		                            alert("success");
		                        } else if (data.status === "fail") {
		                            alert("fail");
		                        }
		                    }
		                });
		                
		                e.preventDefault();   //STOP default action
	        	    }); 
	        	    
	        	    $("#form").submit();
	        	}   
	        	else {	        		
	        		$("#notice").show();
	        	}
		           
	        }        
		    
		</script>	 
		<style>
	        .show {
	            display: block;
	        }
	        .hide {
	            display: none;
	        } 
        </style>      		       
	</head>
	
	<body>
	    <div>ip:<%=request.getRemoteAddr()%></div><br> 
		<!-- <form action="GoogleLoginServlet" method="post">  -->
		<div id="notice" class="hide"><font color="red">please complete the captcha</font></div><br> 
	    <form id="form">
			Username: <input type="text" name="username" value="john"> <br> 
			Password: <input type="password" name="password" value="12345678"> <br>
			<div class="g-recaptcha" data-sitekey="6LfJciUUAAAAAEuTC3QUbhm1jn35v6V8ouiX7Cao"></div><br> 			
		</form>
		<input type="submit" value="Login" onclick="detect()">
	</body>
</html>