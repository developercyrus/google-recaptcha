<html>
    <head>
	    <script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit" async></script>
		<script>
		    var onloadCallback = function() {
		        grecaptcha.render("recaptcha_box", {
		            "sitekey": "6LfJciUUAAAAAEuTC3QUbhm1jn35v6V8ouiX7Cao",
		            "callback": callback
		        });
		    };
		
		    function callback() {
		        alert("You've passed google recaptcha!");
		    }
		</script>

    </head>
    <body>
         <div id="recaptcha_box"></div>
    </body>
</html>