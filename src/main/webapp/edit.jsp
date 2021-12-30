<%--
  Created by IntelliJ IDEA.
  User: conghoang
  Date: 12/29/2021
  Time: 10:16 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Room</title>
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
                        <a href="#">Search
                            The Room</a>
                        <a href="/main">View Room List</a>
                        <a href="/main">Add
                            Room</a>
                    </div>
                </div>
                <button class="dropbtn">View FeedBack</button>
            </div>
            <div class="col-md-4 ndphai">
                <div class="dropdown">
                    <button class="dropbtnuser">Admin</button>
                    <div class="dropdown-content anh">
                        <a href="${pageContext.request.contextPath}/main?action=logout">Logout</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="div tren">
            <div class="form-style-2">
                <form action="/main?action=edit"method="post">
                <div class="form-style-2-heading">EDIT ROOM</div>
                <div class="div formduoi">
                    <label> <span>ID </span><input type="text" class="input-field" name="inputID"
                                                         value="${room.getId()}" readonly/></label>
                    <label> <span>Room Name </span><input type="text" class="input-field" name="inputName"
                                                          value="${room.getRoomName()}"/></label>

                    <label> <span>Floor </span>
                    <input type="number" class="input-field" name="inputFloor" value="${room.getFloor()}"/></label>


                    <label><span>Room Type</span>
                        <select name="type_room" class="select-field">
                            <c:forEach var="type" items="${roomType}">
                                <option value="${type.getId()}">${type.getName()}</option>
                            </c:forEach>
                        </select></label>

                    <label><span>Area</span> <input type="number" class="input-field" name="inputArea" value="${room.getArea()}"/></label>

                    <label><span>Capacity</span></label>
                    <input type="number" class="input-field" name="inputCapacity" value="${room.getCapacity()}"/></label>
                    <label><span>Room Type</span>
                        <select name="inputStatus" class="select-field">
                                <option value="1">Còn trống</option>
                                <option value="2">Phòng đang được cho thuê</option>
                        </select></label>
                    <div class="frame cancelOK">
                        <button class="custom-btn btn-7" onclick="window.location.href='/main'"><span>Cancel</span></button>
                        <button type="submit" class="custom-btn btn-7 ok"><span>OK</span></button>
                    </div>
                </div>
                </form>
            </div>

        </div>
    </div>
</div>

</body>
</html>
