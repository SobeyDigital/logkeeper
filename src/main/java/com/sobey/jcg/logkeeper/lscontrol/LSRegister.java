package com.sobey.jcg.logkeeper.lscontrol;

import java.util.List;

import com.sobey.jcg.logkeeper.domain.LsInstance;
import com.sobey.jcg.logkeeper.domain.LsInstance.Status;

/**
 * Created by WX on 2017/5/24.
 *
 * logstash实例注册表维护
 */
public interface LSRegister {
    /**
     * 将一个实例加入到注册列表
     */
    public void addToList(LsInstance instance);

    /**
     * 返回所有实例
     * @return
     */
    public List<LsInstance> listAll();

    /**
     * 返回一组
     * @param group
     * @return
     */
    public List<LsInstance> listByGroup(String group, Status status);

    /**
     * 从列表删除l
     * @param guid
     * @return
     */
    public int remove(String guid);
}
