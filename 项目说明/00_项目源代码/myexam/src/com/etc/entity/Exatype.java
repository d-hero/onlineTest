package com.etc.entity;

public class Exatype {
    private Integer exid;

    private String exatype;

    public Integer getExid() {
        return exid;
    }

    public void setExid(Integer exid) {
        this.exid = exid;
    }

    public String getExatype() {
        return exatype;
    }

    public void setExatype(String exatype) {
        this.exatype = exatype == null ? null : exatype.trim();
    }

	@Override
	public String toString() {
		return "Exatype [exid=" + exid + ", exatype=" + exatype + "]";
	}
    
}