package edu.dataworld.snackworld.standard.web;

import edu.dataworld.snackworld.common.Search;
import edu.dataworld.snackworld.common.Util;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value="/standard")
public class StandardController {

    @RequestMapping(value="standardMng.do")
    public String showStandardMng(@ModelAttribute("searchVO") Search search, ModelMap model) {

        return "/standard/standardMng.view";
    }
}
