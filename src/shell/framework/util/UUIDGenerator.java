/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: UuidGenerator.java $
 * $LastChangedDate: 2012-6-12 下午8:31:06 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.util;

import java.util.UUID;

/**
 * <p> 业务主键生成类，生成32位大写主键 </p>
 * 如： B3EF67450D804258955987046A1C1DE6
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-6-12 下午8:31:06 $
 */
public class UUIDGenerator {

	public static String generate(){
		return UUID.randomUUID().toString().replace("-", "").toUpperCase();
	}
}
