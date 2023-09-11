package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Sub;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step3Service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step3Controller {
    private final DailyReportService dailyReportService;
    private final Step3Service step3Service;

    @RequestMapping(value = "/form", method = RequestMethod.GET)
    public String step3(Model model, DailyReport dailyReport) {
        dailyReportService.list(model, dailyReport);
        return "/dailyReport/step3/form";
    }

    @RequestMapping(value = "/workspace/ajax/save", method = RequestMethod.POST)
    @ResponseBody
    public String save(DailyReportStep3Main dailyReportMain, DailyReportStep3Sub dailyReportStep3Sub) {
        return step3Service.save(dailyReportMain, dailyReportStep3Sub);
    }

    /*제출처만 저장*/
    @RequestMapping(value = "/workspace/ajax/saveMain", method = RequestMethod.POST)
    @ResponseBody
    public String save(DailyReportStep3Main dailyReportMain) {
        return step3Service.save(dailyReportMain);
    }

    /*insert 후 목록 조회*/
    @RequestMapping(value = "/workspace/ajax/list", method = RequestMethod.POST)
    @ResponseBody
    public String list(Model model, DailyReportStep3Main dailyReportStep3Main) {
        return step3Service.list(model, dailyReportStep3Main);
    }


}
