package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReport;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep6;
import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import com.dispatch.dump.dailyReportModule.service.Step6Service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.Collections;
import java.util.List;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step6Controller {

    private final DailyReportService dailyReportService;
    private final Step6Service step6Service;

    @RequestMapping(value = "/carcarelist", method = RequestMethod.GET)
    public String step6(Model model, DailyReport dailyReport) {
        return "/dailyReport/step6/carcarelist";
    }

    /*@RequestMapping(value = "/step6/getcarlist", method = RequestMethod.GET)
    @ModelAttribute("carlist")
    public List<DailyReportStep6> getcarlist() {
        List<DailyReportStep6> carlist = step6Service.getCarListByDate();
        return carlist;
    }

    @RequestMapping(value = "/step6/findDailyReportClub", method = RequestMethod.GET)
    @ModelAttribute("carlist")
    public List<DailyReportStep6> findDailyReportClub(
            String carNo,
            String drvClub

    ) {
        List<DailyReportStep6> carlist = step6Service.getCarListByItem(carNo, drvClub);
        return carlist;
    }*/

    @RequestMapping(value = "/step6/search", method = RequestMethod.POST)
    @ModelAttribute("carlist")
    public List<DailyReportStep6> searchDailyReport(
            @RequestParam("carNo") String carNo,
            @RequestParam("searchType") String searchType,
            @RequestParam("selectOption") String selectOption
    ) {
        System.out.println(carNo);
        System.out.println(searchType);
        System.out.println(selectOption);

        if ("date".equals(searchType)) {
            // 날짜 기준으로 검색
            return step6Service.getCarListByDate();
        } else if ("item".equals(searchType)) {
            // 품목 기준으로 검색
            System.out.println(step6Service.getCarListByItem(carNo, selectOption));
            return step6Service.getCarListByItem(carNo, selectOption);
        } else {
            // 다른 경우에 대한 처리 (예: 오류 처리)
            return Collections.emptyList();
        }
    }
}