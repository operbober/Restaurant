package by.restaurant.repository;

import by.restaurant.entity.NamedEntity;
import org.springframework.data.repository.NoRepositoryBean;

/**
 * Created by operb_000 on 06.05.2016.
 */
@NoRepositoryBean
public interface NamedRepository<E extends NamedEntity> extends CommonRepository<E> {
    E findByName(String name);
}
