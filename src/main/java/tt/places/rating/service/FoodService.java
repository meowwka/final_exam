package tt.places.rating.service;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import tt.places.rating.dto.FoodDTO;
import tt.places.rating.repo.FoodRepository;

@Service
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class FoodService {
    private final FoodRepository foodRepository;

    public Page<FoodDTO> getFoods(int id, Pageable pageable) {
        return foodRepository.findAllByPlaceId(id, pageable)
                .map(FoodDTO::from);
    }
}
