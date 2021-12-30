package repository;

import model.Account;
import model.MeetRoom;
import model.RoomType;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MainRepository {
    BaseRepository baseRepository = new BaseRepository();
    public boolean checkLogin(Account account){
        Connection connection = baseRepository.getConnection();
        PreparedStatement preparedStatement;
        try {
            preparedStatement = connection.prepareStatement("select * from `account` where user_name=?");
            preparedStatement.setString(1,account.getUsername());
            ResultSet resultSet = preparedStatement.executeQuery();
            while(resultSet.next()) {
                String username = resultSet.getString("user_name");
                String password = resultSet.getString("password");
                if(account.getUsername().equals(username)&&account.getUsername().equals(password)){
                    return true;}
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public RoomType getRoomType(int id){
        RoomType roomType = new RoomType();
        String sql = "select * from room_type where id=?";
        PreparedStatement preparedStatement;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                roomType.setId(resultSet.getInt("id"));
                roomType.setName(resultSet.getString("type_name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return roomType;
    }

    public List<MeetRoom> getAllMeetRoom(){
        List<MeetRoom> meetRooms = new ArrayList<>();
        try {
            Connection connection = baseRepository.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select * from room " + "inner join room_type on room.id_type=room_type.id ");
            MeetRoom meetRoom;
            while (resultset.next()) {
                meetRoom = new MeetRoom();
                meetRoom.setId(resultset.getInt("id"));
                meetRoom.setRoomName(resultset.getString("room_name"));
                meetRoom.setFloor(resultset.getInt("floor"));
                meetRoom.setArea(resultset.getDouble("area"));
                meetRoom.setStatus(resultset.getInt("status"));
                meetRoom.setCapacity(resultset.getInt("capacity"));
                meetRoom.setRoomType(getRoomType(resultset.getInt("id_type")));
                meetRooms.add(meetRoom);
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return meetRooms;
    }
    public boolean deleteRoom(int id){
        String sql = "DELETE FROM room WHERE id=?";
        PreparedStatement preparedStatement = null;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            int row = preparedStatement.executeUpdate();
            if (row > 0)
                return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
    public List<RoomType> getAllRoomType(){
        List<RoomType> roomTypes = new ArrayList<>();
        try {
            Connection connection = baseRepository.getConnection();
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select * from room_type");
            RoomType roomType;
            while (resultset.next()) {
                roomType = new RoomType();
               roomType.setId(resultset.getInt("id"));
               roomType.setName(resultset.getString("type_name"));
                roomTypes.add(roomType);
            }
        } catch (SQLException throwable) {
            throwable.printStackTrace();
        }
        return roomTypes;
    }
    public boolean addRoom(MeetRoom meetRoom) {
        Connection connection = baseRepository.getConnection();
        try {
            String sql = "Insert into room(room_name,floor,area,status,capacity,id_type) value(?,?,?,?,?,?)";
            PreparedStatement pstm = connection.prepareStatement(sql);
            pstm.setString(1,meetRoom.getRoomName());
            pstm.setInt(2,meetRoom.getFloor());
            pstm.setDouble(3,meetRoom.getArea());
            pstm.setInt(4,meetRoom.getStatus());
            pstm.setInt(5,meetRoom.getCapacity());
            pstm.setInt(6,meetRoom.getRoomType().getId());
            int row = pstm.executeUpdate();
            if (row > 0)
                return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public MeetRoom getRoom(int id){
        MeetRoom meetRoom = new MeetRoom();
        String sql = "select * from room inner join room_type on room.id_type=room_type.id where room.id=?";

        PreparedStatement preparedStatement;
        Connection connection = baseRepository.getConnection();
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet resultset = preparedStatement.executeQuery();
            while (resultset.next()) {
                meetRoom.setId(resultset.getInt("id"));
                meetRoom.setRoomName(resultset.getString("room_name"));
                meetRoom.setFloor(resultset.getInt("floor"));
                meetRoom.setArea(resultset.getDouble("area"));
                meetRoom.setStatus(resultset.getInt("status"));
                meetRoom.setCapacity(resultset.getInt("capacity"));
                meetRoom.setRoomType(getRoomType(resultset.getInt("id_type")));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return meetRoom;
    }
    public boolean editRoom(MeetRoom meetRoom) {
        String sqlCustomer = "update room set room_name= ?, floor=?, area=?,status =?,capacity=?,id_type=? where id = ?";
        PreparedStatement preparedStatement = null;
        Connection connection = baseRepository.getConnection();
        int row = 0;
        try {
            preparedStatement = connection.prepareStatement(sqlCustomer);
            preparedStatement.setString(1,meetRoom.getRoomName()) ;
            preparedStatement.setInt(2,meetRoom.getFloor());
            preparedStatement.setInt(4,meetRoom.getStatus());
            preparedStatement.setInt(5,meetRoom.getCapacity());
            preparedStatement.setInt(7,meetRoom.getId());
            preparedStatement.setInt(6,meetRoom.getRoomType().getId());
            preparedStatement.setDouble(3,meetRoom.getArea());
            row += preparedStatement.executeUpdate();
            if (row > 1)
                return true;
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return false;
    }
}
