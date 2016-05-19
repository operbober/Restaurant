package by.restaurant.entity.menu;

import by.restaurant.entity.NamedEntity;

import javax.persistence.*;
import java.util.List;
import java.util.Set;

/**
 * Created by operb_000 on 04.05.2016.
 */
@Entity
@Table(name = "dish")
public class Dish extends NamedEntity{

    boolean enabled;
    String description;

    @ManyToMany
    @JoinTable(name = "dish_dish_type",
    joinColumns = @JoinColumn(name = "dish_id"),
    inverseJoinColumns = @JoinColumn(name = "dish_type_id"))
    Set<DishType> dishType;

    @OneToMany(mappedBy = "dish", fetch = FetchType.LAZY)
    List<DishPrice> price;

    public Dish() {

    }

    public Dish(String name, boolean enabled, String description, Set<DishType> dishType, List<DishPrice> price) {
        super(name);
        this.enabled = enabled;
        this.description = description;
        this.dishType = dishType;
        this.price = price;
    }

    public boolean isEnabled() {
        return enabled;
    }

    public void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Set<DishType> getDishType() {
        return dishType;
    }

    public void setDishType(Set<DishType> dishType) {
        this.dishType = dishType;
    }

    public List<DishPrice> getPrice() {
        return price;
    }

    public void setPrice(List<DishPrice> price) {
        this.price = price;
    }
}
