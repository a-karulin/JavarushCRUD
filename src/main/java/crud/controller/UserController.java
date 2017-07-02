package crud.controller;

import crud.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.support.PagedListHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import crud.service.UserService;

import java.util.List;
import java.util.Map;

@Controller
public class UserController {
    private UserService userService;
    @Autowired(required = true)
    @Qualifier(value = "userService")
    public void setUserService(UserService userService) {
        this.userService = userService;
    }

    @RequestMapping(value = "/users", method = RequestMethod.GET)
    public String listUsers(Model model){
        model.addAttribute("user", new User());
        model.addAttribute("listUsers", this.userService.listUsers());
        return "users";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("user") User user){
        if(user.getId()==0){
            this.userService.addUser(user);
        }else{
            this.userService.updateUser(user);
        }
        return "redirect:/users";
    }

    @RequestMapping("/remove/{id}")
    public String removeUser(@PathVariable("id") int id){
        this.userService.removeUser(id);
        return "redirect:/users";
    }

    @RequestMapping(value = "edit/{id}")
    public String editUser(@PathVariable("id") int id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));
        userService.updateUser(userService.getUserById(id));
       // model.addAttribute("listUser", this.userService.listUsers());

        return "users";
    }

    @RequestMapping("userdata/{id}")
    public String userData(@PathVariable("id") int id, Model model){
        model.addAttribute("user", this.userService.getUserById(id));
        return "userdata";
    }

    @RequestMapping(value = "/search", method = RequestMethod.GET)
    public String searchRequestHandler(@RequestParam("name") String name,
                                       @RequestParam(value = "page", defaultValue = "0") int page,
                                       @RequestParam Map<String, String> allRequestParams,
                                       Model model){
        List<User> resultList = userService.searchUsers(name);
        PagedListHolder<User> usersPages = new PagedListHolder<User>(resultList);
        usersPages.setPageSize(5);
        usersPages.setPage(page);
        String nextPageRequest=pageRequestModifier(allRequestParams,page+1);
        String prevPageRequest=pageRequestModifier(allRequestParams,page-1);
        model.addAttribute("nextPageRequest",nextPageRequest);
        model.addAttribute("prevPageRequest",prevPageRequest);
        model.addAttribute("resultPages", usersPages);
        return "search";
    }

    private static String pageRequestModifier(Map<String, String> allRequestParams, int page) {
        if (allRequestParams != null && !allRequestParams.isEmpty() && allRequestParams.containsKey("page")) {
            allRequestParams.put("page", Integer.toString(page));
            StringBuilder stringBuilder = new StringBuilder("?");
            for (Map.Entry<String, String> entry : allRequestParams.entrySet()) {
                stringBuilder.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
            }
            return   stringBuilder.substring(0, stringBuilder.length() - 1);

        } else return "";
    }
}
