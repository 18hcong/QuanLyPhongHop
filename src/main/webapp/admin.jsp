<%@ page import="model.Account" %><%--
  Created by IntelliJ IDEA.
  User: conghoang
  Date: 12/10/2021
  Time: 1:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin</title>
    <link rel="stylesheet" href="1.css">
    <link rel="stylesheet" href="bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="fa/css/all.css">
    <link rel="stylesheet" href="table.css">
</head>

<body>
<div class="main">
    <img class="wave" src="images/Event_AdminTeamMtg.png" alt="bg">
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
                    <button class="dropbtnuser">Xin
                        chào <%=((Account) request.getSession().getAttribute("account")).getUsername()%>
                    </button>
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
                <div class="form-style-2-heading">LIST OF MEETINGS ROOM</div>

                <div class="div form">
                    <form action="/main?action=add" method="post">
                        <div class="nut">
                            <input value="ADD NEW ROOM" type="submit"/>
                            <div class="search">
                                <div>
                                    <label>
                                        <input type="text" placeholder="Search . . .">
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="formtren">
                            <label> <span>Room Name </span><input type="text" class="input-field" name="inputName"
                                                                  value=""/></label>
                            <label></label> <span>Floor </span><label>
                            <input type="number" class="input-field" name="inputFloor" value=""/></label>
                            <label></label> <span>Capacity </span><label>
                            <input type="number" class="input-field" name="inputCapacity" value=""/></label>
                        </div>
                        <div class="div formduoi">
                            <label>for<span>Status</span><select name="inputStatus" class="select-field">
                                <option value="1">Còn trống</option>
                                <option value="2">Phòng đang cho thuê</option>
                            </select></label>
                            <label><span>Room Type</span>
                                <select name="type_room" class="select-field">
                                    <c:forEach var="type" items="${roomType}">
                                        <option value="${type.getId()}">${type.getName()}</option>
                                    </c:forEach>
                                </select></label>
                            <label><span>Area</span> <input type="number" class="input-field" name="inputArea"/></label>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="div duoi">
            <h2>Responsive Table</h2>
            <div class="table-wrapper">
                <table class="fl-table">
                    <thead>
                    <tr>
                        <th>Number</th>
                        <th>Room Name</th>
                        <th>Floor</th>
                        <th>Area</th>
                        <th>Status</th>
                        <th>Room Type</th>
                        <th>Capacity</th>
                        <th>Fix</th>
                        <th>Delete</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%--<jsp:useBean id="rooms" scope="request" type="java.util.List"/>--%>
                    <c:forEach items="${rooms}" var="room">
                    <tr>
                        <td>${room.getId()}</td>
                        <td>${room.getRoomName()}</td>
                        <td>${room.getFloor()}</td>
                        <td>${room.getArea()}</td>
                        <c:if test="${room.getStatus()==1}">
                            <td>
                                Còn trống
                            </td>
                        </c:if>
                        <c:if test="${room.getStatus()==2}">
                            <td>
                                Phòng đang cho thuê
                            </td>
                        </c:if>
                        <td>${room.getRoomType().getName()}</td>
                        <td>${room.getCapacity()}</td>
                        <td class="social-btns">
                            <a class="btn twitter" href="/main?action=edit&id=${room.getId()}"><i class="fas fa-tools"></i></a>
                        </td>
                        <td class="social-btns">
                            <a class="btn twitter" href="/main?action=delete&id=${room.getId()}"><i
                                    class="fas fa-trash"></i></a>
                        </td>
                    </tr>
                    </c:forEach>
                    <tbody>
                </table>
            </div>
        </div>
    </div>
</div>
</body>

</html>
