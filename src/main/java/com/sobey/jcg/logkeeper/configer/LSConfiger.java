package com.sobey.jcg.logkeeper.configer;

import com.sobey.jcg.logkeeper.domain.LSConfig;
import com.sobey.jcg.logkeeper.domain.OpStats;

/**
 * Created by WX on 2017/5/24.
 *
 * 所有的config，从这里进入
 */
public interface LSConfiger {
    /**
     * 向一个Group添加配置
     * @param group
     * @param config
     * @return
     */
    public OpStats addConfig(String group, LSConfig config);

    /**
     * 删除某一个组中的某一个配置
     * @param group
     * @param configGuid
     * @return
     */
    public OpStats delConfig(String configGuid);

    /**
     * 更新一个配置信息
     * @param group
     * @param config
     * @return
     */
    public OpStats updateConfig(String group, LSConfig config);
}
