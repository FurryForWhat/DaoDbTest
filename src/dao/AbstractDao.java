package src.dao;

import java.util.List;

public interface AbstractDao<T> {
    void create(T entity);
    // T findById(int id);
    // void update(T entity);
    void delete(int id);
    // List<T> getAll();

    public String getInsertQuery();

}