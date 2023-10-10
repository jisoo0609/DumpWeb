package com.dispatch.dump.dailyReportModule.service;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Main;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep3Sub;
import com.dispatch.dump.commonModule.db.dto.Login;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep3MainMapper;
import com.dispatch.dump.commonModule.db.mapper.DailyReportStep3SubMapper;
import com.dispatch.dump.commonModule.db.mapper.LoginMapper;
import com.dispatch.dump.commonModule.util.CommonUtil;
import javax.servlet.http.HttpSession;

import com.dispatch.dump.commonModule.util.FileUtil;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
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
    private final LoginMapper loginMapper;
    private final CommonUtil commonUtil;
    private final FileUtil fileUtil;

    public Login getSessionLoginData() {
        return (Login) commonUtil.getSession().getAttribute("loginInfo");
    }

    public void saveData2(DailyReportStep3Main dailyReportStep3Main, DailyReportStep3Sub dailyReportStep3Sub){
        dailyReportStep3MainMapper.insertCarSubmitInfo(dailyReportStep3Main);

        if (dailyReportStep3Main.getImageFile() != null) {
            fileUtil.fileUpload(dailyReportStep3Main.getImageFile(), dailyReportStep3Main.getSheetID());
        }
        dailyReportStep3Sub.setSheetID2(dailyReportStep3Main.getSheetID());
        dailyReportStep3SubMapper.insertTransportInfo(dailyReportStep3Sub);
    };

    public void saveData(DailyReportStep3Main dailyReportStep3Main, DailyReportStep3Sub dailyReportStep3Sub) {
        dailyReportStep3Main.setCarNo(getSessionLoginData().getUserId());
        dailyReportStep3Main.setSheetSS(Integer.parseInt(getSessionLoginData().getUuserID()));
        dailyReportStep3Main.setWriterIDX(Integer.parseInt(getSessionLoginData().getUuserID()));
    }

    public void saveTransPortInfo(DailyReportStep3Sub dailyReportStep3Sub){
        dailyReportStep3Sub.setSheetsubSS(Integer.parseInt(getSessionLoginData().getUuserID()));
        dailyReportStep3Sub.setWriteridx2(Integer.parseInt(getSessionLoginData().getUuserID()));
        //System.out.println(); 추후 확인
        dailyReportStep3SubMapper.insertTransportInfo(dailyReportStep3Sub);
    };


    //회원정보 검증
    //user id에 DailyReportStep3Main의 carsubmitTel 등록해서 사용
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

        //회원가입 기록 검증
        Login login=new Login();
        login.setUserId(dailyReportStep3Main.getCarSubmitTel());
        
        //다중 if문 나중에 수정할 것
        Login userInfo=findByUserInfo(login);
        if(userInfo!=null){
            //회원정보가 존재하는 경우(ss2와 subSS2 등록 시 Data 있음)
            dailyReportStep3Main.setSheetSS2(Integer.parseInt(userInfo.getUuserID()));
            dailyReportStep3Sub.setSheetsubSS2(Integer.parseInt(userInfo.getUuserID()));
            
            //내가 등록한 제출처 정보가 있다면
            DailyReportStep3Main carSubmitResult=dailyReportStep3MainMapper.findCarSubmitInfo(dailyReportStep3Main);
            if(carSubmitResult!=null){
                //sheetSS2와 sheetsubSS2 update-> 회원가입할때 SS2를 update하는 과정을 거친다면 필요없음
                dailyReportStep3MainMapper.editBySheetSS2(dailyReportStep3Main);
                dailyReportStep3SubMapper.editBySheetsubSS2(dailyReportStep3Sub);

                System.out.println("find main Data.");
                dailyReportStep3Sub.setSheetID2(carSubmitResult.getSheetID());

                saveTransPortInfo(dailyReportStep3Sub);
            }else{
                //내가 등록한 제출처 정보가 없다면
                //sheetSS2, sheetsubSS2 와 함께 insert
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
            //회원 정보가 존재 하지 않는 경우(ss2와 subSS2 등록 시 Data 없음)
            dailyReportStep3Main.setSheetSS2(Integer.parseInt(userInfo.getUuserID()));
            dailyReportStep3Sub.setSheetsubSS2(Integer.parseInt(userInfo.getUuserID()));

            //내가 등록한 제출처 정보가 있다면
            DailyReportStep3Main carSubmitResult=dailyReportStep3MainMapper.findCarSubmitInfo(dailyReportStep3Main);
            if(carSubmitResult!=null){
                //하위 테이블만 추가
                System.out.println("find main Data.");
                dailyReportStep3Sub.setSheetID2(carSubmitResult.getSheetID());

                saveTransPortInfo(dailyReportStep3Sub);
            }else{
                //상, 하위 테이블 모두 추가
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
        dailyReportStep3Main.setSheetSS(Integer.parseInt(getSessionLoginData().getUuserID()));
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
    public String edit(DailyReportStep3Sub dailyReportStep3Sub){
        Map<String, Object> rtnMap = commonUtil.returnMap();
        //유지보수를 위해 단계적으로 작성->리팩토링 예정
        int sheetsubID=dailyReportStep3Sub.getSheetsubID();

        int sheetID=dailyReportStep3SubMapper.findBySheetsubID(sheetsubID);
        boolean chk1=dailyReportStep3MainMapper.findBySheetID(sheetID);

        if(chk1==false){
            dailyReportStep3SubMapper.editByTransportInfo(dailyReportStep3Sub);
        }else{
            rtnMap.put("httpcode",422);
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }

    /*운송정보 삭제*/
    public String delete(int sheetsubID){
        Map<String, Object> rtnMap = commonUtil.returnMap();
        //유지보수를 위해 단계적으로 작성->리팩토링 예정
        int sheetID=dailyReportStep3SubMapper.findBySheetsubID(sheetsubID);
        boolean chk1=dailyReportStep3MainMapper.findBySheetID(sheetID);

        if(chk1==false){
            dailyReportStep3SubMapper.deleteByOne(sheetsubID);
        }else{
            rtnMap.put("httpcode", 422);
        }
        return commonUtil.jsonFormatTransfer(rtnMap);
    }
}
