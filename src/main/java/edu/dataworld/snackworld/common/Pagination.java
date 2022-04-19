package edu.dataworld.snackworld.common;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Pagination {

    private int listSize = 10;                //초기값으로 목록개수를 10으로 셋팅

    private int rangeSize = 10;            //초기값으로 페이지범위를 10으로 셋팅

    private int page = 1;

    private int range = 1;

    private int listCnt;

    private int pageCnt;

    private int startPage;

    private int startList;

    private int endPage;

    private boolean prev;

    private boolean next;

    private int startNum;

    private int endNum;

    //현재 페이지 정보, 현제 페이지 범위 정보, 게시물 총개수
    public void pageInfo(int page, int range, int listCnt) {
        this.page = page;
        this.range = range;
        this.listCnt = listCnt;

        //전체 페이지수
        this.pageCnt = (int) Math.ceil((double)listCnt / listSize);

        //시작페이지
        this.startPage = (range -1) * rangeSize + 1;

        //끝 페이지
        this.endPage = range * rangeSize;

        //게시판 시작번호
        this.startList = (page -1) * listSize;

        //이전 버튼 상태
        this.prev = range == 1 ? false : true;

        //다음 버튼 상태
        this.next = endPage > pageCnt ? false : true;
        if(this.endPage > this.pageCnt) {
            this.endPage = this.pageCnt;
            this.next = false;
        }
    }
}
