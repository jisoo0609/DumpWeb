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
    public DailyReportStep3Main carSubmitDetails(@RequestBody DailyReportStep3Main dailyReport) {
        return step3Service.findTCarSubmitDetails(dailyReport.getSheetID());
    }


    /*제출처, 운송정보 저장*/
    @RequestMapping(value = "/workspace/ajax/save", method = RequestMethod.POST)
    @ResponseBody
    public void save(DailyReportStep3Main dailyReportStep3Main, DailyReportStep3Sub dailyReportStep3Sub) {
        step3Service.save(dailyReportStep3Main, dailyReportStep3Sub);
    }


/*    @RequestMapping(value = "/workspace/ajax/list", method = RequestMethod.POST)
    @ResponseBody
    public List<DailyReportStep3Sub> list(DailyReportStep3Main dailyReportStep3Main) {
        return step3Service.list(dailyReportStep3Main);
    }*/

    @RequestMapping(value = "/workspace/ajax/list", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> list(DailyReportStep3Main dailyReportStep3Main) {
        Map<String, Object> resultMap = new HashMap<>();

        //제출처 정보
        DailyReportStep3Main carSubmitInfo=step3Service.findByCarSubmitInfo(dailyReportStep3Main);
        //운송정보
        List<DailyReportStep3Sub> transPortList = step3Service.list(dailyReportStep3Main);
        System.out.println("carSubmitInfo는?"+carSubmitInfo);
        System.out.println("transPortList는?"+transPortList);

        resultMap.put("carSubmitInfo", carSubmitInfo);
        resultMap.put("transPortList", transPortList);
        return resultMap;
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
    public String delete(DailyReportStep3Sub dailyReportStep3Sub) {
        return step3Service.delete(dailyReportStep3Sub);
    }

    /*전체삭제*/
    @RequestMapping(value = "/workspace/ajax/deleteAll", method = RequestMethod.POST)
    @ResponseBody
    public String deleteAll(DailyReportStep3Main dailyReportStep3Main) {
        return step3Service.deleteAll(dailyReportStep3Main);
    }

    @RequestMapping(value = "/workspace/ajax/saveSales", method = RequestMethod.POST)
    @ResponseBody
    public String saveSales(DailyReportStep3Main dailyReportStep3Main) {
        return step3Service.saveSales(dailyReportStep3Main);
    }


    @RequestMapping(value = "/workspace/ajax/approval/carsubmit", method = RequestMethod.POST)
    @ResponseBody
    public String approvalByCarSubmit(DailyReportStep3Main dailyReportStep3Main) {
        return step3Service.approvalByCarSubmit(dailyReportStep3Main);
    }

    @RequestMapping(value = "/workspace/ajax/submit", method = RequestMethod.POST)
    @ResponseBody
    public String submitMainData(DailyReportStep3Main dailyReportStep3Main) throws Exception {
       return step3Service.submitMainData(dailyReportStep3Main);
    }

}

