package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.*;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep7Mapper;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep7MainMapper;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep7SubMapper;
import com.dispatch.dump.commonModule.db.mapper.LoginMapper;
import com.dispatch.dump.commonModule.util.CommonUtil;
import lombok.RequiredArgsConstructor;
import org.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Step7Service {

    private final CommonUtil commonUtil;
    private final DailyReportStep7MainMapper dailyReportStep7MainMapper;
    private final DailyReportStep7SubMapper dailyReportStep7SubMapper;
    private final DailyReportStep7Mapper step7Mapper;
    private final Logger log = LoggerFactory.getLogger(this.getClass());
    private final LoginMapper loginMapper;

    public Login getSessionLoginData() {
        return (Login) commonUtil.getSession().getAttribute("loginInfo");
    }

    //제출처 주문 정보 저장
    public String saveOrder(DailyReportStep7Main dailyReportStep7Main, DailyReportStep7Sub dailyReportStep7Sub) {

        Map<String, Object> rtnMap = commonUtil.returnMap();
        HttpSession session = commonUtil.getSession();

        try {

            Login loginData = (Login) session.getAttribute("loginInfo");

            dailyReportStep7Main.setCarSubmit(String.valueOf(getSessionLoginData().getUserSS()));
            dailyReportStep7Main.setCarSubmitTel(String.valueOf(getSessionLoginData().getUserTel()));
            dailyReportStep7Main.setSalesman(String.valueOf(getSessionLoginData().getUserName()));
            //결재 체크 값
//            dailyReportStep7Main.setSheetSS(Integer.parseInt(loginData.getUserId()));
            dailyReportStep7Main.setSheetSS2(Integer.parseInt(loginData.getUuserID()));
            dailyReportStep7Main.setWriterIDX(Integer.parseInt(loginData.getUuserID()));
            //writerIDX

            if (dailyReportStep7Sub.getSheetsubID() == 0) {
                dailyReportStep7MainMapper.insertDailyReportStep7(dailyReportStep7Main);
                dailyReportStep7Sub.setSheetID2(dailyReportStep7Main.getSheetID());
                dailyReportStep7Sub.setSheetsubSS2(Integer.parseInt(loginData.getUuserID()));
                dailyReportStep7Sub.setWriteridx2(Integer.parseInt(loginData.getUuserID()));
            }


            System.out.println(dailyReportStep7Sub.getSheetsubID());
            System.out.println(dailyReportStep7Sub.getSheetID2());

            if (dailyReportStep7Sub.getSheetsubID() == 0) {
                dailyReportStep7SubMapper.insertDailyReportStep7sub(dailyReportStep7Sub);
            }
            else{
                System.out.println("확인용 : "+dailyReportStep7Sub);
                dailyReportStep7SubMapper.editSubmitInfo(dailyReportStep7Sub);
                dailyReportStep7MainMapper.editTsheet(dailyReportStep7Sub);
            }
            rtnMap.put("httpCode", 200);

        } catch (Exception e) {
            log.error("Exception[" + e.getMessage() + "]");
        }
        return commonUtil.jsonFormatTransfer(rtnMap);

    }

    //오늘 날짜 받기
    public String getToday() {
        //SimpleDateFormat 객체 생성하여 날짜 포맷 설정
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
        //현재 시스템 시간을 기반으로 Date 객체 생성
        Date date = new Date(System.currentTimeMillis());


        //Date 객체를 SimpleDateFormat을 사용하여
        //"yyyy-MM-dd" 형식의 문자열로 변환하여 반환
        return formatter.format(date);
    }

    //제출처 주문 정보 조회
    public List<DailyReportStep7Sub> searchOrderList(DailyReportStep7Main dailyReportStep7Main) {
        System.out.println(dailyReportStep7Main);
        System.out.println(getSessionLoginData().getUuserID());
        System.out.println(dailyReportStep7MainMapper.selectReceptionList(getSessionLoginData().getUuserID(), dailyReportStep7Main.getDate()));
        return dailyReportStep7MainMapper.selectReceptionList(getSessionLoginData().getUuserID(), dailyReportStep7Main.getDate());
    }

    public Login findByUserInfo(Login login) {
        return loginMapper.findAdvUserInfo(login);
    }


    /*운송정보 삭제*/
    public String delete(DailyReportStep7Sub dailyReportStep7Sub) {

        dailyReportStep7SubMapper.deleteByOne(dailyReportStep7Sub);

        /*Map<String, Object> rtnMap = commonUtil.returnMap();
        int sheetID = dailyReportStep7SubMapper.findBySheetsubID(dailyReportStep7Sub.getSheetsubID());
        DailyReportStep7Main dailyReportStep7Main = dailyReportStep7MainMapper.findByChkInfo(sheetID);
        if (dailyReportStep7Main.isChk1() == false && dailyReportStep7Main.isChk2() == false) {
            Login login = new Login();
            login.setUserId(getSessionLoginData().getUserId());
            Login loginInfo = findByUserInfo(login);
            if (loginInfo.getUserPosition().equals("manager")) {
                dailyReportStep7SubMapper.deleteByOne(dailyReportStep7Sub);
                rtnMap.put("httpCode", 200);
            }
        } else {
            rtnMap.put("httpCode", 422);
        }*/
        //return commonUtil.jsonFormatTransfer(rtnMap);

        return "제거 완료";
    }

    public String saveCarData(DailyReportStep7CarNo dailyReportStep7CarNo) {
        Map<String, Object> rtnMap = commonUtil.returnMap();
        try {
            HttpSession session = commonUtil.getSession();
            Login loginData = (Login) session.getAttribute("loginInfo");

            dailyReportStep7CarNo.setCarNoSS2(Integer.parseInt(loginData.getUuserID()));

            step7Mapper.insertCarData(dailyReportStep7CarNo);

            rtnMap.put("httpCode", 200);
        } catch (Exception e) {
            log.error("Exception [" + e.getMessage() + "]");
        }


        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    public void carNoList(Model model) {
        model.addAttribute("carNoList", step7Mapper.findCarNoList());
    }

    public String driverList() {
        Map<String, Object> rtnMap = commonUtil.returnMap();
        try {
            HttpSession session = commonUtil.getSession();
            Login loginData = (Login) session.getAttribute("loginInfo");
            DailyReportStep7CarNo dailyReportStep7CarNo = new DailyReportStep7CarNo();
            dailyReportStep7CarNo.setCarNoSS2(Integer.parseInt(loginData.getUuserID()));
            rtnMap.put("driverList", step7Mapper.findCarNoByLoginData(dailyReportStep7CarNo));
            rtnMap.put("httpCode", 200);
        } catch (Exception e) {
            log.error("Exception [" + e.getMessage() + "]");
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    public DailyReportStep7Sub findSheetSubDetails(int sheetsubID) {
        return dailyReportStep7SubMapper.findSubInfoBySheetSubID(sheetsubID);
    }



    /*
    *   FUNCTION :: 미지정 배차정보 저장
    * */
    @Transactional
    public String saveDispatchData(int parentID, String dispatchDataList) {
        Map<String, Object> rtnMap = commonUtil.returnMap();
        try {
            DailyReportStep7Sub dailyReportStep7Sub = dailyReportStep7SubMapper.findSubInfoBySheetSubID(parentID);
            int dispatchQty = 0;


            if (dispatchDataList != null && !dispatchDataList.equals("")) {
                JSONArray jsonArray = new JSONArray(dispatchDataList);

                for (Object o : jsonArray) {
                    DailyReportStep7CarNo dispatchData = commonUtil.jsonToObject(o.toString(), DailyReportStep7CarNo.class);
                    dispatchData.setParentID(dailyReportStep7Sub.getSheetID2());
                    dispatchData.setSubID(dailyReportStep7Sub.getSheetsubID());
                    step7Mapper.autoDispatchData(dispatchData);
                    step7Mapper.autoDispatchSubDataSub(dispatchData);
                    log.info(dispatchData.toString());
                    dispatchQty += dispatchData.getCarQty();

                }

                log.info("total Dispatch: " + dispatchQty);

                dailyReportStep7Sub.setQty(dispatchQty);
                step7Mapper.updateQtyParentsData(dailyReportStep7Sub);

                rtnMap.put("httpCode", 200);
            }
        } catch (Exception e) {
            log.error("Exception [" + e.getMessage() + "]");
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }


    /*
    * FUNCTION :: 계정등록 여부 확인
    * */
    public String MemberChk(DailyReportStep7CarNo dailyReportStep7CarNo) {
        Map<String, Object> rtnMap = commonUtil.returnMap();

        try {
            DailyReportStep7CarNo memberChk = step7Mapper.findMemberChkByUserId(dailyReportStep7CarNo);
            rtnMap.put("memberChk", memberChk);
            rtnMap.put("httpCode", 200);
        } catch (Exception e) {
            log.error("Exception [" + e.getMessage() + "]");
        }

        return commonUtil.jsonFormatTransfer(rtnMap);
    }

}
