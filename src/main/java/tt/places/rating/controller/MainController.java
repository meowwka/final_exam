package tt.places.rating.controller;

import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StreamUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tt.places.rating.model.Images;
import tt.places.rating.model.Place;
import tt.places.rating.model.Reviews;
import tt.places.rating.model.UserRegisterForm;
import tt.places.rating.repo.ImagesRepository;
import tt.places.rating.repo.PlaceRepository;
import tt.places.rating.repo.ReviewsRepo;
import tt.places.rating.repo.UserRepo;
import tt.places.rating.service.ImageService;
import tt.places.rating.service.PlaceService;
import tt.places.rating.service.PropertiesService;
import tt.places.rating.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.io.*;
import java.security.Principal;

import static org.apache.tomcat.util.http.fileupload.FileUploadBase.MULTIPART_FORM_DATA;


@Controller
@RequestMapping
@AllArgsConstructor
public class MainController {
    private final UserService userService;
    private final PlaceService placeService;
    private final PropertiesService propertiesService;
    private final ImageService imageService;
    private final PlaceRepository placeRepository;
    private final ReviewsRepo reviewsRepo;
    private final UserRepo userRepo;
    private final ImagesRepository imagesRepository;


    private static <T> void constructPageable(Page<T> list, int pageSize, Model model, String uri) {
        if (list.hasNext()) {
            model.addAttribute("nextPageLink", constructPageUri(uri, list.nextPageable().getPageNumber(), list.nextPageable().getPageSize()));
        }
        if (list.hasPrevious()) {
            model.addAttribute("prevPageLink", constructPageUri(uri, list.previousPageable().getPageNumber(), list.previousPageable().getPageSize()));
        }
        model.addAttribute("hasNext", list.hasNext());
        model.addAttribute("hasPrev", list.hasPrevious());
        model.addAttribute("items", list.getContent());
        model.addAttribute("defaultPageSize", pageSize);
    }

    private static String constructPageUri(String uri, int page, int size) {
        return String.format("%s?page=%s&size=%s", uri, page, size);
    }

    @GetMapping("/registration")
    public String pageRegisterUser(Model model, HttpServletRequest uriBuilder){
        if(!model.containsAttribute("form")){
            model.addAttribute("form", new UserRegisterForm());
        }
        if(uriBuilder.getUserPrincipal() != null) {
            var user = userService.getByEmail(uriBuilder.getUserPrincipal().getName());
            model.addAttribute("user", user);
        }
        return "registration";
    }

    @RequestMapping("/registration")
    public String register(@Valid UserRegisterForm form,
                           BindingResult validationResult,
                           RedirectAttributes attributes) {
        if (validationResult.hasFieldErrors()) {
            var list = validationResult.getFieldErrors();
            attributes.addFlashAttribute("errors", list);
            return "redirect:/registration";
        }
        if (userService.checkUser(form)) {
            attributes.addFlashAttribute("user", form);
            return "redirect:/";
        }
        attributes.addFlashAttribute("user", form);

        userService.register(form);
        return "redirect:/login";
    }
    @GetMapping("/login")
    public String loginPage(@RequestParam(required = false, defaultValue = "false") Boolean error, Model model){
        model.addAttribute("error",error);
        return "login";
    }
    @GetMapping("/")
    public String index(Model model, Pageable pageable, HttpServletRequest uriBuilder) {
        var places = placeService.getPlaces(pageable);
        var uri = uriBuilder.getRequestURI();
        constructPageable(places, propertiesService.getDefaultPageSize(), model, uri);
        if(uriBuilder.getUserPrincipal() != null) {
            var user = userService.getByEmail(uriBuilder.getUserPrincipal().getName());
            model.addAttribute("user", user);
        }
        return "main";
    }

