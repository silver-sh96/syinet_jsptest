package com.test.esh.dto;

public class PagingDTO {
	
	// 현재페이지, 시작페이지, 끝페이지, 게시글 총 갯수, 페이지당 글 갯수, 마지막페이지, SQL쿼리에 쓸 start, end, 현제 페이지번호가 가운데로 오게하기 위한 window
		private int nowPage, startPage, endPage, total, cntPerPage, lastPage, start, end, windowStart, windowEnd;
		private int beginPage = 1;
		private int cntPage = 5;
		
		public PagingDTO() {
		}
		public PagingDTO(int total, int nowPage, int cntPerPage) {
			setNowPage(nowPage);
			setCntPerPage(cntPerPage);
			setTotal(total);
			calcLastPage(getTotal(), getCntPerPage());
			calcStartEndPage(getNowPage(), cntPage);
			calcStartEnd(getNowPage(), getCntPerPage());
			calcWindow(getStartPage(), getEndPage(), getNowPage(), getLastPage(), getWindowStart(), getWindowEnd(), cntPage);
			
		}
		// 제일 마지막 페이지 계산
		public void calcLastPage(int total, int cntPerPage) {
			setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
		}
		// 시작, 끝 페이지 계산
		public void calcStartEndPage(int nowPage, int cntPage) {
			setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
			setStartPage(getEndPage() - cntPage + 1);
			if (getEndPage() > getLastPage()) {
				setEndPage(getLastPage());
			}
			
			if (getStartPage() < 1) {
				setStartPage(1);
			}
		}
		// DB 쿼리에서 사용할 start, end값 계산
		public void calcStartEnd(int nowPage, int cntPerPage) {
			setEnd(nowPage * cntPerPage);
			setStart(getEnd() - cntPerPage + 1);
		}
		// 페이지 window 고정
		public void calcWindow(int startPage, int endPage, int nowPage, int lastPage, int windowStart, int windowEnd, int cntPage) {
			if(nowPage <= 3) {
				setWindowStart(startPage);
				setWindowEnd(endPage);
			}
			if(nowPage > 3 && (nowPage+2) <= lastPage) {
				setWindowStart(nowPage-2);
				setWindowEnd(nowPage+2);
				setStartPage(nowPage-2);
				setEndPage(nowPage+2);
			}
			if((nowPage+2) >= lastPage) {
				setWindowStart(lastPage-4);
				setWindowEnd(lastPage);
			}
			if(lastPage <= cntPage) {
				setWindowStart(startPage);
				setWindowEnd(endPage);
				
			}
		}
		
		public int getNowPage() {
			return nowPage;
		}
		public void setNowPage(int nowPage) {
			this.nowPage = nowPage;
		}
		public int getStartPage() {
			return startPage;
		}
		public void setStartPage(int startPage) {
			this.startPage = startPage;
		}
		public int getEndPage() {
			return endPage;
		}
		public void setEndPage(int endPage) {
			this.endPage = endPage;
		}
		public int getTotal() {
			return total;
		}
		public void setTotal(int total) {
			this.total = total;
		}
		public int getCntPerPage() {
			return cntPerPage;
		}
		public void setCntPerPage(int cntPerPage) {
			this.cntPerPage = cntPerPage;
		}
		public int getLastPage() {
			return lastPage;
		}
		public void setLastPage(int lastPage) {
			this.lastPage = lastPage;
		}
		public int getStart() {
			return start;
		}
		public void setStart(int start) {
			this.start = start;
		}
		public int getEnd() {
			return end;
		}
		public void setEnd(int end) {
			this.end = end;
		}
		public int getWindowStart() {
			return windowStart;
		}
		public void setWindowStart(int windowStart) {
			this.windowStart = windowStart;
		}
		public int getWindowEnd() {
			return windowEnd;
		}
		public void setWindowEnd(int windowEnd) {
			this.windowEnd = windowEnd;
		}
		public int getBeginPage() {
			return beginPage;
		}
		public void setBeginPage(int beginPage) {
			this.beginPage = beginPage;
		}
		public int getCntPage() {
			return cntPage;
		}
		public void setCntPage(int cntPage) {
			this.cntPage = cntPage;
		}
		
		@Override
		public String toString() {
			return "PagingDTO [nowPage=" + nowPage + ", startPage=" + startPage + ", endPage=" + endPage + ", total="
					+ total + ", cntPerPage=" + cntPerPage + ", lastPage=" + lastPage + ", start=" + start + ", end="
					+ end + ", windowStart=" + windowStart + ", windowEnd=" + windowEnd + ", beginPage=" + beginPage
					+ ", cntPage=" + cntPage + "]";
		}
}
