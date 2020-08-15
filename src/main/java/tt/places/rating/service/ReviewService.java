package tt.places.rating.service;

import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import tt.places.rating.repo.ReviewsRepo;

@Service
@AllArgsConstructor
public class ReviewService {
    ReviewsRepo reviewsRepo;
}
