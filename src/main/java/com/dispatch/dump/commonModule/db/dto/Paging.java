package com.dispatch.dump.commonModule.db.dto;

import lombok.Data;

@Data
public class Paging {
    private int pageSize; // 게시 글 수
    private int firstPageNo; // 첫 번째 페이지 번호
    private int prevPageNo; // 이전 페이지 번호
    private int startPageNo; // 시작 페이지 (페이징 네비 기준)
    private int pageNo; // 페이지 번호
    private int endPageNo; // 끝 페이지 (페이징 네비 기준)
    private int nextPageNo; // 다음 페이지 번호
    private int finalPageNo; // 마지막 페이지 번호
    private int totalCount; // 게시 글 전체 수
    private int firstIndex;
    private int pageNav = 10; // 페이징 nav 페이지당 출력 페이지 수

    /**
     * @param totalCount the totalCount to set
     */
    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
        this.makePaging();
    }

    /**
     * 페이징 생성
     */
    private void makePaging() {
        if (this.pageNo == 0) this.setPageNo(1); // 기본 값 설정
        if (this.pageSize == 0) this.setPageSize(10); // 기본 값 설정
        if (this.totalCount == 0) return; // 게시 글 전체 수가 없는 경우

        int finalPage = ((int) (totalCount + (pageSize - 1))) / pageSize; // 마지막 페이지
        if (this.pageNo > finalPage) this.setPageNo(finalPage); // 기본 값 설정

        if (this.pageNo < 0 || this.pageNo > finalPage) this.pageNo = 1; // 현재 페이지 유효성 체크

        boolean isNowFirst = pageNo == 1 ? true : false; // 시작 페이지 (전체)
        boolean isNowFinal = pageNo == finalPage ? true : false; // 마지막 페이지 (전체)

        int startPage = ((pageNo - 1) / pageNav) * pageNav + 1; // 시작 페이지 (페이징 네비 기준)
        int endPage = startPage + pageNav - 1; // 끝 페이지 (페이징 네비 기준)

        if (endPage > finalPage) { // [마지막 페이지 (페이징 네비 기준) > 마지막 페이지] 보다 큰 경우
            endPage = finalPage;
        }

        this.setFirstPageNo(1); // 첫 번째 페이지 번호

        if (isNowFirst) {
            this.setPrevPageNo(1); // 이전 페이지 번호
        } else {
            this.setPrevPageNo(((pageNo - 1) < 1 ? 1 : (pageNo - 1))); // 이전 페이지 번호
        }
        this.setStartPageNo(startPage); // 시작 페이지 (페이징 네비 기준)
        this.setEndPageNo(endPage); // 끝 페이지 (페이징 네비 기준)

        if (isNowFinal) {
            this.setNextPageNo(finalPage); // 다음 페이지 번호
        } else {
            this.setNextPageNo(((pageNo + 1) > finalPage ? finalPage : (pageNo + 1))); // 다음 페이지 번호
        }

        this.setFinalPageNo(finalPage); // 마지막 페이지 번호

        this.firstIndex = (pageNo-1) * pageSize;
    }

    public int getStartRownum() {
        return ((pageNo - 1) * pageSize);
    }
}
