package tt.places.rating.repo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import tt.places.rating.model.Place;

@Repository
public interface PlaceRepository extends JpaRepository<Place, Integer> {
    @Query("SELECT p FROM Place p WHERE (p.name like concat(:name, '%')) or (p.name like concat('%',:name,'%')) or (p.name like concat('%', :name)) or " +
            "(p.description like concat(:name, '%')) or (p.description like concat('%',:name,'%')) or (p.description like concat('%', :name))")
Page<Place> findPlaceByName(@Param("name")String text, Pageable p);
}
