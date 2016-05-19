package by.restaurant.entity.menu;

import by.restaurant.entity.CommonEntity;

import javax.persistence.*;

/**
 * Created by operb_000 on 06.05.2016.
 */
@Entity
@Table(name = "dish_price")
public class DishPrice extends CommonEntity {
    @ManyToOne()
    @JoinColumn(name = "dish_id")
    Dish dish;
    int price;

    public DishPrice(Dish dish, int price) {
        this.dish = dish;
        this.price = price;
    }

    public Dish getDish() {
        return dish;
    }

    public void setDish(Dish dish) {
        this.dish = dish;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }
}
