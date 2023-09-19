package com.dispatch.dump.dailyReportModule.controller;


import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep1Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep1Sub;
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

    //tsheet_sub 조회
    @RequestMapping(value = "/driver", method = RequestMethod.GET)
    public String step1(Model model, DailyReport dailyReport) {

        List<DailyReportStep1Sub> subList = step1Service.getSub();
        model.addAttribute("subList", subList);

        // 총 운반 금액을 모델에 추가
        double totalTransportationCost = subList.stream()
                .mapToDouble(sub -> sub.getQty() * sub.getQtyup())
                .sum();
        model.addAttribute("totalTransportationCost", totalTransportationCost);

        List<DailyReportStep1Sub> mainList = step1Service.getMain();
        model.addAttribute("list", mainList);

        return "/dailyReport/step1/driver";



       /* model.addAttribute("list", step1Service.getMain());
        return "/dailyReport/step1/driver";*/
    }



/*    @GetMapping("/driver")
    public ModelAndView listMain(){
        ModelAndView modelAndView = new ModelAndView ("/dailyReport/step1/driver");
        modelAndView.addObject("list",step1Service.getMain());
        return modelAndView;
    }
    //tsheet 조회*/

 /*   @GetMapping("/driver/main")
    public ModelAndView listMain(){
        ModelAndView modelAndView = new ModelAndView ("/dailyReport/step1/driver");
        modelAndView.addObject("list",step1Service.getMain());
        return modelAndView;
    }*/

    @RequestMapping(value = "/step1/getList", method = RequestMethod.GET)
    @ModelAttribute("list")
    public List<DailyReportStep1Sub> getList() {
        List<DailyReportStep1Sub> list = step1Service.getSub();
        return list;
    }




   /* @RequestMapping(value = "/driver", method = RequestMethod.GET)
    public String step1(Model model, DailyReport dailyReport) {
        dailyReportService.list(model, dailyReport);
        return "/dailyReport/step1/driver";
    }
*/







}
