package tt.places.rating.dto;

import lombok.*;
import tt.places.rating.model.User;

@AllArgsConstructor(access = AccessLevel.PRIVATE)
@NoArgsConstructor(access = AccessLevel.PRIVATE)
@Builder(access = AccessLevel.PRIVATE)
@Data
public class UserDTO {
    private int id;
    private String login;
    private String name;
    private String email;

    public static UserDTO from(User user) {
        return builder().id(user.getId())
                .email(user.getEmail())
                .name(user.getName())
                .login(user.getLogin())
                .build();

    }


}
