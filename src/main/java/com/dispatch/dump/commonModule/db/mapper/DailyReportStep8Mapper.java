package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.DailyReportStep8;
import com.dispatch.dump.commonModule.db.dto.DailyReportStep8OptionForm;
import org.apache.ibatis.annotations.Mapper;



import java.util.List;

@Mapper
public interface DailyReportStep8Mapper {

    List<DailyReportStep8> selectReceiptsByOption(DailyReportStep8OptionForm option);

    List<DailyReportStep8> getSelectBoxData(DailyReportStep8OptionForm option);

    DailyReportStep8 getReceiptsDetails(int sheetsubID, int sheetID);

    void approveReceipts(DailyReportStep8OptionForm option);

    void cancelApproval(DailyReportStep8OptionForm option);
}
