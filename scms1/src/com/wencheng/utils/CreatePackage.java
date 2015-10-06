package com.wencheng.utils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.wencheng.dao.ProjectDao;
import com.wencheng.dao.impl.ProjectDaoImpl;
import com.wencheng.domain.Journal;
import com.wencheng.domain.Project;
import com.wencheng.domain.Student;

public class CreatePackage {
	
	public static String createPackage(String basedir,String grade) throws IOException{
		ProjectDao dao = new ProjectDaoImpl();
		List<Project> list = dao.list(Integer.parseInt(grade));
		Iterator<Project> it = list.iterator();
		System.out.println("111111");
		String fname = basedir+"/export/"+grade+"_"+new Random().nextInt(100000)+".zip";
		File fo = new File(fname);
		if(fo.exists()){
			fo.delete();
		}
		try {
			fo.createNewFile();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		FileOutputStream out = null;
		try {
			out = new FileOutputStream(fo);
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		ZipOutputStream zo = new ZipOutputStream(out);
		while(it.hasNext()){
			Project pro = it.next();
			String base = "projects/"+pro.getName()+"/";
			createProject(pro, zo, base,basedir);
		}
		try {
			zo.close();
			out.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return fname;
	}
	
	public static void createProject(Project pro,ZipOutputStream zo,String base,String basedir) throws IOException{
		List<Student> member = pro.getMember();
		ZipEntry ze = new ZipEntry(base+"info.xls");
		int row = 0;
		try {
			zo.putNextEntry(ze);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		HSSFWorkbook hb = new HSSFWorkbook();
		HSSFSheet sheet = hb.createSheet("项目信息表");
		for(int i = 0; i<13; i++){
			sheet.setColumnWidth(i, 500*20);
		}
		
		HSSFRow row1 = sheet.createRow(row);
		HSSFCell c1_0 = row1.createCell(0);
		c1_0.setCellValue("项目信息");
		
		row++;
		row++;
		HSSFRow row2 = sheet.createRow(row);
		HSSFCell c2_0 = row2.createCell(0);
		c2_0.setCellValue("项目名称");
		HSSFCell c2_1 = row2.createCell(1);
		c2_1.setCellValue("项目编号");
		HSSFCell c2_2 = row2.createCell(2);
		c2_2.setCellValue("项目学院");
		
		row++;
		row++;
		HSSFRow row3 = sheet.createRow(row);
		HSSFCell c3_0 = row3.createCell(0);
		c3_0.setCellValue(pro.getName());
		HSSFCell c3_1 = row3.createCell(1);
		c3_1.setCellValue(pro.getNumber());
		HSSFCell c3_2 = row3.createCell(2);
		c3_2.setCellValue(pro.getSchool().getName());
		
		row++;
		if(pro.getAppliocationReport()!=null){
		row++;
		HSSFRow row4 = sheet.createRow(row);
		HSSFCell c4_0 = row4.createCell(0);
		c4_0.setCellValue("【项目申请书】");
		HSSFCell c4_1 = row4.createCell(1);
		c4_1.setCellValue("项目概要:"+pro.getAppliocationReport().getAbout());
		HSSFCell c4_2 = row4.createCell(2);
		c4_2.setCellValue("研究基础:"+pro.getAppliocationReport().getBase());
		HSSFCell c4_3 = row4.createCell(3);
		c4_3.setCellValue("预期研究成果及其展现形式:"+pro.getAppliocationReport().getComefrom());
		HSSFCell c4_4 = row4.createCell(4);
		c4_4.setCellValue("研究内容:"+pro.getAppliocationReport().getContent());
		HSSFCell c4_5 = row4.createCell(5);
		c4_5.setCellValue("项目研究可行性分析:"+pro.getAppliocationReport().getCould());
		HSSFCell c4_6 = row4.createCell(6);
		c4_6.setCellValue("所需仪器设备:"+pro.getAppliocationReport().getEquipment());
		HSSFCell c4_7 = row4.createCell(7);
		c4_7.setCellValue("研究方法  :"+pro.getAppliocationReport().getMethod());
		HSSFCell c4_8 = row4.createCell(8);
		c4_8.setCellValue("研究进度及安排:"+pro.getAppliocationReport().getProcess());
		HSSFCell c4_9 = row4.createCell(9);
		c4_9.setCellValue("研究现状:"+pro.getAppliocationReport().getNow());
		HSSFCell c4_10 = row4.createCell(10);
		c4_10.setCellValue("需要解决的问题和创新点:"+pro.getAppliocationReport().getProblems());
		HSSFCell c4_11 = row4.createCell(11);
		c4_11.setCellValue("参考文献:"+pro.getAppliocationReport().getReference());
		HSSFCell c4_12 = row4.createCell(12);
		c4_12.setCellValue("项目感想:"+pro.getAppliocationReport().getThought());
		}
		row++;
		if(pro.getMiddleReport()!=null){
		row++;
		HSSFRow row5 = sheet.createRow(row);
		HSSFCell c5_0 = row5.createCell(0);
		c5_0.setCellValue("【中期报告】");
		HSSFCell c5_1 = row5.createCell(1);
		c5_1.setCellValue("经费使用情况 :"+pro.getMiddleReport().getFeeused());
		HSSFCell c5_2 = row5.createCell(2);
		c5_2.setCellValue("工作计划:"+pro.getMiddleReport().getPlan());
		HSSFCell c5_3 = row5.createCell(3);
		c5_3.setCellValue("存在的问题:"+pro.getMiddleReport().getProblems());
		HSSFCell c5_4 = row5.createCell(4);
		c5_4.setCellValue("未按原计划完成部分及原因  :"+pro.getMiddleReport().getReasonWhyDelay());
		HSSFCell c5_5 = row5.createCell(5);
		c5_5.setCellValue("研究成果:"+pro.getMiddleReport().getResult());
		HSSFCell c5_6 = row5.createCell(6);
		c5_6.setCellValue("预期成果  :"+pro.getMiddleReport().getTarget());
		HSSFCell c5_7 = row5.createCell(7);
		c5_7.setCellValue("感想体会:"+pro.getMiddleReport().getThought());
		
		}
		row++;
		
		if(pro.getEndReport()!=null){
		row++;
		HSSFRow row6 = sheet.createRow(row);
		HSSFCell c6_0 = row6.createCell(0);
		c6_0.setCellValue("【结题报告】");
		HSSFCell c6_1 = row6.createCell(1);
		c6_1.setCellValue("经费使用情况 :"+pro.getEndReport().getFeeused());
		HSSFCell c6_2 = row6.createCell(2);
		c6_2.setCellValue("研究成果:"+pro.getEndReport().getResult());
		HSSFCell c6_3 = row6.createCell(3);
		c6_3.setCellValue("项目完成情况:"+pro.getEndReport().getStatus());
		HSSFCell c6_4 = row6.createCell(4);
		c6_4.setCellValue("感想体会:"+pro.getEndReport().getThought());
		}
		
		if(pro.getTeacher()!=null){
		row++;
		HSSFRow row7 = sheet.createRow(row);
		HSSFCell c7_0 = row7.createCell(0);
		c7_0.setCellValue("指导教师");
		HSSFCell c7_1 = row7.createCell(1);
		c7_1.setCellValue("姓名:"+pro.getTeacher().getName());
		HSSFCell c7_2 = row7.createCell(2);
		c7_2.setCellValue("学院:"+pro.getTeacher().getSchool().getName());
		}
		
		row++;
		HSSFRow row8 = sheet.createRow(row);
		HSSFCell c8_0 = row8.createCell(0);
		c8_0.setCellValue("成员");
		
		Iterator<Student> it = member.iterator();
		while(it.hasNext()){
			Student stu = it.next();
			row++;
			HSSFRow row9 = sheet.createRow(row);
			HSSFCell c9_0 = row9.createCell(0);
			c9_0.setCellValue(stu.getName());
			HSSFCell c9_1 = row9.createCell(1);
			c9_1.setCellValue("学号："+stu.getNumber());
			HSSFCell c9_2 = row9.createCell(2);
			c9_2.setCellValue("邮箱："+stu.getEmail());
			HSSFCell c9_3 = row9.createCell(3);
			c9_3.setCellValue("学院："+stu.getSchool().getName());
		}
		
		try {
			hb.write(zo);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw e;
		}
		
		List<Journal> j = pro.getJournals();
		Iterator<Journal> it1 = j.iterator();
		while(it1.hasNext()){
			Journal journal = it1.next();
			String con = createJournal(journal, basedir);
			ZipEntry ze1 = new ZipEntry(base+"journals/"+journal.getTitle()+".html");
			try {
				zo.putNextEntry(ze1);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw e;
			}
			try {
				zo.write(con.getBytes("utf-8"));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw e;
			}
		}
		
	}
	
	
	public static String createJournal(Journal jou,String basedir) throws IOException{
		File f = new File(basedir+"/export/static/journal.mb");
		if(!f.exists()){
			return "";
		}else{
			try {
				FileInputStream in = new FileInputStream(f);
				byte[] buffer = new byte[1024];
				StringBuilder sb = new StringBuilder();
				int length;
				while((length = in.read(buffer))>0){
					sb.append(new String(buffer,0,length,"utf-8"));
				}
				String con = sb.toString();
				con = con.replace("${title}", jou.getTitle());
				con = con.replace("${content}", jou.getJcontent());
				con = con.replace("${editor}", jou.getEditor().getName());
				return con;
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw e;
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				throw e;
			}
		}
	}

}
