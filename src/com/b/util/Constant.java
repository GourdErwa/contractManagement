package com.b.util;

/**
 * @author wei.Li by 16/3/12
 */
public interface Constant {

    //项目名称
    String PRO_NAME = "建设项目工程费用管理信息系统";

    //项目描述,展示在首页中
    String PRO_NAME_DESCRIBE = "<br><br>&nbsp;&nbsp;&nbsp;&nbsp;费用管理信息系统以项目概算管理为核心，通过收集、加工、维护和使用工程建设造价信息，充分积累和分析造价管理资料，有效利用过去的数据来预测未来造价变化和发展的趋势，以期达到对工程造价实现合理确定与有效控制的目的。\n" +
            "<br><br><br>&nbsp;&nbsp;&nbsp;&nbsp;系统主要包括概预算、工程清单管理、决算管理等功能。";

    //Mysql 配置 , 建表语句见 src/目录下 sql.sql 文件.
    String URL = "jdbc:mysql://localhost/contractManagement?user=root&password=root&useUnicode=true&characterEncoding=utf-8";
}
