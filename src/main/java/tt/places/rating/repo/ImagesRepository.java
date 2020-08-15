package tt.places.rating.repo;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tt.places.rating.model.Images;

import java.util.List;

@Repository
public interface ImagesRepository extends JpaRepository<Images, Integer> {
    Page<Images> findAllByPlaceId(int placeId, Pageable pageable);
    List<Images> findAllByPlaceId(int placeId);

}
