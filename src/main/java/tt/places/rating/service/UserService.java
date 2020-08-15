package tt.places.rating.service;


import lombok.AllArgsConstructor;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import tt.places.rating.dto.UserDTO;
import tt.places.rating.exception.CustomerAlreadyRegisteredException;
import tt.places.rating.exception.CustomerNotFoundException;
import tt.places.rating.model.User;
import tt.places.rating.model.UserRegisterForm;
import tt.places.rating.repo.UserRepo;

@Service
@AllArgsConstructor
public class UserService {
    private UserRepo userRepository;
    private final PasswordEncoder encoder;


    public void saveUser(UserRegisterForm form) {
        User u = new User();
        u.setLogin(form.getLogin());
        u.setEmail(form.getEmail());
        u.setName(form.getName());
        u.setPassword(form.getPassword());
        userRepository.save(u);
    }

    public boolean checkUser(UserRegisterForm form) {
        return userRepository.existsByLoginAndEmail(form.getLogin(), form.getEmail());
    }
    public boolean check(String email){
        return userRepository.existsByEmail(email);
    }

    public UserDTO register(UserRegisterForm userRegisterForm){
        if(userRepository.existsByEmail(userRegisterForm.getEmail())){
            throw new CustomerAlreadyRegisteredException();
        }

        var user = User.builder()
                .email(userRegisterForm.getEmail())
                .name(userRegisterForm.getName())
                .login(userRegisterForm.getLogin())
                .password(encoder.encode(userRegisterForm.getPassword()))
                .build();

        userRepository.save(user);
        return UserDTO.from(user);
    }

    public UserDTO getByEmail(String email){
        var user = userRepository.findByEmail(email)
                .orElseThrow(CustomerNotFoundException::new);
        return UserDTO.from(user);
    }
}
