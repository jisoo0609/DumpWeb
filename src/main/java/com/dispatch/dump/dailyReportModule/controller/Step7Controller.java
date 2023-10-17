package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep7CarNo;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step7Service;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep7Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep7Sub;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step7Controller {

    private final DailyReportService dailyReportService;
    private final Step7Service step7Service;

    /*제출처 주문 등록*/
    @ResponseBody
    @RequestMapping(value = "/ajax/orderSave", method = RequestMethod.POST)
    public String saveOrder(DailyReportStep7Main dailyReportStep7Main, DailyReportStep7Sub dailyReportStep7Sub) {
        return step7Service.saveOrder(dailyReportStep7Main, dailyReportStep7Sub);
    }

    /*제출처 주문 조회*/
    @RequestMapping(value = "/ajax/orderList", method = RequestMethod.POST)
    @ResponseBody
    public List<DailyReportStep7Sub> dispatchOrderList(DailyReportStep7Main dailyReportStep7Main){
        return step7Service.searchOrderList(dailyReportStep7Main);
    }

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