package model;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Model {
	private String pn;
	private String pt;
	private String region;
	private String proj_m;
	private String prog_m;
	private String ptrack;
	private String brs;
	private String ors;
	private String crp;
	private String uat;
	private String email;
	private String password;
	private String strdate;
	private String Client_name;
	private String project_comments;
	private String project_id;
	private String role;
	private String username;
	
	public String getTask_number() {
		return task_number;
	}
	public void setTask_number(String task_number) {
		this.task_number = task_number;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getDevlopment_category() {
		return devlopment_category;
	}
	public void setDevlopment_category(String devlopment_category) {
		this.devlopment_category = devlopment_category;
	}
	public String getClient_sign_off() {
		return client_sign_off;
	}
	public void setClient_sign_off(String client_sign_off) {
		this.client_sign_off = client_sign_off;
	}
	public String getDomian() {
		return domian;
	}
	public void setDomian(String domian) {
		this.domian = domian;
	}
	public String getApplication() {
		return application;
	}
	public void setApplication(String application) {
		this.application = application;
	}
	public String getModule() {
		return module;
	}
	public void setModule(String module) {
		this.module = module;
	}
	public String getReport_name() {
		return report_name;
	}
	public void setReport_name(String report_name) {
		this.report_name = report_name;
	}
	public String getReport_category() {
		return report_category;
	}
	public void setReport_category(String report_category) {
		this.report_category = report_category;
	}
	public String getReport_status() {
		return report_status;
	}
	public void setReport_status(String report_status) {
		this.report_status = report_status;
	}
	public String getFunctional_resource() {
		return functional_resource;
	}
	public void setFunctional_resource(String functional_resource) {
		this.functional_resource = functional_resource;
	}
	public String getProject_from() {
		return project_from;
	}
	public void setProject_from(String project_from) {
		this.project_from = project_from;
	}
	public String getTask_ref() {
		return task_ref;
	}
	public void setTask_ref(String task_ref) {
		this.task_ref = task_ref;
	}
	public String getTechnical_resource() {
		return technical_resource;
	}
	public void setTechnical_resource(String technical_resource) {
		this.technical_resource = technical_resource;
	}
	public String getEmail() {
		return email;
	}
	public String getPassword() {
		return password;
	}
	public String getRole() {
		return role;
	}
	public String getUsername() {
		return username;
	}
	private String task_number;
	private String period;
	private String devlopment_category;
	private String client_sign_off;
	private String domian;
	private String application;
	private String module;
	private String report_name;
	private String report_category;
	private String report_status;
	private String functional_resource;
	private String project_from;
	private String task_ref;
	private String technical_resource;
	
	public String getProject_id() {
		return project_id;
	}
	public void setProject_id(String project_id) {
		this.project_id = project_id;
	}
	
	
	
	public String getProject_comments() {
		return Client_name;
	}
	public void setProject_comments(String project_comments) {
		this.project_comments = project_comments;
	}
	
	public String getClient_name() {
		return Client_name;
	}
	public void setClient_name(String Client_name) {
		this.Client_name = Client_name;
	}
	
	public String getStrdate() {
		return strdate;
	}
	public void setStrdate(String strdate) {
		this.strdate = strdate;
	}
	
	public String getPn() {
		return pn;
	}
	public void setPn(String pn) {
		this.pn = pn;
	}
	
	public String getPt() {
		return pt;
	}
	public void setPt(String pt) {
		this.pt = pt;
	}
	public String getRegion() {
		return region;
	}
	public void setRegion(String region) {
		this.region = region;
	}
	public String getProj_m() {
		return proj_m;
	}
	public void setProj_m(String proj_m) {
		this.proj_m = proj_m;
	}
	public String getProg_m() {
		return prog_m;
	}
	public void setProg_m(String prog_m) {
		this.prog_m = prog_m;
	}
	public String getPtrack() {
		return ptrack;
	}
	public void setPtrack(String ptrack) {
		this.ptrack = ptrack;
	}
	public String getBrs() {
		return brs;
	}
	public void setBrs(String brs) {
		this.brs = brs;
	}
	public String getOrs() {
		return ors;
	}
	public void setOrs(String ors) {
		this.ors = ors;
	}
	public String getCrp() {
		return crp;
	}
	public void setCrp(String crp) {
		this.crp = crp;
	}
	public String getUat() {
		return uat;
	}
	public void setUat(String uat) {
		this.uat = uat;
	}
	public String getGld() {
		return gld;
	}
	public void setGld(String gld) {
		this.gld = gld;
	}
	public String getSp() {
		return sp;
	}
	public void setSp(String sp) {
		this.sp = sp;
	}
	public String getPs() {
		return ps;
	}
	public void setPs(String ps) {
		this.ps = ps;
	}
	private String gld;
	private String sp;
	private String ps;
	public void setEmail(String email) {
		// TODO Auto-generated method stub
		this.email = email;
	}
	public void setPassword(String pass) {
		// TODO Auto-generated method stub
		this.password=password;
	}
	public void setRole(String role) {
		// TODO Auto-generated method stub
		this.role=role;
		
	}
	public String getRole(String role) {
		// TODO Auto-generated method stub
	return role;
		
	}
	public void setUsername(String username) {
		// TODO Auto-generated method stub
		this.username=username;
		
	}
	public String getUsername(String username) {
		// TODO Auto-generated method stub
		return username;
		
	}
public static String dateConverter(String temp)
{
	String temp_return=null;
	try {
		if(!(temp==null || temp.equals("")))
		{
		Date date1=new SimpleDateFormat("yyyy-MM-dd").parse(temp);
		 SimpleDateFormat sdfDestination = new SimpleDateFormat("dd-MMM-yyyy");
	      temp_return = sdfDestination.format(date1);
		}
	}
	catch (ParseException e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}  
	return temp_return;
}
public static int IntConverter(String temp)
{
	int temp1=0;
	if(temp==null || temp.equals(""))
	{
		return temp1;
	}
	else
	{
		temp1=Integer.parseInt(temp);
		return temp1;
	}
}
	
	public static String ConvertSpace(String temp)
	{
		
		if(temp==null || temp.equals("") || temp.contains("null"))
		{
			temp=" ";
		}
		return temp;
	
}
}