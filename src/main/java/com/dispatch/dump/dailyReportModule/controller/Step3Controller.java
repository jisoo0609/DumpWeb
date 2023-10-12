package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.*;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step3Service;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

    /*step4요청 : sheetID로 조회 후 제출처정보 반영*/
    @RequestMapping(value = "/form/ajax/details", method = RequestMethod.POST)
    @ResponseBody
    public DailyReportStep3Main carSubmitDetails(int sheetID) {
        return step3Service.findTCarSubmitDetails(sheetID);
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
    public List<DailyReportStep3Main> carSubmitList(DailyReportStep3Main dailyReportStep3Main) {
        return step3Service.searchByCarSubmit(dailyReportStep3Main);
    }

    @RequestMapping(value = "/search/carSubmitTel", method = RequestMethod.GET)
    @ResponseBody
    public Map<String, Object> carSubmitTelList(DailyReportStep3Main dailyReportStep3Main) {
        Map<String, Object> resultMap = new HashMap<>();
        List<DailyReportStep3Main> list = step3Service.searchByCarSubmitTel(dailyReportStep3Main);

        Login login = new Login();
        login.setUserId(dailyReportStep3Main.getCarSubmitTel());


        Login checkData = step3Service.findByUserInfo(login);

        resultMap.put("list", list);
        resultMap.put("checkData", checkData);
        return resultMap;
    }

    @RequestMapping(value = "/search/salesman", method = RequestMethod.GET)
    @ResponseBody
    public List<DailyReportStep3Main> salesmanList(DailyReportStep3Main dailyReportStep3Main) {
        return step3Service.searchBySalesman(dailyReportStep3Main);
    }

    @RequestMapping(value = "/workspace/ajax/edit/carSubmit", method = RequestMethod.POST)
    @ResponseBody

    public String editByCarSubmit(DailyReportStep3Main dailyReportStep3Main) {
        return step3Service.editByCarSubmit(dailyReportStep3Main);
    }

    @RequestMapping(value = "/workspace/ajax/edit", method = RequestMethod.POST)
    @ResponseBody
    public String edit(DailyReportStep3Sub dailyReportStep3Sub) {
        return step3Service.edit(dailyReportStep3Sub);
    }

    @RequestMapping(value = "/workspace/ajax/delete", method = RequestMethod.GET)
    @ResponseBody
    public String delete(int sheetsubID) {
        return step3Service.delete(sheetsubID);
    }


    /*전체삭제*/
    @RequestMapping(value = "/workspace/ajax/deleteAll", method = RequestMethod.POST)
    @ResponseBody
    public void delete(DailyReportStep3Main dailyReportStep3Main) {
        step3Service.deleteAll(dailyReportStep3Main);
    }
}

