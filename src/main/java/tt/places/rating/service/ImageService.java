package tt.places.rating.service;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import tt.places.rating.dto.ImagesDto;
import tt.places.rating.repo.ImagesRepository;

@Service
@AllArgsConstructor(access = AccessLevel.PRIVATE)
public class ImageService {
    private final ImagesRepository foodRepository;

    public Page<ImagesDto> getImages(int id, Pageable pageable) {
        return foodRepository.findAllByPlaceId(id, pageable)
                .map(ImagesDto::from);
    }
}
