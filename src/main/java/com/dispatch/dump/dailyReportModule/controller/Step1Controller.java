package com.dispatch.dump.dailyReportModule.controller;


import com.dispatch.dump.commonModule.db.dto.*;
import com.dispatch.dump.dailyReportModule.service.Step1Service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
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

    @RequestMapping(value ="/driver/ajax/submitlist", method = RequestMethod.GET)
    @ResponseBody
    public List<DailyReportStep1Sub> dispatchSubmitList() {
        return step1Service.findDispatchSubmitList();
    }

    @RequestMapping(value = "/driver/ajax/tdrivelist", method = RequestMethod.GET)
    @ResponseBody
    public List<DailyReportStep1Tdrive> dispatchTdriveList() {
        return step1Service.findDispatchTdriveList();
    }

    @RequestMapping(value ="/driver/ajax/recruitlist", method = RequestMethod.GET)
    @ResponseBody
    public List<DailyReportStep1Recruit> carRecruitmentList() {
        return step1Service.findCarRecruitmentList();
    }









}



