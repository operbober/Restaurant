package by.restaurant.controller;

import by.restaurant.entity.CommonEntity;
import by.restaurant.service.CommonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.persistence.MappedSuperclass;
import java.util.List;

/**
 * Created by operb_000 on 06.05.2016.
 */
public abstract class CommonController<E extends CommonEntity, S extends CommonService<E>> {

    @Autowired
    protected S service;

    @RequestMapping(method = RequestMethod.GET)
    protected List<E> get() {
        return service.getAll();
    }

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    protected E getById(@PathVariable("id") Long id) {
        return service.get(id);
    }
}
