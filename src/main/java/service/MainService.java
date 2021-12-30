package service;

import model.Account;
import model.MeetRoom;
import model.RoomType;
import repository.MainRepository;

import java.util.List;

public class MainService {
    MainRepository mainRepository = new MainRepository();
    public boolean checkLogin(Account account){
        return this.mainRepository.checkLogin(account);
    }
    public List<MeetRoom> getAllMeetRoom(){
        return this.mainRepository.getAllMeetRoom();
    }
    public boolean deleteRoom(int id){
        return this.mainRepository.deleteRoom(id);
    }
    public List<RoomType> getAllRoomType(){
        return  this.mainRepository.getAllRoomType();
    }
    public RoomType getRoomType(int id){
        return this.mainRepository.getRoomType(id);
    }
    public boolean addRoom(MeetRoom meetRoom) {
        return this.mainRepository.addRoom(meetRoom);
    }
    public MeetRoom getRoom(int id){
        return this.mainRepository.getRoom(id);
    }
    public boolean editRoom(MeetRoom meetRoom) {
        return this.mainRepository.editRoom(meetRoom);
    }
}
