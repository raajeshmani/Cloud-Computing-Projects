<%--
Document   : request-registration
Created on : Aug 31, 2018, 3:56:36 PM
Author     : ryuuk
--%>

  <%@page contentType="text/html" pageEncoding="UTF-8"%>
    <!DOCTYPE html>
    <html>

    <head>
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <title>Request form</title>
    </head>

    <body>
      <form action="/Cloud/form" method="post">
        <div class="container">
          <h1>Registration</h1>
          <hr>
          

          <label for="sports">
            <b>Name :</b>
          </label>
          <input type="text" placeholder="Enter your sports" name="sports" required>
          <br>
          <br>

          <label for="total">
            <b>total :</b>
          </label>
          <input type="number" placeholder="Enter phoneno" name="toal" required>
          <br>
          <br>

          


          <p>By creating an account you agree to our
            <a href="#">Terms & Privacy</a>.</p>
          <button type="submit" >Register</button>
        </div>
      </form>

      <br>
      <a href="index.html">Home</a>

      <footer>
        <p> Copyright &copy; 2018, Kerala Flood relief tool by Raajesh</p>
      </footer>

    </body>

    </html>