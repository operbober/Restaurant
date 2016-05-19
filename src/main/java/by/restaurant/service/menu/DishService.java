package by.restaurant.service.menu;

import by.restaurant.entity.menu.Dish;
import by.restaurant.entity.menu.DishType;
import by.restaurant.service.CommonService;

import java.util.List;

/**
 * Created by operb_000 on 16.05.2016.
 */
public interface DishService extends CommonService<Dish> {
    List<Dish> getByDishType(Long dishTypeId);
}
