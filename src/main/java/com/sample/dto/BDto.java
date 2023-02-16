package com.sample.dto;

import lombok.Getter;
import lombok.Setter;

import java.sql.Timestamp;

@Getter
@Setter
public class BDto {
    int bid;
    String bname;
    String btitle;
    String bcontent;
    Timestamp bdate;
    int bhit;
    int bgroup;
    int bstep;
    int bindent;

    public BDto(int bId, String bName, String bTitle, String bContent, Timestamp bDate, int bHit, int bGroup, int bStep, int bIndent){
        this.bid = bId;
        this.bname = bName;
        this.btitle = bTitle;
        this.bcontent = bContent;
        this.bdate = bDate;
        this.bhit = bHit;
        this.bgroup = bGroup;
        this.bstep = bStep;
        this.bindent = bIndent;
    }
}
