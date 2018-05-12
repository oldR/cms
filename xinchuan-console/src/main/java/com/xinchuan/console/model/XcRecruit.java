package com.xinchuan.console.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * <p>
 * 招聘POJO
 * </p>
 * Copyright (C) 2018 信传. All Rights Reserved.
 *
 * @author xinhe.REN (Create on:2018年05月09日)
 * @version 1.0
 * @fileName XcRecruit.java
 */
@Entity
public class XcRecruit {

    @Id
    @GeneratedValue
    private Long id;
    private String postName;//岗位名称

    @OneToMany(mappedBy = "dutyId",cascade = CascadeType.ALL)
    private List<XcRecruitDutyClaim> duty = new ArrayList<XcRecruitDutyClaim>();//职责

    @OneToMany(mappedBy = "requireId",cascade = CascadeType.ALL)
    private List<XcRecruitRequireClaim> requirements = new ArrayList<XcRecruitRequireClaim>();//要求

    private Date createTime;//时间

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }


    public List<XcRecruitRequireClaim> getRequirements() {
        return requirements;
    }

    public void setRequirements(List<XcRecruitRequireClaim> requirements) {
        this.requirements = requirements;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getPostName() {
        return postName;
    }

    public void setPostName(String postName) {
        this.postName = postName;
    }

    public List<XcRecruitDutyClaim> getDuty() {
        return duty;
    }

    public void setDuty(List<XcRecruitDutyClaim> duty) {
        this.duty = duty;
    }
}
