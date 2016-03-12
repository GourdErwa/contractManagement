package com.b.model;

/**
 * @author Wei.Li on 2016/3/9.
 */
public class Contract {

    private int id;
    // 合同状态
    private int state;

    private String
            // 合同名称
            name,
    // 甲方乙方
    userName1, userName2,
    // 工程段
    engineeringSection,
    // 概算编码
    encodingBudget,
    // 合同金额
    contractAmount,
    // 分摊金额
    shareAmount,
    // 分摊金额比例
    shareRatio;

    public Contract() {
    }

    public Contract(int id, int state, String name, String userName1, String userName2, String engineeringSection,
                    String encodingBudget, String contractAmount, String shareAmount, String shareRatio) {
        this.id = id;
        this.state = state;
        this.name = name;
        this.userName1 = userName1;
        this.userName2 = userName2;
        this.engineeringSection = engineeringSection;
        this.encodingBudget = encodingBudget;
        this.contractAmount = contractAmount;
        this.shareAmount = shareAmount;
        this.shareRatio = shareRatio;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getState() {
        return state;
    }

    public void setState(int state) {
        this.state = state;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getUserName1() {
        return userName1;
    }

    public void setUserName1(String userName1) {
        this.userName1 = userName1;
    }

    public String getUserName2() {
        return userName2;
    }

    public void setUserName2(String userName2) {
        this.userName2 = userName2;
    }

    public String getEngineeringSection() {
        return engineeringSection;
    }

    public void setEngineeringSection(String engineeringSection) {
        this.engineeringSection = engineeringSection;
    }

    public String getEncodingBudget() {
        return encodingBudget;
    }

    public void setEncodingBudget(String encodingBudget) {
        this.encodingBudget = encodingBudget;
    }

    public String getContractAmount() {
        return contractAmount;
    }

    public void setContractAmount(String contractAmount) {
        this.contractAmount = contractAmount;
    }

    public String getShareAmount() {
        return shareAmount;
    }

    public void setShareAmount(String shareAmount) {
        this.shareAmount = shareAmount;
    }

    public String getShareRatio() {
        return shareRatio;
    }

    public void setShareRatio(String shareRatio) {
        this.shareRatio = shareRatio;
    }
}
