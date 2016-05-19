package by.restaurant.controller.menu;

import by.restaurant.controller.CommonController;
import by.restaurant.entity.menu.Dish;
import by.restaurant.service.menu.DishService;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * Created by operb_000 on 16.05.2016.
 */
@RestController
@RequestMapping(value = "/dish")
public class DishController extends CommonController<Dish, DishService> {

    @RequestMapping(value = "/{dishTypeId}",method = RequestMethod.GET)
    protected List<Dish> get(@PathVariable("dishTypeId") Long dishTypeId) {
        return service.getByDishType(dishTypeId);
    }
}
