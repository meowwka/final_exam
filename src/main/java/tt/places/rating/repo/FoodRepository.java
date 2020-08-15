package tt.places.rating.repo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tt.places.rating.model.Food;

@Repository
public interface FoodRepository extends JpaRepository<Food, Integer> {
    Page<Food> findAllByPlaceId(int placeId, Pageable pageable);
}
