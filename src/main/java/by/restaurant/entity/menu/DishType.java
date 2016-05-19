package by.restaurant.entity.menu;

import by.restaurant.entity.NamedEntity;
import com.fasterxml.jackson.annotation.JsonIgnore;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import java.util.List;

/**
 * Created by operb_000 on 06.05.2016.
 */
@Entity
@Table(name = "dish_type")
public class DishType extends NamedEntity {
    @JsonIgnore
    @ManyToMany(mappedBy = "dishType", fetch = FetchType.LAZY)
    private List<Dish> dishList;

    public List<Dish> getDishList() {
        return dishList;
    }

    public void setDishList(List<Dish> dishList) {
        this.dishList = dishList;
    }
}
