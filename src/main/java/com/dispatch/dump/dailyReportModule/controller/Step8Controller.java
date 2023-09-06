package com.dispatch.dump.dailyReportModule.controller;

import com.dispatch.dump.dailyReportModule.service.DailyReportService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step8Controller {

    private final DailyReportService dailyReportService;

}
