package tt.places.rating.service;

import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import tt.places.rating.dto.PlaceDTO;
import tt.places.rating.exception.ResourceNotFoundException;
import tt.places.rating.repo.PlaceRepository;

@Service
@AllArgsConstructor
public class PlaceService {
    private final PlaceRepository placeRepository;

    public Page<PlaceDTO> getPlaces(Pageable pageable) {
        return placeRepository.findAll(pageable)
                .map(PlaceDTO::from);
        //.toList();
    }

    public PlaceDTO getPlace(int id) {
        var place = placeRepository.findById(id).orElseThrow(() -> new ResourceNotFoundException("place", id));
        return PlaceDTO.from(place);
    }
}
