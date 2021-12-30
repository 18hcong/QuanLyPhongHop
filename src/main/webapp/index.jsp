<%--
  Created by IntelliJ IDEA.
  User: conghoang
  Date: 12/10/2021
  Time: 1:09 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Login Form</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="stylesheet" href="CSS/style.css">

  <!-- <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta2/css/all.min.css"
      integrity="sha512-YWzhKL2whUzgiheMoBFwW8CKV4qpHQAEuvilg9FAn5VJUDwKZZxkJNuGM4XkWuk94WCrrwslk8yWNGmY1EduTA=="
      crossorigin="anonymous" referrerpolicy="no-referrer" /> -->

  <script src="https://kit.fontawesome.com/a81368914c.js"></script>

  <!-- <link rel="preconnect" href="https://fonts.googleapis.com"> -->

  <!-- <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin> -->

  <!-- <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@600&display=swap" rel="stylesheet"> -->
<style>
    ::placeholder { /* Chrome, Firefox, Opera, Safari 10.1+ */
        color: #d9d9d9;
        opacity: 1; /* Firefox */
    }
</style>


</head>
<body>
<img class="wave" src="images/11-113429_waves-png-hd-transpa-images-pluspng-wave-png.png" alt="bg">

<!-- CONTAINER -->
<div class="container">
  <div class="img">
    <img src="images/undraw_web_development_0l6v.svg" alt="background">
  </div>
  <div class="login-container">
    <form action="${pageContext.request.contextPath}/main?action=login" method="post">
      <img class="avatar" src="images/undraw_profile_pic_ic-5-t.svg" alt="avatar">
      <h2>Login Here</h2>

      <!-- USERNAME -->
      <div class="input-div one">
        <div class="i">
          <i class="fa fa-user"></i>
        </div>
        <div>
          <label>
            <input class="input"  placeholder="Enter Username" type="text" name="username">
          </label>
        </div>
      </div>
      <!-- PASSWORD  -->
      <div class="input-div two">
        <div class="i">
          <i class="fa fa-lock"></i>
        </div>
        <div>
<%--          <h5>Password</h5>--%>
          <label for="myInput"></label>
<%--          <input placeholder="Enter your Password" class="input" type="password" id="myInput" name="password">--%>
          <input placeholder="Enter your Password" type="password" class="input" id="myInput">
          <span class="eye" onclick="myFunction()">
                            <i id="hide1" class="fas fa-eye"></i>
                            <i id="hide2" class="fas fa-eye-slash"></i>
          </span>
        </div>
      </div>
      <div class="input-remember">
        <label>
          <input type="checkbox">
        </label>
        Remember me
      </div>
      <input type="submit" class="btn" value="Login">
    </form>
  </div>
</div>
<!-- ADD JS -->
<script src="js/main.js"></script>


<script>




  function myFunction() {
    const x = document.getElementById("myInput");
    const y = document.getElementById("hide1");
    const z = document.getElementById("hide2")

    if(x.type === 'password'){
      x.type = "text";
      y.style.display = "block";
      z.style.display = "none";
    }
    else{
      x.type = "password";
      y.style.display = "none";
      z.style.display = "block";
    }
  }
</script>
</body>
</html>