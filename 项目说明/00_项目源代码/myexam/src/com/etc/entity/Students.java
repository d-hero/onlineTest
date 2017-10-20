package com.etc.entity;

import java.util.List;

public class Students {
    private Integer stuid;

    private String stupwd;

    private String stuno;

    private String stuname;

    private String stuphone;

    private String stusex;

    private Integer stustatus;
    
    //创建一个成绩表集合
    private List<Sturesult> stuResult;
    

	public List<Sturesult> getStuResult() {
		return stuResult;
	}

	public void setStuResult(List<Sturesult> stuResult) {
		this.stuResult = stuResult;
	}

	public Integer getStuid() {
        return stuid;
    }

    public void setStuid(Integer stuid) {
        this.stuid = stuid;
    }

    public String getStupwd() {
        return stupwd;
    }

    public void setStupwd(String stupwd) {
        this.stupwd = stupwd == null ? null : stupwd.trim();
    }

    public String getStuno() {
        return stuno;
    }

    public void setStuno(String stuno) {
        this.stuno = stuno == null ? null : stuno.trim();
    }

    public String getStuname() {
        return stuname;
    }

    public void setStuname(String stuname) {
        this.stuname = stuname == null ? null : stuname.trim();
    }

    public String getStuphone() {
        return stuphone;
    }

    public void setStuphone(String stuphone) {
        this.stuphone = stuphone == null ? null : stuphone.trim();
    }

    public String getStusex() {
        return stusex;
    }

    public void setStusex(String stusex) {
        this.stusex = stusex == null ? null : stusex.trim();
    }

    public Integer getStustatus() {
        return stustatus;
    }

    public void setStustatus(Integer stustatus) {
        this.stustatus = stustatus;
    }

	@Override
	public String toString() {
		return "Students [stuid=" + stuid + ", stupwd=" + stupwd + ", stuno="
				+ stuno + ", stuname=" + stuname + ", stuphone=" + stuphone
				+ ", stusex=" + stusex + ", stustatus=" + stustatus + "]";
	}

	
    
    
}