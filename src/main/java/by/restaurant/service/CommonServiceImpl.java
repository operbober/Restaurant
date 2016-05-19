package by.restaurant.service;

import by.restaurant.entity.CommonEntity;
import by.restaurant.repository.CommonRepository;
import org.springframework.beans.factory.annotation.Autowired;

import javax.persistence.MappedSuperclass;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by operb_000 on 06.05.2016.
 */
public abstract class CommonServiceImpl<E extends CommonEntity, R extends CommonRepository<E>> implements CommonService<E> {
    @Autowired
    protected R repository;

    @Override
    public E get(Long id) {
        return repository.findOne(id);
    }

    @Override
    public List<E> getAll() {
        List<E> entities = new ArrayList<>();
        repository.findAll().forEach(entities::add);
        return entities;
    }

    @Override
    public void delete(Long id) {
        repository.delete(id);
    }

    @Override
    public void save(E entity) {
        repository.save(entity);
    }
}
