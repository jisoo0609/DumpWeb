package com.dispatch.dump.dailyReportModule.controller;


import com.dispatch.dump.commonModule.db.dto.*;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step1Service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step1Controller {


    private final Step1Service step1Service;

    @RequestMapping(value = "/driver", method = RequestMethod.GET)
    public String step1() {
        return "/dailyReport/step1/driver";
    }

    @RequestMapping(value = "/driver/ajax/total", method = RequestMethod.POST)
    @ResponseBody
    public DailyReportStep1Total tSheetSubTotal(DailyReportStep1Option option) {
        return step1Service.findCalTotal(option);
    }

    @RequestMapping(value = "/driver/ajax/submitlist", method = RequestMethod.GET)
    @ResponseBody
    public List<DailyReportStep1Sub> dispatchSubmitList() {
        return step1Service.findDispatchSubmitList();
    }

    @RequestMapping(value = "/driver/ajax/tdrivelist", method = RequestMethod.GET)
    @ResponseBody
    public List<DailyReportStep1Tdrive> dispatchTdriveList() {

        return step1Service.findDispatchTdriveList();
    }






//    @RequestMapping(value = "/driver", method = RequestMethod.GET)
//
//    public String step1(Model model, DailyReport dailyReport) {
//        //tsheet_sub 조회
//
//        List<DailyReportStep1Sub> subList = step1Service.getSub();
//        model.addAttribute("subList", subList);
//
//
//
//
//        // 총 운반 금액을 모델에 추가
//        double totalTransportationCost = subList.stream()
//                .mapToDouble(sub -> sub.getQty() * sub.getQtyup())
//                .sum();
//        model.addAttribute("totalTransportationCost", totalTransportationCost);
//        // 총 운행 대수를 계산하고 모델에 추가
//        int totalQty = subList.stream()
//                .mapToInt(sub -> (int) sub.getQty())
//                .sum();
//        model.addAttribute("totalQty", totalQty);
//        //tsheet조회
//
//        List<DailyReportStep1Sub> mainList = step1Service.getMain();
//        model.addAttribute("mainList", mainList);
//
//        List<DailyReportStep1Tdrive> tdriveList = step1Service.getTdrive();
//        model.addAttribute("tdriveList", tdriveList);
//
//        return "/dailyReport/step1/driver";
//
//    }
//
//
//
//
//    //tsheet 조회*/
//
//    @GetMapping("/driver/main")
//    public ModelAndView listMain(){
//        ModelAndView modelAndView = new ModelAndView ("/dailyReport/step1/driver");
//        modelAndView.addObject("mainList",step1Service.getMain());
//        return modelAndView;
//    }
//    @GetMapping("/driver/tdrive")
//    public ModelAndView getTdrive(){
//        ModelAndView modelAndView = new ModelAndView ("/dailyReport/step1/driver");
//        modelAndView.addObject("tdriveList",step1Service.getTdrive());
//        return modelAndView;
//    }








}



