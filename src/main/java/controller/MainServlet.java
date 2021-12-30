package controller;

import model.Account;
import model.MeetRoom;
import model.RoomType;
import service.MainService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "MainServlet", value = "/main")
public class MainServlet extends HttpServlet {
    MainService mainService = new MainService();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null)
            action = "";
        switch (action)
        {
            case "logout": logoutUser(request, response); break;
            case "delete": deleteUser(request,response); break;
            case "edit": showEditRoom(request,response); break;
            default: showIndex(request,response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String action = request.getParameter("action");
    if (action == null)
        action = "";
        switch (action)
        {
            case "login":  checkLogin(request, response); break;
            case "add": addRoom(request,response); break;
            case "edit": editRoom(request,response); break;
        }
    }
    private void showIndex(HttpServletRequest request,HttpServletResponse response) throws IOException, ServletException {
        if(request.getSession().getAttribute("account")!=null){
            List<MeetRoom> meetRooms = this.mainService.getAllMeetRoom();
            List<RoomType> roomTypes = this.mainService.getAllRoomType();
            request.setAttribute("rooms",meetRooms);
            request.setAttribute("roomType",roomTypes);
            request.getRequestDispatcher("admin.jsp").forward(request,response);
        }else{
            response.sendRedirect("index.jsp");
        }
    }
    private void checkLogin(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        Account account = new Account(username,password);
        if(this.mainService.checkLogin(account)){
            session.setAttribute("account",account);
            List<MeetRoom> meetRooms = this.mainService.getAllMeetRoom();
            List<RoomType> roomTypes = this.mainService.getAllRoomType();
            request.setAttribute("rooms",meetRooms);
            request.setAttribute("roomType",roomTypes);
            request.getRequestDispatcher("admin.jsp").forward(request,response);
        }else{
            response.sendRedirect("index.jsp");
        }
    }
    private void logoutUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        HttpSession session = request.getSession();
        session.invalidate();
        response.sendRedirect("index.jsp");
    }
    private void deleteUser(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        this.mainService.deleteRoom(id);
        List<MeetRoom> meetRooms = this.mainService.getAllMeetRoom();
        List<RoomType> roomTypes = this.mainService.getAllRoomType();
        request.setAttribute("rooms",meetRooms);
        request.setAttribute("roomType",roomTypes);
        request.getRequestDispatcher("admin.jsp").forward(request,response);
    }
    private void addRoom(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("inputName");
        int floor = Integer.parseInt(request.getParameter("inputFloor"));
        int capacity = Integer.parseInt(request.getParameter("inputCapacity"));
        int status = Integer.parseInt(request.getParameter("inputStatus"));
        int type_room = Integer.parseInt(request.getParameter("type_room"));
        int inputArea = Integer.parseInt(request.getParameter("inputArea"));
        MeetRoom room = new MeetRoom();
        room.setRoomName(name);
        room.setFloor(floor);
        room.setCapacity(capacity);
        room.setRoomType(this.mainService.getRoomType(type_room));
        room.setArea(inputArea);
        room.setStatus(status);
        this.mainService.addRoom(room);
        List<MeetRoom> meetRooms = this.mainService.getAllMeetRoom();
        List<RoomType> roomTypes = this.mainService.getAllRoomType();
        request.setAttribute("rooms",meetRooms);
        request.setAttribute("roomType",roomTypes);
        try {
            request.getRequestDispatcher("admin.jsp").forward(request,response);
        } catch (ServletException e) {
            e.printStackTrace();
        }
    }
    private void showEditRoom(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("id"));
        MeetRoom meetRoom = this.mainService.getRoom(id);
        request.setAttribute("room", meetRoom );
        List<RoomType> roomTypes = this.mainService.getAllRoomType();
        request.setAttribute("roomType",roomTypes);
        request.getRequestDispatcher("edit.jsp").forward(request,response);
    }
    private void editRoom(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        int id = Integer.parseInt(request.getParameter("inputID"));
        String name = request.getParameter("inputName");
        int floor = Integer.parseInt(request.getParameter("inputFloor"));
        int capacity = Integer.parseInt(request.getParameter("inputCapacity"));
        int status = Integer.parseInt(request.getParameter("inputStatus"));
        int type_room = Integer.parseInt(request.getParameter("type_room"));
        double inputArea = Double.parseDouble(request.getParameter("inputArea"));
        MeetRoom room = new MeetRoom();
        room.setRoomName(name);
        room.setId(id);
        room.setFloor(floor);
        room.setCapacity(capacity);
        room.setRoomType(this.mainService.getRoomType(type_room));
        room.setArea(inputArea);
        room.setStatus(status);
        this.mainService.editRoom(room);
        List<MeetRoom> meetRooms = this.mainService.getAllMeetRoom();
        List<RoomType> roomTypes = this.mainService.getAllRoomType();
        request.setAttribute("rooms",meetRooms);
        request.setAttribute("roomType",roomTypes);
        request.getRequestDispatcher("admin.jsp").forward(request,response);
    }
}
