package tt.places.rating.model;

import lombok.*;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

@Data
@Entity
@Table(name="places")
@Builder
@AllArgsConstructor(access = AccessLevel.PACKAGE)
@NoArgsConstructor(access = AccessLevel.PACKAGE)
public class Place {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @NotBlank
    @Size(min = 1, max = 128)
    @Column(length = 128)
    private String name;

    @NotBlank
    @Size(max = 128)
    @Column(length = 128)
    private String description;

    @NotBlank
    @Size(min = 1, max = 128)
    private String image;
    public Place(String name, String description,String image){
        this.image=name;
        this.description=description;
        this.image=image;


    }
}
