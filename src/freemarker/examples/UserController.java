package freemarker.examples;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class UserController {
    /**
     * Static list of users to simulate Database
     */
    private static List<User> userList = new ArrayList<User>();

    //Initialize the list with some data for index screen
    static {
        userList.add(new User("Bill", "Gates"));
        userList.add(new User("Steve", "Jobs"));
        userList.add(new User("Larry", "Page"));
        userList.add(new User("Sergey", "Brin"));
        userList.add(new User("Larry", "Ellison"));
    }

    private Map<String, String> countryCapitals() {
        Map<String, String> countryCapitalList = new HashMap<String, String>();
        countryCapitalList.put("United States", "Washington DC");
        countryCapitalList.put("India", "Delhi");
        countryCapitalList.put("Germany", "Berlin");
        countryCapitalList.put("France", "Paris");
        countryCapitalList.put("Italy", "Rome");
        return countryCapitalList;
    }


    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model) {
        model.addAttribute("userList", userList);
        return "index";
    }

    @RequestMapping(value = "/quickstart", method = RequestMethod.GET)
    public String quickstart(Model model) {
        model.addAttribute("map", countryCapitals());
        return "quickstart";
    }


    /**
     * Add a new user into static user lists and display the
     * same into FTL via redirect
     *
     * @param user
     * @return Redirect to /index page to display user list
     */
    @RequestMapping(value = "/add", method = RequestMethod.POST)
    public String add(@ModelAttribute("user") User user) {

        if (null != user && null != user.getFirstname()
                && null != user.getLastname() && !user.getFirstname().isEmpty()
                && !user.getLastname().isEmpty()) {

            synchronized (userList) {
                userList.add(user);
            }

        }

        return "redirect:index.html";
    }

}
