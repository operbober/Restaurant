package by.restaurant.entity.menu;

import by.restaurant.entity.CommonEntity;
import by.restaurant.entity.NamedEntity;

import javax.persistence.Entity;
import javax.persistence.Table;

/**
 * Created by operb_000 on 29.04.2016.
 */
@Entity
@Table(name = "product")
public class Product extends NamedEntity {
    int price;
    int amount;

    public Product(){}

    public Product(String name, int price, int amount) {
        super(name);
        this.price = price;
        this.amount = amount;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getAmount() {
        return amount;
    }

    public void setAmount(int amount) {
        this.amount = amount;
    }
}
