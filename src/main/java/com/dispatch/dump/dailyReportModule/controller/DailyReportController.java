package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Map;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class DailyReportController {

    private final DailyReportService dailyReportService;


    @RequestMapping(value = "/driver", method = RequestMethod.GET)
    public String driver(Model model, DailyReport dailyReport) {
        return dailyReportService.driver(model, dailyReport);
    }

    @RequestMapping(value = "/manager", method = RequestMethod.GET)
    public String manager(Model model, DailyReport dailyReport) {
        return dailyReportService.manager(model, dailyReport);
    }

    @RequestMapping(value = "/form", method = RequestMethod.GET)
    public String form(Model model, DailyReport dailyReport) {
        return dailyReportService.form(model, dailyReport);
    }

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String list(Model model, DailyReport dailyReport) {
        return dailyReportService.list(model, dailyReport);
    }

    @RequestMapping(value = "/carcareform", method = RequestMethod.GET)
    public String carcareform(Model model, DailyReport dailyReport) {
        return dailyReportService.carcareform(model, dailyReport);
    }

    @RequestMapping(value = "/nextcarcare", method = RequestMethod.GET)
    public String nextcarcare(Model model, DailyReport dailyReport) {
        return dailyReportService.nextcarcare(model, dailyReport);
    }

    @RequestMapping(value = "/carcarelist", method = RequestMethod.GET)
    public String carcarelist(Model model, DailyReport dailyReport) {
        return dailyReportService.carcarelist(model, dailyReport);
    }

    @RequestMapping(value = "/receipts", method = RequestMethod.GET)
    public String receipts(Model model, DailyReport dailyReport) {
        return dailyReportService.receipts(model, dailyReport);
    }

    @RequestMapping(value = "/oldform", method = RequestMethod.GET)
    public String oldform(Model model, DailyReport dailyReport) {
        return dailyReportService.oldform(model, dailyReport);
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
    }
}
