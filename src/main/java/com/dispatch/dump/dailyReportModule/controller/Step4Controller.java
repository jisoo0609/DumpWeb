package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep4;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep4OptionForm;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step4Service;
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
public class Step4Controller {

    private final DailyReportService dailyReportService;
    private final Step4Service step4Service;


    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public String step4(Model model, DailyReport dailyReport) {
        dailyReportService.list(model, dailyReport);
        model.addAttribute("tSheet", step4Service.getSummary());
        model.addAttribute("totalAmount", step4Service.getTotalTransportAmount());
        return "/dailyReport/step4/list";
    }

    @RequestMapping(value = "/ajax/list", method = RequestMethod.POST)
    @ResponseBody
    public List<DailyReportStep4> searchData(DailyReportStep4OptionForm optionForm){
        System.out.println(optionForm);

        return step4Service.getCarListByOption(optionForm); //서비스에 해당 메소드 추가해야함
    }

}
