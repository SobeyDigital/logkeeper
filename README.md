# logkeeper
***对logstash集群进行监控和控制，以及高可用管理***

# why

logstash功能强大好用，非常适合一个做初期数据处理的团队来作为ETL的核心部件使用
但是
- 它的集群本身没有有效的管理机制
- 配置方式也没有可视化或者负载均衡的手段

因此，我们提供了这个组件

# 主要功能

1. 维护logstash实例列表

> shard（固定）
> shardGroup
> standby

2. 实例启停

> ssh命令式
> hive云管式
> 发现实例并加入维护列表

3. 配置文件分发路由

> 配置更新（重置目标库）

4. 实例状态监控，UI化操作
