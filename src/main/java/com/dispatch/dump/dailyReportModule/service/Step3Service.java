package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Sub;
import com.dispatch.dump.commonModule.db.dto.Login;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep3MainMapper;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep3SubMapper;
import com.dispatch.dump.commonModule.util.CommonUtil;
import javax.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Step3Service {
    private final DailyReportStep3MainMapper dailyReportStep3MainMapper;
    private final DailyReportStep3SubMapper dailyReportStep3SubMapper;
    private final CommonUtil commonUtil;
    private final Logger log = LoggerFactory.getLogger(this.getClass());

    //제출처(상위테이블), 상하차정보(하위테이블) 동시 저장
    public String save(DailyReportStep3Main dailyReportStep3Main, DailyReportStep3Sub dailyReportStep3Sub) {
        Map<String, Object> rtnMap = commonUtil.returnMap();
        HttpSession session = commonUtil.getSession();

        try {
            Login loginData = (Login) session.getAttribute("loginInfo");
            dailyReportStep3Main.setCarNo(loginData.getUserId());

            //상위 테이블 등록
            //user idx 저장
            dailyReportStep3Main.setSheetSS(Integer.parseInt(loginData.getUuserID()));
            dailyReportStep3MainMapper.insertDailyReportMain(dailyReportStep3Main);
            
            //상위 table의 idx를 저장
            dailyReportStep3Sub.setSheetID2(dailyReportStep3Main.getSheetID());
            //user idx 저장
            dailyReportStep3Sub.setSheetsubSS(Integer.parseInt(loginData.getUuserID()));
            dailyReportStep3SubMapper.insertDailyReportSub(dailyReportStep3Sub);
            rtnMap.put("httpCode", 200);
        } catch (Exception e) {
            log.error("Exception["+ e.getMessage() +"]");
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    /*제출처 검색 목록 조회*/
    public String search(DailyReportStep3Main dailyReportStep3Main) {
        Map<String, Object> rtnMap = commonUtil.returnMap();

        try {
            List<DailyReportStep3Main> searchList=dailyReportStep3MainMapper.findCarsubmitList(dailyReportStep3Main);

            rtnMap.put("httpCode", 200);
            rtnMap.put("searchList", searchList);
        } catch (Exception e) {
            log.error("Exception["+ e.getMessage() +"]");
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    public String searchByCarSubmit(DailyReportStep3Main dailyReportStep3Main) {
        Map<String, Object> rtnMap = commonUtil.returnMap();

        try {
            List<DailyReportStep3Main> carSubmitList=dailyReportStep3MainMapper.selectByCarSubmit(dailyReportStep3Main);

            rtnMap.put("httpCode", 200);
            rtnMap.put("carSubmitList", carSubmitList);
        } catch (Exception e) {
            log.error("Exception["+ e.getMessage() +"]");
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    public String searchByCarSubmitTel(DailyReportStep3Main dailyReportStep3Main) {
        Map<String, Object> rtnMap = commonUtil.returnMap();

        try {
            List<DailyReportStep3Main> carSubmitTelList=dailyReportStep3MainMapper.selectByCarSubmitTel(dailyReportStep3Main);

            rtnMap.put("httpCode", 200);
            rtnMap.put("carSubmitTelList", carSubmitTelList);
        } catch (Exception e) {
            log.error("Exception["+ e.getMessage() +"]");
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    public String searchBySalesman(DailyReportStep3Main dailyReportStep3Main) {
        Map<String, Object> rtnMap = commonUtil.returnMap();

        try {
            List<DailyReportStep3Main> salesmanList=dailyReportStep3MainMapper.selectBySalesman(dailyReportStep3Main);

            rtnMap.put("httpCode", 200);
            rtnMap.put("salesmanList", salesmanList);
        } catch (Exception e) {
            log.error("Exception["+ e.getMessage() +"]");
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    public String list(Model model, DailyReportStep3Main dailyReportStep3Main) {
        HttpSession session = commonUtil.getSession();

        try {
            Login loginData = (Login) session.getAttribute("loginInfo");
            dailyReportStep3Main.setCarNo(loginData.getUserId());
            dailyReportStep3Main.setSheetSS(Integer.parseInt(loginData.getUserSS()));

            log.info("CarNo는?"+dailyReportStep3Main.getCarNo());
            log.info("SheetID?"+dailyReportStep3Main.getSheetID());

            DailyReportStep3Main DailyReportList = dailyReportStep3MainMapper.findDailyReportMainList(dailyReportStep3Main);
            System.out.println(DailyReportList);

            model.addAttribute("list", DailyReportList);
        } catch (Exception e) {
            log.error("Exception["+ e.getMessage() +"]");
        }
        return "/dailyReport/form";
    }
    
    /*삭제*/
    public void delete(int sheetsubID){
        //우선 작성
        //join 쿼리를 직접 작성/단계적으로 처리 둘 중 뭐가 나은지 확인하고 선택하여 진행
        //1)넘겨 받은 idx로 tSheet_sub를 select해서 sheetID2를 가져온다
        int sheetID=dailyReportStep3SubMapper.selectBySheetSubID(sheetsubID);
        //2) sheetID2로 tSheet를 조회해서 chk1을 확인한다
        boolean chk1=dailyReportStep3MainMapper.selectBySheetID(sheetID);
        //3) chk1값이 0이면 삭제, 1이면 삭제 X
        if(chk1==false){
            dailyReportStep3SubMapper.deleteByOne(sheetsubID);
        }else{
            //삭제 불가능 메세지 보내기
        }
    }
}
