package by.restaurant.service.menu;

import by.restaurant.entity.menu.DishType;
import by.restaurant.repository.menu.DishTypeRepository;
import by.restaurant.service.NamedServiceImpl;
import org.springframework.stereotype.Service;

/**
 * Created by operb_000 on 06.05.2016.
 */
@Service
public class DishTypeServiceImpl extends NamedServiceImpl<DishType, DishTypeRepository> implements DishTypeService{

}
