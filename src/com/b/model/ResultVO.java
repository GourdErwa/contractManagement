package com.b.model;

/**
 * @author wei.Li by 16/3/10
 */
public class ResultVO {

    private boolean succeed;

    private Object data;

    public ResultVO(boolean succeed) {
        this.succeed = succeed;
    }

    public ResultVO(boolean succeed, Object data) {
        this.succeed = succeed;
        this.data = data;
    }

    public boolean isSucceed() {
        return succeed;
    }

    public Object getData() {
        return data;
    }
}
