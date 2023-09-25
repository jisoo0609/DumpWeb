package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Sub;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step3Service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step3Controller {

    private final Step3Service step3Service;

    /*form 이동*/
    @RequestMapping(value = "/form", method = RequestMethod.GET)
    public String step3() {
        return "/dailyReport/step3/form";
    }

    /*제출처, 운송정보 저장*/
    @RequestMapping(value = "/workspace/ajax/save", method = RequestMethod.POST)
    @ResponseBody
    public void save(DailyReportStep3Main dailyReportStep3Main, DailyReportStep3Sub dailyReportStep3Sub) {
        step3Service.save(dailyReportStep3Main, dailyReportStep3Sub);
    }

    /*목록조회*/
    @RequestMapping(value = "/workspace/ajax/list", method = RequestMethod.POST)
    @ResponseBody
    public DailyReportStep3Main list(DailyReportStep3Main dailyReportStep3Main) {
        return step3Service.list(dailyReportStep3Main);
    }

    @RequestMapping(value = "/search/carSubmit", method = RequestMethod.GET)
    @ResponseBody
    public List<DailyReportStep3Main> carSubmitList(DailyReportStep3Main dailyReportStep3Main){
        return step3Service.searchByCarSubmit(dailyReportStep3Main);
    }
    @RequestMapping(value = "/search/carSubmitTel", method = RequestMethod.GET)
    @ResponseBody
    public List<DailyReportStep3Main> carSubmitTelList(DailyReportStep3Main dailyReportStep3Main){
        return step3Service.searchByCarSubmitTel(dailyReportStep3Main);
    }
    @RequestMapping(value = "/search/salesman", method = RequestMethod.GET)
    @ResponseBody
    public List<DailyReportStep3Main> salesmanList(DailyReportStep3Main dailyReportStep3Main){
        return step3Service.searchBySalesman(dailyReportStep3Main);
    }

    @RequestMapping(value = "/workspace/ajax/delete", method = RequestMethod.GET)
    @ResponseBody
    public void delete(int sheetsubID){
        step3Service.delete(sheetsubID);
    }


}
