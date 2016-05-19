package by.restaurant.service;

import by.restaurant.entity.NamedEntity;
import by.restaurant.repository.NamedRepository;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Created by operb_000 on 06.05.2016.
 */
public abstract class NamedServiceImpl<E extends NamedEntity, R extends NamedRepository<E>> extends CommonServiceImpl<E, R> implements NamedService<E> {
    @Autowired
    protected R repository;

    @Override
    public E getByName(String name) {
        return repository.findByName(name);
    }
}
