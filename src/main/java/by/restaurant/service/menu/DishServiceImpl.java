package by.restaurant.service.menu;

import by.restaurant.entity.menu.Dish;
import by.restaurant.entity.menu.DishType;
import by.restaurant.repository.menu.DishRepository;
import by.restaurant.service.CommonServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by operb_000 on 16.05.2016.
 */
@Service
public class DishServiceImpl extends CommonServiceImpl<Dish, DishRepository> implements DishService{

    @Autowired
    DishTypeService dishTypeService;

    @Override
    public List<Dish> getByDishType(Long dishTypeId) {
        DishType dishType = dishTypeService.get(dishTypeId);
        dishType.getDishList().size();
        return dishType.getDishList();
    }
}
