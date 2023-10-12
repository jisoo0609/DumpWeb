package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep5;
import com.dispatch.dump.dailyReportModule.service.Step5Service;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step5Controller {
    private final Step5Service step5Service;

    @RequestMapping(value = "/carcareform", method = RequestMethod.GET)
    public String step5() {
        return "/dailyReport/step5/carcareform";
    }

    /* click.js */
    @RequestMapping(value = "/carcareform/ajax/save", method = RequestMethod.POST)
    @ResponseBody
    public String tDriveSave(DailyReportStep5 dailyReportStep5){
        return step5Service.saveTDrive(dailyReportStep5);
    }

    @RequestMapping(value = "/carcareform/ajax/list", method = RequestMethod.POST)
    @ResponseBody
    public List<DailyReportStep5> tDriveList(String date) {
        return step5Service.findTDriveList(date);
    }

    @RequestMapping(value = "/carcareform/ajax/firstList", method = RequestMethod.GET)
    @ResponseBody
    public List<DailyReportStep5> tDriveList() {
        return step5Service.findFirstTDriveList();
    }

    @RequestMapping(value = "/carcareform/ajax/delete", method = RequestMethod.DELETE)
    @ResponseBody
    public void tDriveRemove(int driveID) {
        step5Service.removeTDrive(driveID);
    }

    /* param.js */
    @RequestMapping(value = "/carcareform/ajax/details", method = RequestMethod.POST)
    @ResponseBody
    public DailyReportStep5 tDriveDetails(int driveID) {
        return step5Service.findTDriveDetails(driveID);
    }
}
