package crud.service;

import crud.model.User;

import java.util.List;

/**
 * Created by Administrator on 10.06.2017.
 */
public interface UserService {
    public void addUser(User user);
    public void updateUser(User user);
    public void removeUser(int id);
    public User getUserById(int id);
    public List<User> listUsers();
    List<User> searchUsers(String name);
}
