package tt.places.rating.dto;

import lombok.*;
import tt.places.rating.model.Place;
import tt.places.rating.model.Reviews;
import tt.places.rating.model.User;

@Getter
@Setter
@ToString
@Builder(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class ReviewDto {
    String comment;
    int value;
    PlaceDTO placeDTO;
    UserDTO userDTO;
    public static ReviewDto from(Reviews reviews){
        return builder()
                .comment(reviews.getComment())
                .value(reviews.getValue())
                .placeDTO(PlaceDTO.from(reviews.getPlace()))
                .userDTO(UserDTO.from(reviews.getUser()))
                .build();

    }
}
