package crud.dao;

import crud.model.User;

import java.util.List;

/**
 * Created by Administrator on 08.06.2017.
 */
public interface UserDao {
    public void addUser(User user);
    public void updateUser(User user);
    public void removeUser(int id);
    public User getUserById(int id);
    public List<User> listUsers();
    List<User> searchUsers(String name);
}
