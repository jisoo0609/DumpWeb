package com.dispatch.dump.commonModule.db.mapper;

import com.dispatch.dump.commonModule.db.dto.FileDTO;

public interface FileMapper {

    int insertFileInfoBySheetID(FileDTO fileDTO);

    FileDTO findFileInfoBySheetID(int idx);
}
