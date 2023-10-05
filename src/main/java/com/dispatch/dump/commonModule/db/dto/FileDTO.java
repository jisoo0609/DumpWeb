package com.dispatch.dump.commonModule.db.dto;

import lombok.Data;

@Data
public class FileDTO {

    private long idx;
    private String fileName;
    private String uuid;
    private String ext;
    private String tableName;
    private long sheetID;
}
