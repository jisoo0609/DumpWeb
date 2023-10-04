package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Sub;
import com.dispatch.dump.commonModule.db.dto.Login;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep3MainMapper;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep3SubMapper;
import com.dispatch.dump.commonModule.util.CommonUtil;
import javax.servlet.http.HttpSession;

import com.dispatch.dump.commonModule.util.FileUtil;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Step3Service {
    private final DailyReportStep3MainMapper dailyReportStep3MainMapper;
    private final DailyReportStep3SubMapper dailyReportStep3SubMapper;
    private final CommonUtil commonUtil;
    private final FileUtil fileUtil;

    public Login getSessionLoginData() {
        return (Login) commonUtil.getSession().getAttribute("loginInfo");
    }

    public void saveTransPortInfo(DailyReportStep3Sub dailyReportStep3Sub){
        dailyReportStep3Sub.setSheetsubSS(Integer.parseInt(getSessionLoginData().getUuserID()));
        dailyReportStep3SubMapper.insertTransportInfo(dailyReportStep3Sub);
    };

    //제출처, 운송정보 저장
    public void save(DailyReportStep3Main dailyReportStep3Main, DailyReportStep3Sub dailyReportStep3Sub) {
        dailyReportStep3Main.setCarNo(getSessionLoginData().getUserId());
        dailyReportStep3Main.setSheetSS(Integer.parseInt(getSessionLoginData().getUuserID()));

        DailyReportStep3Main carSubmitResult=dailyReportStep3MainMapper.findCarSubmitInfo(dailyReportStep3Main);
        if(null != carSubmitResult){
            System.out.println("find main Data.");
            dailyReportStep3Sub.setSheetID2(carSubmitResult.getSheetID());
            saveTransPortInfo(dailyReportStep3Sub);

        }else{
            System.out.println("not found main Data.");
            dailyReportStep3Main.setSheetSS(Integer.parseInt(getSessionLoginData().getUuserID()));
            dailyReportStep3MainMapper.insertCarSubmitInfo(dailyReportStep3Main);

            if (dailyReportStep3Main.getImageFile() != null) {
                fileUtil.fileUpload(dailyReportStep3Main.getImageFile());
            }
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
        return dailyReportStep3MainMapper.findByCarSubmit(dailyReportStep3Main);
    }
    //제출처 연락처 카테고리 생성용
    public List<DailyReportStep3Main> searchByCarSubmitTel(DailyReportStep3Main dailyReportStep3Main) {
        return dailyReportStep3MainMapper.findByCarSubmitTel(dailyReportStep3Main);
    }
    //영업사원 카테고리 생성용
    public List<DailyReportStep3Main> searchBySalesman(DailyReportStep3Main dailyReportStep3Main) {
        return dailyReportStep3MainMapper.findBySalesman(dailyReportStep3Main);
    }

    public DailyReportStep3Main findTCarSubmitDetails(int sheetID){
        return dailyReportStep3MainMapper.findBySheetIDForStep4(sheetID);
    }

    /*운송정보 수정*/
    
    public void edit(DailyReportStep3Sub dailyReportStep3Sub){
        Map<String, Object> rtnMap = commonUtil.returnMap();
        //유지보수를 위해 단계적으로 작성->리팩토링 예정
        int sheetsubID=dailyReportStep3Sub.getSheetsubID();

        int sheetID=dailyReportStep3SubMapper.findBySheetsubID(sheetsubID);
        boolean chk1=dailyReportStep3MainMapper.findBySheetID(sheetID);

        if(chk1==false){
            System.out.println("chk1은?"+chk1);
            int result=dailyReportStep3SubMapper.editByTransportInfo(dailyReportStep3Sub);
            System.out.println("result는?"+result);
        }
    }

    /*운송정보 삭제*/
    public void delete(int sheetsubID){
        //유지보수를 위해 단계적으로 작성->리팩토링 예정
        Map<String, Object> rtnMap = commonUtil.returnMap();//실패시 메세지 전송용
        int sheetID=dailyReportStep3SubMapper.findBySheetsubID(sheetsubID);
        boolean chk1=dailyReportStep3MainMapper.findBySheetID(sheetID);

        if(chk1==false){
            dailyReportStep3SubMapper.deleteByOne(sheetsubID);
        }else{
            rtnMap.put("httpcode", 500);
            rtnMap.put("httpcode", 500);
        }
    }
}
