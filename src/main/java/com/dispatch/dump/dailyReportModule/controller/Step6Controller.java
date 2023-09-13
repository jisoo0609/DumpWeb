package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep2Sub;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep6;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step2Service;
import com.dispatch.dump.dailyReportModule.service.Step6Service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step6Controller {

    private final DailyReportService dailyReportService;
    private final Step6Service step6Service;

    @RequestMapping(value = "/carcarelist", method = RequestMethod.GET)
    public String step6(Model model, DailyReport dailyReport) {return "/dailyReport/step6/carcarelist";}

    @RequestMapping(value = "/step6/getcarlist", method = RequestMethod.GET)
    @ModelAttribute("carlist")
    public List<DailyReportStep6> getcarlist() {
        List<DailyReportStep6> carlist = step6Service.getcarlist();

        return carlist;
    }



}
