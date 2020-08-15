package tt.places.rating.dto;

import lombok.*;
import tt.places.rating.model.Images;

@Getter
@Setter
@ToString
@Builder(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class ImagesDto {

    private int id;
    private String name;
    private String image;
//    private FoodTypeDTO type;
    private float price;

    public static ImagesDto from(Images images) {
        return builder()
                .id(images.getId())
                .name(images.getName())
//                .type(FoodTypeDTO.from(food.getFoodType()))
                .image(images.getImage())
                .price(images.getPrice())
                .build();
    }
//
//    @Getter
//    @Setter
//    @ToString
//    @Builder(access = AccessLevel.PRIVATE)
//    @AllArgsConstructor(access = AccessLevel.PRIVATE)
//    @NoArgsConstructor(access = AccessLevel.PRIVATE)
//    public static class FoodTypeDTO {
//        private int id;
//        private String name;
//        private String icon;
//
//        public static FoodTypeDTO from(FoodType foodType) {
//            return builder()
//                    .id(foodType.getId())
//                    .name(foodType.getName())
//                    .icon(foodType.getIcon())
//                    .build();
//        }
//    }
}
