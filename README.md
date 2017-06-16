1. for local development, ensure to add "localhost" in the reCaptcha admin console, https://www.google.com/recaptcha/admin
2. Google reCaptcha also allows private ip address, e.g. 192.168.1.107, to use it

### run jetty
```
gradle --stacktrace clean build appRun 
```
### client browser
```
http://localhost:8001 
```

