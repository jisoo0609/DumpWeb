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
import org.springframework.transaction.annotation.Transactional;

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

            DailyReportStep3Main carSubmitResult=dailyReportStep3MainMapper.findCarSubmitInfo(dailyReportStep3Main);
            if(carSubmitResult!=null){
                //sheetSS2와 sheetsubSS2 update-> 회원가입할때 SS2를 update하는 과정을 거친다면 필요없음
                //dailyReportStep3MainMapper.editBySheetSS2(dailyReportStep3Main);
                //dailyReportStep3SubMapper.editBySheetsubSS2(dailyReportStep3Sub);

                System.out.println("find main Data.");
                dailyReportStep3Sub.setSheetID2(carSubmitResult.getSheetID());
                saveTransPortInfo(dailyReportStep3Sub);
            }else{
                System.out.println("not found main Data.");
                dailyReportStep3Main.setSheetSS(Integer.parseInt(getSessionLoginData().getUuserID()));
                dailyReportStep3Main.setCarSubmit(userInfo.getUserSS());
                dailyReportStep3Main.setCarSubmitTel(userInfo.getUserTel());
                dailyReportStep3Main.setSalesman(userInfo.getUserName());

                dailyReportStep3MainMapper.insertCarSubmitInfo(dailyReportStep3Main);

                if (dailyReportStep3Main.getImageFile() != null) {
                    fileUtil.fileUpload(dailyReportStep3Main.getImageFile(), dailyReportStep3Main.getSheetID());
                }
                dailyReportStep3Sub.setSheetID2(dailyReportStep3Main.getSheetID());
                saveTransPortInfo(dailyReportStep3Sub);
            }
        }else{
            DailyReportStep3Main carSubmitResult=dailyReportStep3MainMapper.findCarSubmitInfo(dailyReportStep3Main);
            if(carSubmitResult!=null){
                System.out.println("find main Data.");
                dailyReportStep3Sub.setSheetID2(carSubmitResult.getSheetID());
                saveTransPortInfo(dailyReportStep3Sub);
            }else{
                System.out.println("not found main Data.");
                dailyReportStep3Main.setSheetSS(Integer.parseInt(getSessionLoginData().getUuserID()));
                dailyReportStep3MainMapper.insertCarSubmitInfo(dailyReportStep3Main);

                if (dailyReportStep3Main.getImageFile() != null) {
                    fileUtil.fileUpload(dailyReportStep3Main.getImageFile(), dailyReportStep3Main.getSheetID());
                }
                dailyReportStep3Sub.setSheetID2(dailyReportStep3Main.getSheetID());
                saveTransPortInfo(dailyReportStep3Sub);
            }
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
        //dailyReportStep3Main.setWriterIDX(Integer.parseInt(getSessionLoginData().getUuserID()));
        //가입된 회원정보가 있다면
        Login login2 = new Login();
        login2.setUserId(dailyReportStep3Main.getCarSubmitTel());
        Login loginInfo2 = findByUserInfo(login2);

        if(loginInfo2!=null){
            //회원가입 정보로 업데이트 해주기
            dailyReportStep3Main.setCarSubmit(loginInfo2.getUserSS());
            dailyReportStep3Main.setCarSubmitTel(loginInfo2.getUserTel());
            dailyReportStep3Main.setSalesman(loginInfo2.getUserName());
            dailyReportStep3MainMapper.editByOldCarSubmit(dailyReportStep3Main);
        }
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
            dailyReportStep3Main.setSheetSS(Integer.parseInt(getSessionLoginData().getUuserID()));
            dailyReportStep3Main.setWriterIDX(Integer.parseInt(getSessionLoginData().getUuserID()));

            if(dailyReportStep3Main.getSheetID() != 0){
                resultData=dailyReportStep3MainMapper.findBySheetIDForStep4(sheetID);
            }else{
                resultData=dailyReportStep3MainMapper.findCarSubmitInfo(dailyReportStep3Main);
            }
        }else if(loginInfo.getUserPosition().equals("manager")){
            resultData=dailyReportStep3MainMapper.findBySheetIDForStep8(sheetID);
        }
        return resultData;
    }

    public DailyReportStep3Main findTCarSubmitDetails(int sheetID){
        return dailyReportStep3MainMapper.findBySheetIDForStep4(sheetID);
    }

    /*제출처 정보 저장하기 기능*/
    public String editByCarSubmit(DailyReportStep3Main dailyReportStep3Main) {
        Map<String, Object> rtnMap = commonUtil.returnMap();
        Login login = new Login();
        login.setUserId(getSessionLoginData().getUserId());
        Login loginInfo = findByUserInfo(login);

        //휴대폰 번호로 제출처가 존재하는지 확인
        Login login2 = new Login();
        login2.setUserId(dailyReportStep3Main.getCarSubmitTel());
        Login loginInfo2 = findByUserInfo(login2);
        dailyReportStep3Main.setSheetSS(Integer.parseInt(getSessionLoginData().getUuserID()));
        //기사일때만
        if (loginInfo.getUserPosition().equals("driver")) {
            if(loginInfo2!=null){
                System.out.println("sheetID는?"+dailyReportStep3Main.getSheetID());
                System.out.println("CurrStatus는?"+dailyReportStep3Main.getCurrStatus());
                dailyReportStep3MainMapper.editByCarSubmit2(dailyReportStep3Main);
            }else{
                System.out.println("sheetID는?"+dailyReportStep3Main.getSheetID());
                System.out.println("salesman은?"+dailyReportStep3Main.getSalesman());

                dailyReportStep3MainMapper.editByCarSubmit1(dailyReportStep3Main);
            }
            rtnMap.put("httpCode", 200);
        }else{
            rtnMap.put("httpCode",422);
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
    @Transactional
    public String deleteAll(DailyReportStep3Main dailyReportStep3Main){
        Map<String, Object> rtnMap = commonUtil.returnMap();
        Login login = new Login();
        login.setUserId(getSessionLoginData().getUserId());
        Login loginInfo = findByUserInfo(login);
        //기사일때만
        if (loginInfo.getUserPosition().equals("driver")) {
            dailyReportStep3Main.setSheetSS(Integer.parseInt(getSessionLoginData().getUuserID()));
            int subResult=dailyReportStep3SubMapper.deleteByTransInfo(dailyReportStep3Main);
            if(subResult>0){
                dailyReportStep3MainMapper.deleteByCarsubmitInfo(dailyReportStep3Main);
                rtnMap.put("httpCode", 200);
            }else{
                rtnMap.put("httpCode", 422);
            }
        }else{
            rtnMap.put("httpCode", 422);
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }
    
    //제출하기
    @Transactional
    public String saveSales(DailyReportStep3Main dailyReportStep3Main){
        Map<String, Object> rtnMap = commonUtil.returnMap();

        //로그인 한 사람 정보 확인 - 기사인지, 제출처인지
        Login login = new Login();
        login.setUserId(getSessionLoginData().getUserId());
        Login loginInfo = findByUserInfo(login);

        //휴대폰 번호로 제출처가 존재하는지 확인
        Login login2 = new Login();
        login2.setUserId(dailyReportStep3Main.getCarSubmitTel());
        Login loginInfo2 = findByUserInfo(login);
        System.out.println("loginInfo2는?"+loginInfo2);
        //기사이면서 제출처가 존재할때만
        if(loginInfo.getUserPosition().equals("driver") && loginInfo2!=null){
            //기사일때만
            dailyReportStep3Main.setSheetSS(Integer.parseInt(getSessionLoginData().getUuserID()));
            dailyReportStep3Main.setWriterIDX(Integer.parseInt(getSessionLoginData().getUuserID()));
            //sub 데이터 수정
            dailyReportStep3SubMapper.submitByTransPortInfo(dailyReportStep3Main);
            //tsheet 데이터 수정
            dailyReportStep3MainMapper.submitByCarsubmitInfo(dailyReportStep3Main);
            //사용하지 않는 tSheet 데이터 삭제
            dailyReportStep3MainMapper.deleteByOldData(dailyReportStep3Main);
            rtnMap.put("httpCode", 200);
        }else if(loginInfo.getUserPosition().equals("manager") || loginInfo2==null){
            //기사가 아니거나 OR 제출처 회원정보가 없는 경우
            rtnMap.put("httpCode", 422);
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }

}


