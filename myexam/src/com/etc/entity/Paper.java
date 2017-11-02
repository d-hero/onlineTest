package com.etc.entity;


/**
 * 试卷信息表
 * @author Administrator
 *
 */
public class Paper {
	
    private Integer paperid;

    private Tpaper  tpaper;

    private Integer orderno;
    
    private Integer questionid;
    
    private Questions questions;
    
    private String aws;//单题的答案

    public String getAws() {
		return aws;
	}

	public void setAws(String aws) {
		this.aws = aws;
	}

	public Integer getQuestionid() {
		return questionid;
	}

	public void setQuestionid(Integer questionid) {
		this.questionid = questionid;
	}

	

    public Integer getPaperid() {
        return paperid;
    }

    public void setPaperid(Integer paperid) {
        this.paperid = paperid;
    }


    public Integer getOrderno() {
        return orderno;
    }

    public void setOrderno(Integer orderno) {
        this.orderno = orderno;
    }



	public Questions getQuestions() {
		return questions;
	}

	

	@Override
	public String toString() {
		return "Paper [paperid=" + paperid + ", tpaper=" + tpaper
				+ ", orderno=" + orderno + ", questions=" + questions + ",aws="+aws+"]";
	}

	public Tpaper getTpaper() {
		return tpaper;
	}

	public void setTpaper(Tpaper tpaper) {
		this.tpaper = tpaper;
	}

	public void setQuestions(Questions questions) {
		this.questions = questions;
	}

  
}