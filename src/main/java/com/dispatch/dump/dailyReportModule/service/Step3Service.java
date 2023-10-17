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
            
            DailyReportStep3Main carSubmitResult=dailyReportStep3MainMapper.findCarSubmitInfo(dailyReportStep3Main);
            if(carSubmitResult!=null){
                //sheetSS2와 sheetsubSS2 update-> 회원가입할때 SS2를 update하는 과정을 거친다면 필요없음
                dailyReportStep3MainMapper.editBySheetSS2(dailyReportStep3Main);
                dailyReportStep3SubMapper.editBySheetsubSS2(dailyReportStep3Sub);

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

    //전체목록 조회
    public DailyReportStep3Main list(DailyReportStep3Main dailyReportStep3Main) {
        return dailyReportStep3MainMapper.findAllCarSubmitInfo(dailyReportStep3Main);
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

    public DailyReportStep3Main findTCarSubmitDetails(int sheetID){
        return dailyReportStep3MainMapper.findBySheetIDForStep4(sheetID);
    }

    /*제출처 정보 수정*/
    public String editByCarSubmit(DailyReportStep3Main dailyReportStep3Main){
        Map<String, Object> rtnMap = commonUtil.returnMap();
        dailyReportStep3Main.setSheetSS(Integer.parseInt(getSessionLoginData().getUuserID()));
        int result=dailyReportStep3MainMapper.editByCarSubmit(dailyReportStep3Main);

        if (result > 0) {
            rtnMap.put("httpCode", 200);
        } else {
            rtnMap.put("httpCode", 422);
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    /*운송정보 수정*/
    //조건 : 삭제시 작성자와 로그인 idx가 같은 것만 삭제
    public String edit(DailyReportStep3Sub dailyReportStep3Sub){
        Map<String, Object> rtnMap = commonUtil.returnMap();
        int sheetsubID=dailyReportStep3Sub.getSheetsubID();

        int sheetID=dailyReportStep3SubMapper.findBySheetsubID(sheetsubID);
        boolean chk1=dailyReportStep3MainMapper.findBySheetID(sheetID);

        if(chk1==false){
            dailyReportStep3Sub.setWriteridx2(Integer.parseInt(getSessionLoginData().getUuserID()));
            dailyReportStep3SubMapper.editByTransportInfo(dailyReportStep3Sub);
            rtnMap.put("httpCode", 200);
        }else{
            rtnMap.put("httpCode",422);
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    /*운송정보 삭제 - 조건 수정 예정*/
    public String delete(DailyReportStep3Sub dailyReportStep3Sub){
        Map<String, Object> rtnMap = commonUtil.returnMap();

        int sheetID=dailyReportStep3SubMapper.findBySheetsubID(dailyReportStep3Sub.getSheetsubID());
        System.out.println("sheetID는?"+sheetID);
        boolean chk1=dailyReportStep3MainMapper.findBySheetID(sheetID);
        System.out.println("chk1은?"+chk1);

        if(chk1==false){
            System.out.println("여기까지 도달");
            dailyReportStep3Sub.setWriteridx2(Integer.parseInt(getSessionLoginData().getUuserID()));
            dailyReportStep3SubMapper.deleteByOne(dailyReportStep3Sub);
            rtnMap.put("httpCode", 200);
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


