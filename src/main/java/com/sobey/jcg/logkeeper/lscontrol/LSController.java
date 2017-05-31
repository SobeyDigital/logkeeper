package com.sobey.jcg.logkeeper.lscontrol;

import com.sobey.jcg.logkeeper.domain.LsInstance;
import com.sobey.jcg.logkeeper.domain.OpStats;

/**
 * Created by WX on 2017/5/24.
 *
 * 对Logsztsah实例进行控制
 */
public interface LSController {
    /**
     * 通过某种方式启动一个实例
     * @param instance
     */
    public OpStats start(LsInstance instance);

    /**
     * 通过某种方式停止一个实例
     * @param guid
     * @return
     */
    public OpStats stop(String guid);

    /**
     * 将一组里面正在执行的实例，用新的替换掉
     * @param group
     * @param new_
     * @return
     */
    public OpStats changeRunner(String group, String new_);
}
