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

    private final Step3Service step3Service;

    /*form 이동*/
    @RequestMapping(value = "/form", method = RequestMethod.GET)
    public String step3() {
        return "/dailyReport/step3/form";
    }

    /*제출처, 운송정보 같이 저장*/
    @RequestMapping(value = "/workspace/ajax/save", method = RequestMethod.POST)
    @ResponseBody
    public String save(DailyReportStep3Main dailyReportMain, DailyReportStep3Sub dailyReportStep3Sub) {
        return step3Service.save(dailyReportMain, dailyReportStep3Sub);
    }

    /*제출처 목록 조회*/
    @RequestMapping(value = "/search", method = RequestMethod.GET)
    @ResponseBody
    public String search(DailyReportStep3Main dailyReportStep3Main){
        return step3Service.search(dailyReportStep3Main);
    }

    @RequestMapping(value = "/search/carSubmit", method = RequestMethod.GET)
    @ResponseBody
    public String carSubmitList(DailyReportStep3Main dailyReportStep3Main){
        return step3Service.searchByCarSubmit(dailyReportStep3Main);
    }
    @RequestMapping(value = "/search/carSubmitTel", method = RequestMethod.GET)
    @ResponseBody
    public String carSubmitTelList(DailyReportStep3Main dailyReportStep3Main){
        return step3Service.searchByCarSubmitTel(dailyReportStep3Main);
    }
    @RequestMapping(value = "/search/salesman", method = RequestMethod.GET)
    @ResponseBody
    public String salesmanList(DailyReportStep3Main dailyReportStep3Main){
        return step3Service.searchBySalesman(dailyReportStep3Main);
    }

    /*insert 후 목록 조회--> 보완 예정*/
    @RequestMapping(value = "/workspace/ajax/list", method = RequestMethod.POST)
    @ResponseBody
    public String list(Model model, DailyReportStep3Main dailyReportStep3Main) {
        return step3Service.list(model, dailyReportStep3Main);
    }


}
