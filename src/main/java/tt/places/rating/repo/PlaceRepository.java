package tt.places.rating.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tt.places.rating.model.Place;

@Repository
public interface PlaceRepository extends JpaRepository<Place, Integer> {
}
