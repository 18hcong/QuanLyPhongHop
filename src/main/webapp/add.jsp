<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 29/12/2021
  Time: 3:04 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ADD_room</title>
    <link rel="stylesheet" href="edit.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="fa/css/all.css">
    <link rel="stylesheet" href="table.css">
</head>

<body>
<div class="main">
    <div class="container phanmot">
        <div class="row">
            <div class="col-md-8 ndtrai">
                <div class="dropdown">
                    <button class="dropbtn">Meeting Room Management</button>
                    <div class="dropdown-content">
                        <a href="file:///C:/Users/PC/OneDrive/M%C3%A1y%20t%C3%ADnh/Quan-ly-phong-hop-main/Quan-ly-phong-hop-main/QuanLyPhongHop/form-login/search_the_room.html">Search The Room</a>
                        <a href="#">View Room List</a>
                        <a href="file:///C:/Users/PC/OneDrive/M%C3%A1y%20t%C3%ADnh/Quan-ly-phong-hop-main/Quan-ly-phong-hop-main/QuanLyPhongHop/form-login/add_room.html">Add Room</a>
                        <a href="file:///C:/Users/PC/OneDrive/M%C3%A1y%20t%C3%ADnh/Quan-ly-phong-hop-main/Quan-ly-phong-hop-main/QuanLyPhongHop/form-login/edit.html">Edit Room</a>
                    </div>
                </div>
                <button class="dropbtn">View FeedBack</button>
            </div>
            <div class="col-md-4 ndphai">
                <div class="dropdown">
                    <button class="dropbtnuser">Admin</button>
                    <div class="dropdown-content anh">
                        <a href="#">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="div tren">
            <div class="form-style-2">
                <div class="form-style-2-heading">ADD ROOM</div>
                <div class="div formduoi">
                    <label><span>Room Name</span><input type="text" class="input-field" name="name"/></label>
                    <label><span>Floor</span><input type="number" class="input-field" name="floor"/></label>
                    <label><span>Area</span><input type="number" class="input-field" name="area"/></label>
                    <label><span>Status</span><input type="number" class="input-field" name="status"/></label>
                    <label ><span>Room Type</span><select name="roomType" class="select-field">
                        <c:forEach var="roomType" items="${roomType}">
                            <option value="General Question">6.2.A</option>
                        </c:forEach>

                    </select></label>
                    <label><span>Roomtype</span><input type="number" class="input-field" name="status"/></label>
                    <div class="frame cancelOK">
                        <button class="custom-btn btn-7"><span>Cancel</span> </button>
                        <button class="custom-btn btn-7 ok"><span>OK</span></button>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>

</body>
</html>
