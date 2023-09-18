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
            DailyReportStep3Main carSubmitTelResult=dailyReportStep3MainMapper.findBycarSubmitTel(dailyReportStep3Main);

            //제출처 정보가 조회된게 없다면 
            if (carSubmitTelResult == null) {
                //제출처 정보 등록
                dailyReportStep3MainMapper.insertDailyReportMain(dailyReportStep3Main);
                //위에서 등록한 idx를 등록하기(mapper에 selectKey로 등록해둠)
                dailyReportStep3Sub.setSheetID2(dailyReportStep3Main.getSheetID());
                //dailyReportSub
                dailyReportStep3SubMapper.insertDailyReportSub(dailyReportStep3Sub);
                rtnMap.put("httpCode", 200);

            //제출처 정보가 조회된게 있다면
            } else  {
                //조회된 정보 불러와서 채우기
                rtnMap.put("carSubmitTelResult", carSubmitTelResult);
                //제출처 정보 조회 성공 코드 전달-->나중에 없애기
                rtnMap.put("httpCode", 100);
                //carSubmitTelResult 정보로 다시 select해서 sheetID 가져온뒤 insert하기
                dailyReportStep3Sub.setSheetID2(carSubmitTelResult.getSheetID());
                dailyReportStep3SubMapper.insertDailyReportSub(dailyReportStep3Sub);
            }

        } catch (Exception e) {
            log.error("Exception["+ e.getMessage() +"]");
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    /*제출처 정보만 저장*/
    public String save(DailyReportStep3Main dailyReportStep3Main) {
        Map<String, Object> rtnMap = commonUtil.returnMap();
        HttpSession session = commonUtil.getSession();

        try {
            Login loginData = (Login) session.getAttribute("loginInfo");
            dailyReportStep3Main.setCarNo(loginData.getUserId());
            DailyReportStep3Main carSubmitTelResult=dailyReportStep3MainMapper.findBycarSubmitTel(dailyReportStep3Main);

            //제출처 정보가 조회된 게 없다면
            if (carSubmitTelResult == null) {
                //신규 제출처 등록
                dailyReportStep3MainMapper.insertDailyReportMain(dailyReportStep3Main);
                //SMS 발송

                //제출처 정보 등록 성공 코드 전달
                rtnMap.put("httpCode", 200);
            //제출처 정보가 조회된 게 있다면
            } else  {
                //조회된 정보 불러와서 채우기
                rtnMap.put("carSubmitTelResult", carSubmitTelResult);
                //제출처 정보 등록 성공 코드 전달
                rtnMap.put("httpCode", 100);
            }
        } catch (Exception e) {
            log.error("Exception["+ e.getMessage() +"]");
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    /*운송정보만 저장*/
    public String save(DailyReportStep3Sub dailyReportStep3Sub){
        HttpSession session=commonUtil.getSession();

        try {
            dailyReportStep3SubMapper.insertDailyReportSub(dailyReportStep3Sub);

        }catch (Exception e){
            log.error("Exception["+ e.getMessage() +"]");
        }
        return null;
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

    public String list(Model model, DailyReportStep3Main dailyReportStep3Main) {
        HttpSession session = commonUtil.getSession();

        try {
            Login loginData = (Login) session.getAttribute("loginInfo");
            dailyReportStep3Main.setCarNo(loginData.getUserId());

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

}
