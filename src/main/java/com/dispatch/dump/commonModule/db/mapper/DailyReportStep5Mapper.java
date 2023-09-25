package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep5;

import java.util.List;

public interface DailyReportStep5Mapper {

    void insertTDrive(DailyReportStep5 dailyReportStep5);

    void updateTDrive(DailyReportStep5 dailyReportStep5);

    List<DailyReportStep5> selectTDriveList(String userID, String date);

    void deleteTDrive(String userID, int driveID);

    DailyReportStep5 selectTDriveDetails(String userID, int driveID);

}
