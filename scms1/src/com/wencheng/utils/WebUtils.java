package com.wencheng.utils;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.InvocationTargetException;
import java.security.MessageDigest;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;

public class WebUtils {
	/**
	 * 自动将请求中的参数放置到bean中
	 * @param bean
	 * @param request
	 * @return
	 */
	public static boolean getBean(Object bean,HttpServletRequest request){
		
		boolean status = true;
		try {
			request.setCharacterEncoding("UTF8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		Enumeration<String> names = request.getParameterNames();
		while(names.hasMoreElements()){
			String param = names.nextElement();
			try {
				System.out.println(param+":"+request.getParameter(param));
				BeanUtils.setProperty(bean, param, request.getParameter(param));
			} catch (IllegalAccessException e) {
				// TODO Auto-generated catch block
				status = false;
				e.printStackTrace();
			} catch (InvocationTargetException e) {
				// TODO Auto-generated catch block
				status = false;
				e.printStackTrace();
			}
		}
		return status;
	}
	
	/**
	 * 判断本表单是否已经提交过
	 * @param request
	 * @return
	 */
	public static boolean isSubmit(HttpServletRequest request){
		try {
			request.setCharacterEncoding("UTF8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		HttpSession session = request.getSession();
		System.out.println(request.getParameter("token")+":"+session.getAttribute("token"));
		if(request.getParameter("token") == null){
			return false;
		}
		if(session.getAttribute("token") == null){
			session.setAttribute("token",request.getParameter("token"));
			return false;
		}
		if(request.getParameter("token").equals(session.getAttribute("token"))){
			return true;
		}
		session.setAttribute("token",request.getParameter("token"));
		return false;
	}
	
	/**
	 * 判断用户是否已经登录
	 * @param request
	 * @param 存放用户登录信息的session域
	 * @return
	 */
	public static boolean isLogin(HttpServletRequest request,String name){
		if(request.getSession().getAttribute(name) == null){
			return false;
		}
		return true;
	}
	
	/**
	 * MD5加密
	 * @param s
	 * @return
	 */
	public final static String MD5(String s) {
        char hexDigits[]={'0','1','2','3','4','5','6','7','8','9','A','B','C','D','E','F'};       
        try {
            byte[] btInput = s.getBytes();
            // 获得MD5摘要算法的 MessageDigest 对象
            MessageDigest mdInst = MessageDigest.getInstance("MD5");
            // 使用指定的字节更新摘要
            mdInst.update(btInput);
            // 获得密文
            byte[] md = mdInst.digest();
            // 把密文转换成十六进制的字符串形式
            int j = md.length;
            char str[] = new char[j * 2];
            int k = 0;
            for (int i = 0; i < j; i++) {
                byte byte0 = md[i];
                str[k++] = hexDigits[byte0 >>> 4 & 0xf];
                str[k++] = hexDigits[byte0 & 0xf];
            }
            return new String(str);
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }
	
	/**
	 * 格式化ID
	 * @param id
	 * @return
	 */
	public final static String formatId(String id){
		StringBuilder sb = new StringBuilder();
		for(int i = 0; i<id.length(); i++){
			sb.append(id.charAt(i));
			if((i+1)%4 == 0){
				sb.append(" ");
			}
		}
		return sb.toString();
	}

}
