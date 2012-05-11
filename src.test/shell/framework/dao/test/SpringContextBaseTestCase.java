package shell.framework.dao.test;

import org.springframework.test.AbstractTransactionalDataSourceSpringContextTests;

/**
 * 测试基类，用于获取sping上下文环境
 * @author yangchangming
 *
 */
@SuppressWarnings("all")
public abstract class SpringContextBaseTestCase extends AbstractTransactionalDataSourceSpringContextTests {
	
	@Override
	protected String[] getConfigLocations() {
		return new String[] {"classpath:applicationContext.xml"};
	}

}
