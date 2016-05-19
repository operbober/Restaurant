package by.restaurant.entity;

import javax.persistence.MappedSuperclass;

/**
 * Created by operb_000 on 06.05.2016.
 */
@MappedSuperclass
public class NamedEntity extends CommonEntity {
    String name;

    public NamedEntity() {
    }

    public NamedEntity(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
