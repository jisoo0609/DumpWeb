package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep8;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep8OptionForm;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step8Service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step8Controller {

    private final Step8Service step8Service;


    @RequestMapping(value = "/receipts", method = RequestMethod.GET)
    public String step8() {
        return "/dailyReport/step8/receipts";
    }
    @RequestMapping(value = "/receipts/ajax/list", method = RequestMethod.POST)
    @ResponseBody
    public List<DailyReportStep8> receiptsList(DailyReportStep8OptionForm option){
        System.out.println("검색조건 : " + option);
        return step8Service.searchReceiptList(option);
    }

    @RequestMapping(value = "/receipts/ajax/selectboxlist", method = RequestMethod.POST)
    @ResponseBody
    public List<DailyReportStep8> getSelectBoxList(DailyReportStep8OptionForm option) {
        return step8Service.getSelectBoxData(option);
    }


    @RequestMapping(value = "/receipts/ajax/details", method = RequestMethod.POST)
    @ResponseBody
    public DailyReportStep8 getReceiptsDetails(int sheetsubID, int sheetID) {
        System.out.println(sheetsubID);
        return step8Service.getReceiptsDetails(sheetsubID, sheetID);
    }

    @RequestMapping(value = "/receipts/ajax/approve", method = RequestMethod.POST)
    @ResponseBody
    public void approveReceiptsList(DailyReportStep8OptionForm option) {
        step8Service.approveReceipts(option);
    }

    @RequestMapping(value = "/receipts/ajax/cancel", method = RequestMethod.POST)
    @ResponseBody
    public void cancelApproveReceipts(DailyReportStep8OptionForm option) {
        step8Service.cancelApprove(option);
    }

}

