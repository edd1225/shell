/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * InterfaceName: shell.framework.mapper.TestMapper.java
 * CreatedTime: 13-1-22 下午3:34
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */

package shell.framework.mapper;

/**
 * <p> mybatis映射器测试  </p>
 *
 * @author changming.Y
 * @version 1.0   13-1-22 下午3:34
 */
public interface TestMapper {

    void getUserByID(String userCode);
}