package tt.places.rating.dto;

import lombok.*;
import tt.places.rating.model.Food;

@Getter
@Setter
@ToString
@Builder(access = AccessLevel.PRIVATE)
@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
public class FoodDTO {

    private int id;
    private String name;
    private String image;
//    private FoodTypeDTO type;
    private float price;

    public static FoodDTO from(Food food) {
        return builder()
                .id(food.getId())
                .name(food.getName())
//                .type(FoodTypeDTO.from(food.getFoodType()))
                .image(food.getImage())
                .price(food.getPrice())
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
