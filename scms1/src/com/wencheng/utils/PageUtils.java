package com.wencheng.utils;

public final class PageUtils {
	
	private int pagesize;
	
	public PageUtils(int size){
		this.pagesize = size;
	}
	
	public int getPageCount(int rowcount){
		return (rowcount+pagesize-1)/pagesize;
	}
	
	public int getStart(int page){
		return (page-1)*pagesize;
	}

}
