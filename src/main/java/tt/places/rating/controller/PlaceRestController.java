package tt.places.rating.controller;

import lombok.AccessLevel;
import lombok.AllArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import tt.places.rating.dto.ImagesDto;
import tt.places.rating.dto.PlaceDTO;
import tt.places.rating.service.FoodService;
import tt.places.rating.service.PlaceService;

import javax.validation.constraints.Min;
import java.util.List;

@RestController
@RequestMapping("/api/places")
@AllArgsConstructor(access = AccessLevel.PRIVATE)
class PlaceRestController {
    private final PlaceService placeService;
    private final FoodService foodService;

    @GetMapping
    public List<PlaceDTO> getPlaces(Pageable pageable) {
        return placeService.getPlaces(pageable).getContent();
    }

    @GetMapping("/{id:\\d+?}")
    public PlaceDTO placePage(@PathVariable int id) {
        return placeService.getPlace(id);
    }

    @GetMapping("/{id:\\d+}/foods")
    public List<ImagesDto> getFoods(@PathVariable @Min(5) int id, Pageable pageable) {
        return foodService.getFoods(id, pageable).getContent();
    }
}
