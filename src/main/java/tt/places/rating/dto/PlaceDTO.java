package tt.places.rating.dto;

import lombok.*;
import tt.places.rating.model.Place;

@Getter
@Setter
@ToString
@Builder(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class PlaceDTO {
    private Integer id;
    private String name;
    private String description;
    private String imagePath;

    public static PlaceDTO from(Place place) {
        return builder()
                .id(place.getId())
                .name(place.getName())
                .description(place.getDescription())
                .imagePath(place.getImage())
                .build();
    }

    private static String calcStoreImagePath(Place place) {
        if (!place.getImage().isBlank()) {
            return place.getImage();
        }
        return String.format("store%d.png", Math.abs(place.getName().hashCode() % 4));
    }
}
