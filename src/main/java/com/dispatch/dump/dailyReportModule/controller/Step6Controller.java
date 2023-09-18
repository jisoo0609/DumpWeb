package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep6;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep6SelectForm;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step6Service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step6Controller {

    private final DailyReportService dailyReportService;
    private final Step6Service step6Service;

    @RequestMapping(value = "/carcarelist", method = RequestMethod.GET)
    public String step6(Model model) {
        model.addAttribute("defaultList", step6Service.getDefaultCarList());
        return "/dailyReport/step6/carcarelist";
    }

    @RequestMapping(value = "/carcarelist", method = RequestMethod.POST)
    @ResponseBody
    public List<DailyReportStep6> searchDailyReport(DailyReportStep6SelectForm selectForm) {
        return step6Service.getCarListByOption(selectForm);
    }
}