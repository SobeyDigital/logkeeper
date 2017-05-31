package com.sobey.jcg.logkeeper.domain;

import java.io.Serializable;

/**
 * Created by WX on 2017/4/20.
 *
 * logstash的实例引用
 */
public abstract class LsInstance implements Serializable{
    private String[] tags; //标签
    private String group; //组，组具有唯一性

    private String instGUID; //唯一id
    private String instName; //显示名称

    private String host; //地址
    private int monitorPort = 9600; //监控API的端口
    private String instConfigDir; //配置文件的路径，相同Group的必须保持一致
    private Status status;

    private LSEnv env; //运行时变量

    public LsInstance() {
    }

    public LsInstance(String[] tags, String group, String instGUID,
                      String instName, String host, int monitorPort,
                      String instConfigDir, Status status, LSEnv env) {
        this.tags = tags;
        this.group = group;
        this.instGUID = instGUID;
        this.instName = instName;
        this.host = host;
        this.monitorPort = monitorPort;
        this.instConfigDir = instConfigDir;
        this.status = status;
        this.env = env;
    }

    public String getInstGUID() {
        return instGUID;
    }

    public void setInstGUID(String instGUID) {
        this.instGUID = instGUID;
    }

    public String getInstName() {
        return instName;
    }

    public void setInstName(String instName) {
        this.instName = instName;
    }

    public String getHost() {
        return host;
    }

    public void setHost(String host) {
        this.host = host;
    }

    public int getMonitorPort() {
        return monitorPort;
    }

    public void setMonitorPort(int monitorPort) {
        this.monitorPort = monitorPort;
    }

    public String getInstConfigDir() {
        return instConfigDir;
    }

    public void setInstConfigDir(String instConfigDir) {
        this.instConfigDir = instConfigDir;
    }

    public String[] getTags() {
        return tags;
    }

    public void setTags(String[] tags) {
        this.tags = tags;
    }

    public String getGroup() {
        return group;
    }

    public void setGroup(String group) {
        this.group = group;
    }

    public Status getStatus() {
        return status;
    }

    public void setStatus(Status status) {
        this.status = status;
    }

    public LSEnv getEnv() {
        return env;
    }

    public void setEnv(LSEnv env) {
        this.env = env;
    }

    //实例的状态
    public static enum Status {
        Running,//正在使用
        Standby, //预备
        Error
    }
}
