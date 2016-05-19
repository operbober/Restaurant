package by.restaurant.service;

import java.util.List;

/**
 * Created by operb_000 on 06.05.2016.
 */
public interface CommonService<E> {
    E get(Long id);
    List<E> getAll();
    void delete(Long id);
    void save(E entity);
}
