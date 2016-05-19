package by.restaurant.repository;

import by.restaurant.entity.CommonEntity;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.NoRepositoryBean;

/**
 * Created by operb_000 on 06.05.2016.
 */
@NoRepositoryBean
public interface CommonRepository<E extends CommonEntity> extends CrudRepository<E, Long> {

}
