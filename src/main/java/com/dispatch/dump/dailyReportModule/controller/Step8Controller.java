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

@Controller
@RequestMapping("/dailyReport")
@RequiredArgsConstructor
public class Step8Controller {

    private final Step8Service step8Service;


    @RequestMapping(value = "/receipts", method = RequestMethod.GET)
    public String step8(Model model, DailyReportStep8 dailyReportStep8) {
        model.addAttribute("receiptsList", step8Service.getAllReceipts());
        return "/dailyReport/step8/receipts";
    }
    @RequestMapping(value = "/receipts", method = RequestMethod.POST)
    @ResponseBody
    public String searchReceipts(DailyReportStep8OptionForm dailyReportStep8OptionForm){
        return step8Service.searchReceipts(dailyReportStep8OptionForm);
    }




    //    @GetMapping("/receipts")
//    public ModelAndView getAllReceipts(DailyReportStep8 dailyReportStep8) {
//        ModelAndView modelAndView = new ModelAndView("/dailyReport/step8/receipts");
////        List<DailyReportStep8> receiptsList = step8Service.getReceipts();
//
//        modelAndView.addObject("receiptsList", step8Service.getAllReceipts(dailyReportStep8));
//        return modelAndView;
//    }

//    @RequestMapping(value = "/receipts", method = RequestMethod.GET)
//    @ModelAttribute("receiptsList")
//    public List<DailyReportStep8Sub> getReceiptsList() {
//        List<DailyReportStep8Sub> receiptsList = step8Service.getSummary();
//        return receiptsList;
//    }


}
