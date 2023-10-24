package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Sub;
import com.dispatch.dump.commonModule.db.dto.Login;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep3MainMapper;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep3SubMapper;
import com.dispatch.dump.commonModule.db.mapper.LoginMapper;
import com.dispatch.dump.commonModule.util.CommonUtil;
import com.dispatch.dump.commonModule.util.FileUtil;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class Step3Service {
    private final DailyReportStep3MainMapper dailyReportStep3MainMapper;
    private final DailyReportStep3SubMapper dailyReportStep3SubMapper;
    private final LoginMapper loginMapper;
    private final CommonUtil commonUtil;
    private final FileUtil fileUtil;

    public Login getSessionLoginData() {
        return (Login) commonUtil.getSession().getAttribute("loginInfo");
    }

    public void saveTransPortInfo(DailyReportStep3Sub dailyReportStep3Sub){
        dailyReportStep3Sub.setSheetsubSS(Integer.parseInt(getSessionLoginData().getUuserID()));
        dailyReportStep3Sub.setWriteridx2(Integer.parseInt(getSessionLoginData().getUuserID()));
        System.out.println("Writeridx2는?"+dailyReportStep3Sub.getWriteridx2());
        dailyReportStep3SubMapper.insertTransportInfo(dailyReportStep3Sub);
    };

    public Login findByUserInfo(Login login) {
        return loginMapper.findAdvUserInfo(login);
    }
    
    //제출처, 운송정보 저장
    public void save(DailyReportStep3Main dailyReportStep3Main, DailyReportStep3Sub dailyReportStep3Sub) {
        dailyReportStep3Main.setCarNo(getSessionLoginData().getUserId());
        dailyReportStep3Main.setSheetSS(Integer.parseInt(getSessionLoginData().getUuserID()));
        dailyReportStep3Main.setWriterIDX(Integer.parseInt(getSessionLoginData().getUuserID()));
        dailyReportStep3Sub.setSheetsubSS(Integer.parseInt(getSessionLoginData().getUuserID()));
        dailyReportStep3Sub.setWriteridx2(Integer.parseInt(getSessionLoginData().getUuserID()));

        Login login=new Login();
        login.setUserId(dailyReportStep3Main.getCarSubmitTel());
        
        Login userInfo=findByUserInfo(login);
        if(userInfo!=null){
            dailyReportStep3Main.setSheetSS2(Integer.parseInt(userInfo.getUuserID()));
            dailyReportStep3Sub.setSheetsubSS2(Integer.parseInt(userInfo.getUuserID()));
            dailyReportStep3MainMapper.insertCarSubmitInfo(dailyReportStep3Main);

            if (dailyReportStep3Main.getImageFile() != null) {
                fileUtil.fileUpload(dailyReportStep3Main.getImageFile(), dailyReportStep3Main.getSheetID());
            }
            dailyReportStep3Sub.setSheetID2(dailyReportStep3Main.getSheetID());
            saveTransPortInfo(dailyReportStep3Sub);
        }else{
            dailyReportStep3MainMapper.insertCarSubmitInfo(dailyReportStep3Main);

            if (dailyReportStep3Main.getImageFile() != null) {
                fileUtil.fileUpload(dailyReportStep3Main.getImageFile(), dailyReportStep3Main.getSheetID());
            }
            dailyReportStep3Sub.setSheetID2(dailyReportStep3Main.getSheetID());
            saveTransPortInfo(dailyReportStep3Sub);
        }
    }
    
    //운송정보 조회
    public List<DailyReportStep3Sub> list(DailyReportStep3Main dailyReportStep3Main) {
        String CarNo=dailyReportStep3MainMapper.findByCarNo(dailyReportStep3Main.getSheetID());
        dailyReportStep3Main.setCarNo(CarNo);

        Login login= new Login();
        login.setUserId(getSessionLoginData().getUserId());
        Login loginInfo=findByUserInfo(login);

        List<DailyReportStep3Sub> resultData=null;
        if(loginInfo.getUserPosition().equals("driver")){
            dailyReportStep3Main.setSheetSS(Integer.parseInt(getSessionLoginData().getUuserID()));
            resultData=dailyReportStep3SubMapper.selectAll(dailyReportStep3Main);
        }else if(loginInfo.getUserPosition().equals("manager")){
            dailyReportStep3Main.setSheetSS2(Integer.parseInt(getSessionLoginData().getUuserID()));
            resultData=dailyReportStep3SubMapper.selectAll2(dailyReportStep3Main);
        }
        return resultData;
    }

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

    //제출처 정보 조회(sheetID)
    public DailyReportStep3Main findByCarSubmitInfo(DailyReportStep3Main dailyReportStep3Main){
        int sheetID=dailyReportStep3Main.getSheetID();

        //기사일때와 제출처일때 분리
        Login login= new Login();
        login.setUserId(getSessionLoginData().getUserId());
        Login loginInfo=findByUserInfo(login);

        DailyReportStep3Main resultData=null;
        if(loginInfo.getUserPosition().equals("driver")){
            //dailyReportStep3Main.setSheetSS(Integer.parseInt(getSessionLoginData().getUuserID()));
            //resultData=dailyReportStep3MainMapper.selectAll(dailyReportStep3Main);
        }else if(loginInfo.getUserPosition().equals("manager")){
            resultData=dailyReportStep3MainMapper.findBySheetIDForStep8(sheetID);
        }
        return resultData;
    }

    public DailyReportStep3Main findTCarSubmitDetails(int sheetID){
        return dailyReportStep3MainMapper.findBySheetIDForStep4(sheetID);
    }

    /*제출처 정보 수정*/
    public String editByCarSubmit(DailyReportStep3Main dailyReportStep3Main){
        Map<String, Object> rtnMap = commonUtil.returnMap();
        dailyReportStep3Main.setSheetSS(Integer.parseInt(getSessionLoginData().getUuserID()));
        System.out.println("SheetID는?"+dailyReportStep3Main.getSheetID());
        int result=dailyReportStep3MainMapper.editByCarSubmit(dailyReportStep3Main);

        if (result > 0) {
            rtnMap.put("httpCode", 200);
        } else {
            rtnMap.put("httpCode", 422);
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    /*운송정보 수정*/
    public String edit(DailyReportStep3Sub dailyReportStep3Sub){
        Map<String, Object> rtnMap = commonUtil.returnMap();
        int sheetsubID=dailyReportStep3Sub.getSheetsubID();

        int sheetID=dailyReportStep3SubMapper.findBySheetsubID(sheetsubID);
        DailyReportStep3Main dailyReportStep3Main=dailyReportStep3MainMapper.findByChkInfo(sheetID);
        dailyReportStep3Main.setSheetID(sheetID);
        dailyReportStep3Main.setWriterIDX(Integer.parseInt(getSessionLoginData().getUuserID()));

        if(dailyReportStep3Main.isChk1()==false&&dailyReportStep3Main.isChk2()==false){
            Login login= new Login();
            login.setUserId(getSessionLoginData().getUserId());
            Login loginInfo=findByUserInfo(login);
            if(loginInfo.getUserPosition().equals("driver")){
                dailyReportStep3Sub.setWriteridx2(Integer.parseInt(getSessionLoginData().getUuserID()));
                dailyReportStep3SubMapper.editByTransportInfo(dailyReportStep3Sub);
                //상위테이블의 writerIDX도 같이 수정해주기 -- 여기가 안됨
                dailyReportStep3MainMapper.editByWriterIDX(dailyReportStep3Main);
                rtnMap.put("httpCode", 200);
            }
        }else{
            rtnMap.put("httpCode",422);
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    /*운송정보 삭제*/
    public String delete(DailyReportStep3Sub dailyReportStep3Sub){
        Map<String, Object> rtnMap = commonUtil.returnMap();
        int sheetID=dailyReportStep3SubMapper.findBySheetsubID(dailyReportStep3Sub.getSheetsubID());
        DailyReportStep3Main dailyReportStep3Main=dailyReportStep3MainMapper.findByChkInfo(sheetID);
        if(dailyReportStep3Main.isChk1()==false&&dailyReportStep3Main.isChk2()==false){
            Login login= new Login();
            login.setUserId(getSessionLoginData().getUserId());
            Login loginInfo=findByUserInfo(login);
            if(loginInfo.getUserPosition().equals("driver")){
                dailyReportStep3SubMapper.deleteByOne(dailyReportStep3Sub);
                rtnMap.put("httpCode", 200);
            }
        }else{
            rtnMap.put("httpCode", 422);
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    /*전체삭제*/
    public void deleteAll(DailyReportStep3Main dailyReportStep3Main){
         int result=dailyReportStep3SubMapper.deleteByTransInfo(dailyReportStep3Main);
            if(result>0){
                dailyReportStep3MainMapper.deleteByCarsubmitInfo(dailyReportStep3Main);
            }
    }

}