    @GetMapping("/search/{search}")
    public String search(@PathVariable("search") String search, Principal principal, Model model, Pageable pageable,HttpServletRequest uriBiulder){
        var places = placeService.searchPlace(search, pageable);
        var uriB = uriBiulder.getRequestURI();
        constructPageable(places, propertiesService.getDefaultPageSize(), model, uriB);
        if(uriBiulder.getUserPrincipal() != null) {
            var user = userService.getByEmail(uriBiulder.getUserPrincipal().getName());
            model.addAttribute("user", user);
        }
        return "main";
    }

    @GetMapping("/places/{id:\\d+?}")
    public String placePage(@PathVariable int id, Model model, Pageable pageable,
                            HttpServletRequest uriBuilder) {
        var place = placeService.getPlace(id);
        model.addAttribute("place", place);
        var uri = uriBuilder.getRequestURI();
        var foods = imageService.getImages(id, pageable);
        constructPageable(foods, propertiesService.getDefaultPageSize(), model, uri);
        var user = userService.getByEmail(uriBuilder.getUserPrincipal().getName());
        model.addAttribute("user", user);
        var review = reviewsRepo.findAllByPlace_Id(place.getId());
        model.addAttribute("review",review);
        var images = imagesRepository.findAllByPlaceId(place.getId());
        model.addAttribute("images",images);

        return "place";
    }


    @RequestMapping(value = "/post_review", method = RequestMethod.POST,
            consumes = MULTIPART_FORM_DATA)
    public String postReview(Model model,@RequestParam String comment,
                             @RequestParam int value,@RequestParam int placeId,
                             @RequestParam("file") MultipartFile image,Principal principal) throws IOException{
        var place = placeRepository.findById(placeId);
        var user = userRepo.findByEmail(principal.getName());
            Reviews r = new Reviews();
            r.setComment(comment);
            r.setValue(value);
            r.setPlace(place.get());
            r.setUser(user.get());
            reviewsRepo.save(r);
        File imageFile = new File("src\\main\\resources\\static\\images\\"+ image.getOriginalFilename());
        FileOutputStream fos = new FileOutputStream(imageFile);
        var place_id = placeRepository.findById(placeId);
        var images = new Images();
        images.setImageName(image.getOriginalFilename());
        images.setPlace(place_id.get());
        imagesRepository.save(images);
        fos.close();
        return "redirect:/places/"+placeId;
    }

    @GetMapping("/add_place")
    public String addPlace(Model model, HttpServletRequest uriBuilder){

        var user = userService.getByEmail(uriBuilder.getUserPrincipal().getName());
        model.addAttribute("user", user);
        return "addPlace";
    }




    @RequestMapping(value = "/add_place", method = RequestMethod.POST,
            consumes = MULTIPART_FORM_DATA)
    public String addPost(@RequestParam String title,
                                @RequestParam String description,
                                @RequestParam("file") MultipartFile image) throws IOException {
        File imageFile = new File("src\\main\\resources\\static\\images\\"+ image.getOriginalFilename());
        FileOutputStream fos = new FileOutputStream(imageFile);
        Place p = new Place(title,description,  image.getOriginalFilename());
        placeRepository.save(p);
        fos.close();

        System.out.println("done");
        return "redirect:/";
    }


    @GetMapping("/files/{name}")
    @ResponseBody
    public ResponseEntity<byte[]> getImage(@PathVariable("name") String name) {
        String path = "src\\main\\resources\\static\\images\\";

        final MediaType mediaType = name.toLowerCase().contains(".png") ? MediaType.IMAGE_PNG : MediaType.IMAGE_JPEG;
        try {
            InputStream is = new FileInputStream(new File(path) + "\\" + name);
            return ResponseEntity
                    .ok()
                    .contentType(mediaType)
                    .body(StreamUtils.copyToByteArray(is));
        } catch (Exception e) {
            InputStream is = null;
            try {
                is = new FileInputStream(new File(path) + "\\" + name);
                return ResponseEntity
                        .ok()
                        .contentType(mediaType)
                        .body(StreamUtils.copyToByteArray(is));
            } catch (IOException ex) {
                ex.printStackTrace();
            }
            e.printStackTrace();
        }
        return null;
    }

}
