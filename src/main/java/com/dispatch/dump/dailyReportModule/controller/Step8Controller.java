package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep8Sub;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step8Service;
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
public class Step8Controller {

    private final DailyReportService dailyReportService;
    private final Step8Service step8Service;

    @RequestMapping(value = "/receipts", method = RequestMethod.GET)
    @ModelAttribute("receiptsList")
    public List<DailyReportStep8Sub> getReceiptsList() {
        List<DailyReportStep8Sub> receiptsList = step8Service.getSummary();
        return receiptsList;
    }

//    @RequestMapping(value = "/receipts", method = RequestMethod.GET)
//    public String step7(Model model, DailyReport dailyReport) {
//        dailyReportService.list(model, dailyReport);
//        return "/dailyReport/step7/receipts";
//    }


}
