package com.xilingf.crud.bean;

import java.util.HashMap;
import java.util.Map;

/**
 * Created by tangz_000 on 2017/10/13 0013.
 */
public class Msg {
    private int code;
    private String msg;
    private Map<String, Object> extend = new HashMap<String, Object>();

    private static final int successCode = 100;
    private static final int failCode = 200;

    public Msg add(String key, Object value) {
        this.getExtend().put(key, value);
        return this;
    }

    public static Msg success() {
        Msg result = new Msg();
        result.setCode(successCode);
        result.setMsg("处理成功！");
        return result;
    }

    public static Msg fail() {
        Msg result = new Msg();
        result.setCode(failCode);
        result.setMsg("处理失败！");
        return result;
    }

    public int getCode() {
        return code;
    }

    public void setCode(int code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }
}
