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
        List<DailyReportStep8> ReceiptsDataList = dailyReportStep8Mapper.getAllReceiptsWithCnt(getSessionLoginData().getUserId());

//        Summary summary = new Summary(0, 0, 0, new Date());
//        ReceiptsDataList.stream().forEach(t -> summary.setTotalTransportationCost(summary.getTotalTransportationCost() + t.getQty() * t.getQtyup()));
//        log.info("총운반비용 : " + summary.getTotalTransportationCost());
        for (DailyReportStep8 x : ReceiptsDataList) {
            System.out.println(x);
        }
        return ReceiptsDataList;
    }

    public String searchReceipts(DailyReportStep8 dailyReportStep8) {

        Map<String, Object> searchReceiptsMap = commonUtil.returnMap();

        try {

            System.out.println("상차지는?" + dailyReportStep8.getFromsite());
            System.out.println("Carno?" + dailyReportStep8.getCarNo());
            dailyReportStep8.setCarSubmitTel(getSessionLoginData().getUserId());
            List<DailyReportStep8> receiptsSearchList = dailyReportStep8Mapper.receiptsSearchConditionWithCnt(dailyReportStep8);
            System.out.println("receiptsSearchList?" + receiptsSearchList);

           // receiptsSearchList.add(dailyReportStep8Mapper.)
            searchReceiptsMap.put("httpCode", 200);
            searchReceiptsMap.put("receiptsSearchList", receiptsSearchList);

        } catch (Exception e) {
            log.error("Exception[" + e.getMessage() + "]");
        }
        return commonUtil.jsonFormatTransfer(searchReceiptsMap);  //스트링으로 변환해줌
    }

//    public List<DailyReportStep8> getReceipts() {
//
//        HttpSession session = commonUtil.getSession();
//        Login loginData = (Login) session.getAttribute("loginInfo");
//
//        List<DailyReportStep8> ReceiptsDataList = new ArrayList<>();
//        ReceiptsDataList = dailyReportStep8Mapper.searchReceipts(loginData.getUserId());
//
//        Summary summary = new Summary(0, 0, 0, new Date());
//        ReceiptsDataList.stream().forEach(t -> summary.setTotalTransportationCost(summary.getTotalTransportationCost() + t.getQty() * t.getQtyup()));
//
//        for (DailyReportStep8 x : ReceiptsDataList) {
//            System.out.println(x);
//        }
//        System.out.println(summary.getTotalTransportationCost());
//
//        return ReceiptsDataList;
//    }

//    public List<DailyReportStep8Main> getTsheet() {
//        //1. login 정보 받아오기.
//        HttpSession session = commonUtil.getSession();
//        Login loginData = (Login) session.getAttribute("loginInfo");
//
//        //2. login id와 tsheet의 CarSubmitTel이 똑같은 튜플 값을 tSheet에서 가져옴.
//        List<DailyReportStep8Main> tSheet = new ArrayList<>();
//        tSheet = dailyReportStep8Mapper.searchReceiptsMainByCarSubmitTel(loginData.getUserId());
//        return tSheet;
//    }


    //    public List<DailyReportStep8Sub> getTsheetSub() {
//        // 가져온 튜플의 sheetID와 tSheetSub의 sheetID2가 똑같은 튜플 값을 tSheetSub에 넣어줌
//        List<DailyReportStep8Sub> tSheetSub = new ArrayList<>();
//        this.getTsheet().stream().forEach(t -> tSheetSub.add(dailyReportStep8Mapper.searchReceiptsMainBySheetID2(t.getSheetID())));
//
//        // tSheetSub에서 Qty와 QtyUp을 연산하고 누적값을 summaryDAO의 총 운반 금액(setTotalTransportationCost)에 저장.
//        Summary summary = new Summary(0, 0, 0, new Date());
//        tSheetSub.stream().forEach(t -> summary.setTotalTransportationCost(summary.getTotalTransportationCost() + t.getQty() * t.getQtyup()));
//
//        System.out.println(summary.getTotalTransportationCost());
//        return tSheetSub;
//    }


//    public List<DailyReportStep8Sub> getSummary() {
//        //1. login 정보 받아오기.
//        HttpSession session = commonUtil.getSession();
//        Login loginData = (Login) session.getAttribute("loginInfo");
//
//        //2. login id와 tsheet의 CarSubmitTel이 똑같은 튜플 값을 tSheet에서 가져옴.
//        List<DailyReportStep8Main> tSheet = new ArrayList<>();
//        tSheet = dailyReportStep8Mapper.searchReceiptsMainByCarSubmitTel(loginData.getUserId());
//
//        //3. 가져온 튜플의 sheetID와 tSheetSub의 sheetID2가 똑같은 튜플 값을 tSheetSub에서 가져옴
//        List<DailyReportStep8Sub> tSheetSub = new ArrayList<>();
//        tSheet.stream().forEach(t -> tSheetSub.add(dailyReportStep8Mapper.searchReceiptsMainBySheetID2(t.getSheetID())));
//
//        //4. tSheetSub에서 Qty와 QtyUp을 연산하고 누적값을 summaryDAO의 총 운반 금액(setTotalTransportationCost)에 저장.
//        Summary summary = new Summary(0, 0, 0, new Date());
//        tSheetSub.stream().forEach(t -> summary.setTotalTransportationCost(summary.getTotalTransportationCost() + t.getQty() * t.getQtyup()));
//
//        System.out.println(summary.getTotalTransportationCost());
//
//        return tSheetSub;
//    }


}
