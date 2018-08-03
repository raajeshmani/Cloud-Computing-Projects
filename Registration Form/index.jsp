<%-- 
    Document   : index
    Created on : Jun 28, 2018, 4:29:47 PM
    Author     : Ryuuk_Shinigami
--%>

<%@page import = "java.util.Random" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Form</title>
    </head>
    <body>
        <form action="/Registration-form/Captcha" method="post">
            <div class="container">
              <h1>Registration form</h1>
              <p>Please fill in this form to create an account.</p>
              <hr>
              <label for="uid"><b>User id :</b></label>
              <input type="text" placeholder="Choose a User ID" name="uid" required><br><br>
              
              <label for="psw"><b>Password:</b></label>
              <input type="password" placeholder="Enter Password" name="psw" required><br><br>
              
              <label for="name"><b>Name :</b></label>
              <input type="text" placeholder="Enter your Name" name="name" required><br><br>
              
              <label for="address"><b>Address :</b></label>
              <input type="text" placeholder="Permanent Address" name="address" required><br><br>
              
              <label for="country"><b>Country :</b></label>
              <select name="country">
                  <option value="">Select a valid option </option>
                  <option value="India">India</option>
                  <option value="United_States">United States</option>
                  <option value="France">France</option>
              </select><br><br>
              
              <label for="email"><b>Email :</b></label>
              <input type="text" placeholder="Enter Email" name="email" required><br><br>
              
              <label for="zipcode"><b>Zip code :</b></label>
              <input type="number" placeholder="Enter Zipcode" name="Zipcode" required><br><br>
              
              <label for="Sex"><b>Sex :</b></label>
              <input type="radio" name="Sex" value="Male" required>Male <input type="radio" name="Sex" value="female" required>Female<br><br>
              
              <label for="Language"><b>Language :</b></label>
              <input type="checkbox" name="language" value="English">English <input type="checkbox" name="language" value="French">French<br><br>
              
              <label for="about"><b>About :</b></label>
              <input type="text" placeholder="Impress me, Y should u be registered ?" name="about" style="height: 100px; width: 300px"><br><br>
              
              <label for="captcha"><b>Captcha :</b></label>
              <input type="number"  name="captcha" placeholder="Ur IQ is 0^-1" required><br><br>
              
                  <%-- start web service invocation --%>
    <%
    try {
	registration.com.webservice.Calculator service = new registration.com.webservice.Calculator();
	registration.com.webservice.CalculatorSoap port = service.getCalculatorSoap();
	 // TODO initialize WS operation arguments here
	Random rand = new Random();
        int A = rand.nextInt(100);
	int B = rand.nextInt(100);
        int C = rand.nextInt(4);
        int result=0;   
                
        switch(C){
            case 0:{
                result = port.add(A,B);
                out.println(A+" + "+B+" = ");
                break;
            }
            case 1:{
                result = port.subtract(A,B);
                out.println(A+" - "+B+" = ");
                break;
            }
            case 2:{
                result = port.multiply(A,B);
                out.println(A+" * "+B+" = ");
                break;
            }
            case 3:{    
                result = port.divide(A,B);
                out.println(A+" / "+B+" = ");
                break;
            }
        }
	// TODO process result here
	out.println("<input type=\"number\" name=\"captcha_ans\" value=\""+result+"\" hidden>");
        
    } catch (Exception ex) {
	// TODO handle custom exceptions here
    }
    %>
    <%-- end web service invocation --%>
              
              <hr>
              
              <p>By creating an account you agree to our <a href="#">Terms & Privacy</a>.</p>
              <button type="submit" class="registerbtn">Register</button>
            </div>
            <div class="container signin">
              <p>Already have an account? <a href="#">Sign in</a>.</p>
            </div>
</form>
    </body>
</html>
