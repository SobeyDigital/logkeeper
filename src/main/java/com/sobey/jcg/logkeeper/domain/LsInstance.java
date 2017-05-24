package com.sobey.jcg.logkeeper.domain;

import java.io.Serializable;

/**
 * Created by WX on 2017/4/20.
 *
 * logstash的实例引用
 */
public class LsInstance implements Serializable{
    private String[] tags; //标签

    private String instGUID; //唯一id
    private String instName; //显示名称

    private String host; //地址
    private int monitorPort = 9600; //监控API的端口
    private String instConfigDir; //配置文件的路径

    private Status status;

    public LsInstance() {
    }

    public LsInstance(String instGUID, String instName, String host, int monitorPort, String instConfigDir) {
        this.instGUID = instGUID;
        this.instName = instName;
        this.host = host;
        this.monitorPort = monitorPort;
        this.instConfigDir = instConfigDir;
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
}
