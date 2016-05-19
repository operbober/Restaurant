package by.restaurant.service;

import by.restaurant.entity.NamedEntity;

/**
 * Created by operb_000 on 06.05.2016.
 */
public interface NamedService<E extends NamedEntity> extends CommonService<E> {
    E getByName(String name);
}
