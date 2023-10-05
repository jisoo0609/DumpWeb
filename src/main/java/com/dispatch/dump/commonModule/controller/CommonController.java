package com.dispatch.dump.commonModule.controller;

import com.dispatch.dump.commonModule.util.FileUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/common")
@RequiredArgsConstructor
public class CommonController {

    private final FileUtil fileUtil;

    @RequestMapping("/")
    public String commonPage() {
        return "";
    }


    @RequestMapping(value = "/getFile/{idx}", method = RequestMethod.GET)
    @ResponseBody
    public void getImage(HttpServletResponse response, @PathVariable int idx) {
        fileUtil.getImageFile(response, idx);

    }

}