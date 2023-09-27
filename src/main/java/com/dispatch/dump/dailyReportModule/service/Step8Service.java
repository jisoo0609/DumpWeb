package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.*;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep8Mapper;


import com.dispatch.dump.commonModule.util.CommonUtil;

import javax.servlet.http.HttpSession;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Step8Service {
    private final DailyReportStep8Mapper dailyReportStep8Mapper;
    private final CommonUtil commonUtil;
    private final Logger log = LoggerFactory.getLogger(this.getClass());


    public Login getSessionLoginData() {
        return (Login) commonUtil.getSession().getAttribute("loginInfo");
    }

    public List<DailyReportStep8> getAllReceipts() {
        List<DailyReportStep8> ReceiptsDataList = dailyReportStep8Mapper.getAllReceipts(getSessionLoginData().getUserId());

//        Summary summary = new Summary(0, 0, 0, new Date());
//        ReceiptsDataList.stream().forEach(t -> summary.setTotalTransportationCost(summary.getTotalTransportationCost() + t.getQty() * t.getQtyup()));
//        log.info("총운반비용 : " + summary.getTotalTransportationCost());
        for (DailyReportStep8 x : ReceiptsDataList) {
            System.out.println(x);
        }
        return ReceiptsDataList;
    }

    public String searchReceipts(DailyReportStep8OptionForm dailyReportStep8OptionForm) {

        Map<String, Object> searchReceiptsMap = commonUtil.returnMap();

        try {
            dailyReportStep8OptionForm.setCarSubmitTel(getSessionLoginData().getUserId());
            List<DailyReportStep8> receiptsSearchList;
            if (dailyReportStep8OptionForm.getSearchType().equals("orderByDate") ) {
                receiptsSearchList = dailyReportStep8Mapper.receiptsSearchOrderByDate(dailyReportStep8OptionForm);
            } else {
                receiptsSearchList = dailyReportStep8Mapper.receiptsSearchOrderByCarNo(dailyReportStep8OptionForm);
            }

            searchReceiptsMap.put("httpCode", 200);
            searchReceiptsMap.put("receiptsSearchList", receiptsSearchList);


        } catch (Exception e) {
            log.error("Exception[" + e.getMessage() + "]");
        }
        return commonUtil.jsonFormatTransfer(searchReceiptsMap);  //스트링으로 변환해줌
    }
}
