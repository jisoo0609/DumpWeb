package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep5;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step5Service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step5Controller {

    private final DailyReportService dailyReportService;
    private final Step5Service step5Service;

    @RequestMapping(value = "/carcareform", method = RequestMethod.GET)
    public String step5main(Model model, DailyReport dailyReport) {
         dailyReportService.list(model, dailyReport);
        return "/dailyReport/step5/carcareform";
    }

    @RequestMapping(value = "/nextcarcare", method = RequestMethod.GET)
    public String step5next(Model model, DailyReport dailyReport) {
        dailyReportService.list(model, dailyReport);
        return "/dailyReport/step5/nextcarcare";
    }

    @RequestMapping(value = "/carcare/ajax/save", method = RequestMethod.POST)
    @ResponseBody
    public String save(@RequestBody DailyReportStep5 dailyReportStep5) {
        return step5Service.save(dailyReportStep5);
    }
}
