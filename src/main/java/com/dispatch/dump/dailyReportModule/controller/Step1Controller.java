package com.dispatch.dump.dailyReportModule.controller;


import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep1Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Sub;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step1Service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step1Controller {

    private final DailyReportService dailyReportService;
    private final Step1Service step1Service;

    @GetMapping("/driver")
    public ModelAndView getDriver(){
        ModelAndView modelAndView = new ModelAndView ("/dailyReport/step1/driver");
        modelAndView.addObject("driverList",step1Service.getSub());
        return modelAndView;
    }

    @GetMapping("/step1/getSubmit")
    @ModelAttribute("getSubmit")
    public List<DailyReportStep1Main> getSubmit() {
        List<DailyReportStep1Main> getSubmit = step1Service.get();
        return getSubmit;
    }
   /* @RequestMapping(value = "/driver", method = RequestMethod.GET)
    public String step1(Model model, DailyReport dailyReport) {
        dailyReportService.list(model, dailyReport);
        return "/dailyReport/step1/driver";
    }
*/







}
