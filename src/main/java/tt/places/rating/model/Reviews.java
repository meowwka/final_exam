package tt.places.rating.model;

import lombok.*;

import javax.persistence.*;

@Data
@Entity
@Table(name="reviews")
@Builder
@AllArgsConstructor(access = AccessLevel.PACKAGE)
@NoArgsConstructor
public class Reviews {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @NonNull
    @Column
    private String comment;

    @NonNull
    @Column
    private int value;

    @ManyToOne
    @JoinColumn(name="place_id")
    @NonNull
    private Place place;

    @ManyToOne
    @JoinColumn(name="user_id")
    @NonNull
    private User user;
}
