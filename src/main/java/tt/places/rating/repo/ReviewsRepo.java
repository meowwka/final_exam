package tt.places.rating.repo;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import tt.places.rating.model.Reviews;

import java.util.List;

@Repository
public interface ReviewsRepo extends JpaRepository<Reviews,Integer> {
    List<Reviews> findAllByPlace_Id(int id);
    boolean existsByUser_Id(int id);
}
