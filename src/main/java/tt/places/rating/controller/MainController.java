package tt.places.rating.controller;

import lombok.AllArgsConstructor;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import tt.places.rating.model.UserRegisterForm;
import tt.places.rating.service.PlaceService;
import tt.places.rating.service.PropertiesService;
import tt.places.rating.service.UserService;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
@RequestMapping
@AllArgsConstructor
public class MainController {
    private final UserService userService;
    private final PlaceService placeService;
    private final PropertiesService propertiesService;


    private static <T> void constructPageable(Page<T> list, int pageSize, Model model, String uri) {
        if (list.hasNext()) {
            model.addAttribute("nextPageLink", constructPageUri(uri, list.nextPageable().getPageNumber(), list.nextPageable().getPageSize()));
        }
        if (list.hasPrevious()) {
            model.addAttribute("prevPageLink", constructPageUri(uri, list.previousPageable().getPageNumber(), list.previousPageable().getPageSize()));
        }
        model.addAttribute("hasNext", list.hasNext());
        model.addAttribute("hasPrev", list.hasPrevious());
        model.addAttribute("products", list.getContent());
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

        return "index";
    }

}
