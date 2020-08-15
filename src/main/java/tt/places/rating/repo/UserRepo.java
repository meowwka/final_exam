package tt.places.rating.repo;


import org.springframework.data.jpa.repository.JpaRepository;
import tt.places.rating.model.User;

import java.util.Optional;

public interface UserRepo extends JpaRepository<User, Integer> {
    boolean existsByLoginAndEmail(String login, String email);
    boolean existsByEmail(String email);
    Optional<User> findByEmail(String email);

}
