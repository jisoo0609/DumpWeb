package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportMain;
import com.dispatch.dump.commonModule.db.dto.DailyReportSub;
import com.dispatch.dump.dailyReportModule.service.DailyReportMainService;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/dailyReportMain")
@RequiredArgsConstructor
public class DailyReportMainController {

    private final DailyReportMainService dailyReportMainService;


    @RequestMapping(value = "/ajax/save", method = RequestMethod.POST)
    @ResponseBody
    public String save(DailyReportMain dailyReportMain, DailyReportSub dailyReportSub) {
        return dailyReportMainService.save(dailyReportMain, dailyReportSub);
    }




    /*@RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model, DailyReport dailyReport) {
        return dailyReportService.list(model, dailyReport);
    }

    @RequestMapping(value = "/form", method = RequestMethod.GET)
    public String form(Model model, DailyReport dailyReport) {
        return dailyReportService.form(model, dailyReport);
    }

    @RequestMapping(value = "/carlist", method = RequestMethod.GET)
    public String carlist(Model model, DailyReport dailyReport) {
        return dailyReportService.carlist(model, dailyReport);
    }

    @RequestMapping(value = "/ajax/save", method = RequestMethod.POST)
    @ResponseBody
    public String save(DailyReport dailyReport) {
        return dailyReportService.save(dailyReport);
    }

    @RequestMapping(value = "/ajax/dataSetting")
    @ResponseBody
    public String dataSetting(DailyReport dailyReport) {
        return dailyReportService.dataSetting(dailyReport);
    }

    @RequestMapping(value = "/ajax/delete")
    @ResponseBody
    public String delete(DailyReport dailyReport) {

        return dailyReportService.delete(dailyReport);
    }*/
}
