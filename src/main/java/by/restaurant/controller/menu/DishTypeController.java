package by.restaurant.controller.menu;

import by.restaurant.controller.CommonController;
import by.restaurant.entity.menu.DishType;
import by.restaurant.service.menu.DishTypeService;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * Created by operb_000 on 10.05.2016.
 */
@RestController
@RequestMapping(value = "/dishTypes")
public class DishTypeController extends CommonController<DishType, DishTypeService> {}
