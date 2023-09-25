package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep7CarNo;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step7Service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step7Controller {

    private final DailyReportService dailyReportService;
    private final Step7Service step7Service;

    @RequestMapping(value = "/orderform", method = RequestMethod.GET)
    public String step7(Model model, DailyReport dailyReport) {
        dailyReportService.list(model, dailyReport);
        step7Service.carNoList(model);
        return "/dailyReport/step7/order";

    }

    @ResponseBody
    @RequestMapping(value = "/ajax/saveCarData")
    public String saveCarData(DailyReportStep7CarNo dailyReportStep7CarNo) {
        return step7Service.saveCarData(dailyReportStep7CarNo);
    }



}
