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

    public Login getSessionLoginData() {
        return (Login) commonUtil.getSession().getAttribute("loginInfo");
    }

    public void saveTransPortInfo(DailyReportStep3Sub dailyReportStep3Sub){
        dailyReportStep3Sub.setSheetsubSS(Integer.parseInt(getSessionLoginData().getUuserID()));
        dailyReportStep3SubMapper.insertDailyReportSub(dailyReportStep3Sub);
    };

    //제출처, 운송정보 저장
    public void save(DailyReportStep3Main dailyReportStep3Main, DailyReportStep3Sub dailyReportStep3Sub) {
        dailyReportStep3Main.setCarNo(getSessionLoginData().getUserId());
        dailyReportStep3Main.setSheetSS(Integer.parseInt(getSessionLoginData().getUuserID()));

        DailyReportStep3Main carSubmitResult=dailyReportStep3MainMapper.findCarSubmitInfo(dailyReportStep3Main);
        if(null != carSubmitResult){
            dailyReportStep3Sub.setSheetID2(carSubmitResult.getSheetID());
            saveTransPortInfo(dailyReportStep3Sub);
        }else{
            dailyReportStep3Main.setSheetSS(Integer.parseInt(getSessionLoginData().getUuserID()));
            dailyReportStep3MainMapper.insertDailyReportMain(dailyReportStep3Main);

            dailyReportStep3Sub.setSheetID2(dailyReportStep3Main.getSheetID());
            saveTransPortInfo(dailyReportStep3Sub);
        }
    }

    //전체목록 조회
    public DailyReportStep3Main list(DailyReportStep3Main dailyReportStep3Main) {
        dailyReportStep3Main.setCarNo(getSessionLoginData().getUuserID());

        return dailyReportStep3MainMapper.findCarSubmitInfo(dailyReportStep3Main);
    }

    //Q.3개를 따로 만들 필요없나..?고민할것
    //제출처 카테고리 생성용
    public List<DailyReportStep3Main> searchByCarSubmit(DailyReportStep3Main dailyReportStep3Main) {
        return dailyReportStep3MainMapper.selectByCarSubmit(dailyReportStep3Main);
    }
    //제출처 연락처 카테고리 생성용
    public List<DailyReportStep3Main> searchByCarSubmitTel(DailyReportStep3Main dailyReportStep3Main) {
        return dailyReportStep3MainMapper.selectByCarSubmitTel(dailyReportStep3Main);
    }

    public List<DailyReportStep3Main> searchBySalesman(DailyReportStep3Main dailyReportStep3Main) {
        return dailyReportStep3MainMapper.selectBySalesman(dailyReportStep3Main);
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
