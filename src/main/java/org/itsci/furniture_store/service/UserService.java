package org.itsci.furniture_store.service;
import org.itsci.furniture_store.model.User;

import java.util.List;

public interface UserService {
    List<User> getUsers();
    void saveUser(User user);
    User getUser(Long id);
    void deleteUser(Long id);
    User findByUsername(String username);
}

