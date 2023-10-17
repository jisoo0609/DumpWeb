package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep6;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep6OptionForm;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step6Service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.sql.SQLOutput;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step6Controller {

    private final Step6Service step6Service;

    @RequestMapping(value = "/carcarelist", method = RequestMethod.GET)
    public String step6() {
        return "/dailyReport/step6/carcarelist";
    }

    @RequestMapping(value = "/ajax/carcarelist", method = RequestMethod.POST)
    @ResponseBody
    public List<DailyReportStep6> searchDailyReport(DailyReportStep6OptionForm optionForm) {
        System.out.println(step6Service.getCarListByOption(optionForm));
        return step6Service.getCarListByOption(optionForm);
    }

    @RequestMapping(value = "/ajax/cancelcarlist", method = RequestMethod.POST)
    @ResponseBody
    public void cancelCarList(@RequestBody DailyReportStep6OptionForm optionForm) {
        step6Service.cancelCarListByOption(optionForm);
    }

    @RequestMapping(value = "/ajax/Paycarlist", method = RequestMethod.POST)
    @ResponseBody
    public void PayCarList(@RequestBody DailyReportStep6OptionForm optionForm) {
        step6Service.PayCarListByOption(optionForm);
    }

}