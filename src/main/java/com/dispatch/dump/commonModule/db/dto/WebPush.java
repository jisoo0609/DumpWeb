package com.dispatch.dump.commonModule.db.dto;

import lombok.Data;

@Data
public class WebPush {
    private int idx;
    private String subject;     // LINE :: 제목
    private String carNo;       // LINE :: 차량번호
    private boolean MiCarChk;   // LINE :: ??
    private int alramSS;        // LINE :: ??
    private String body;        // LINE :: 내용

}
