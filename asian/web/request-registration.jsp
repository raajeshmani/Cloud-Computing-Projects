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
          <label for="district">
            <b>District :</b>
          </label>
          <select name="district">
            <option value="">Select a valid option </option>
            <option value="Palakkad">Palakkad</option>
            <option value="Coimbatore">Coimbatore</option>
            <option value="Kochi">Kochi</option>
            <option value="Chennai">Chennai</option>
            <option value="Puducherry">Puducherry</option>
          </select>
          <br>
          <br>

          <label for="location">
            <b>Location :</b>
          </label>
          <input type="text" placeholder="Current Location" name="location" required>
          <br>
          <br>

          <label for="name">
            <b>Name :</b>
          </label>
          <input type="text" placeholder="Enter your Name" name="name" required>
          <br>
          <br>

          <label for="phoneno">
            <b>Phone Number :</b>
          </label>
          <input type="number" placeholder="Enter phoneno" name="phoneno" required>
          <br>
          <br>

          <label for="requested">
            <b>Requested items :</b>
          </label>
          <br>
          <br>
          <input type="checkbox" name="requested" value="food">Food
          <br>
          <input type="checkbox" name="requested" value="water">water
          <br>
          <input type="checkbox" name="requested" value="clothing">clothing
          <br>
          <input type="checkbox" name="requested" value="medicine">medicine
          <br>
          <br>
          <label for="date">
            <b>Date :</b>
          </label>
          <input type="date" placeholder="Today's Date" name="date" required>
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