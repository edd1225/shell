package shell.framework.cache;

import java.util.List;

import net.sf.ehcache.CacheManager;

import org.apache.log4j.Logger;
import org.apache.log4j.spi.LoggingEvent;

import shell.framework.cache.support.CacheException;
import shell.framework.core.DefaultBeanFactory;

/**
 * <p> 制造cache的统一工厂，根据注入的具体缓存策略来制造 </p>
 *
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-4-10 下午3:21:31 $
 */
@SuppressWarnings("all")
public class CacheFactory {

	public static String CACHEFACTORY_BEAN_ID = "cacheFactory";
	
	private static Logger logger = Logger.getLogger(CacheFactory.class);
	
	/**
	 * 具体缓存策略
	 */
	private CacheProvider cacheProvider;
	

	/**
	 * @return the cacheProvider
	 */
	public CacheProvider getCacheProvider() {
		return cacheProvider;
	}


	/**
	 * @param cacheProvider the cacheProvider to set
	 */
	public void setCacheProvider(CacheProvider cacheProvider) {
		this.cacheProvider = cacheProvider;
	}

	
	/**
	 * 制造cache
	 * @param reginName 缓存业务名称
	 * @return the Cache 
	 */
	public Cache buildCache(String regionName){
		return cacheProvider.buildCache(regionName);
	}
}
