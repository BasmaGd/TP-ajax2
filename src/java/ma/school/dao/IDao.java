/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ma.school.dao;

import java.util.List;

/**
 *
 * @author leblond
 */
public interface IDao <T> {
    void create(T o);
    void update(T o);
    void delete(T o);
    List<T> findAll();
    T findById(int id);
}
