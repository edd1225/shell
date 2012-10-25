/**
 * Copyright (c) 2012 by IKermi Inc. All Rights Reserved.
 * $Id: AbstractTreeValueObject.java $
 * $LastChangedDate: 2012-10-5 下午2:49:10 $
 *
 * This software is the proprietary information of IKermi, Inc.
 * Use is subject to license terms.
 */
package shell.framework.taglib.support;

import java.io.Serializable;

/**
 * <p> 视图层树的节点对象 </p>
 * 
 * @author ChangMing.Yang
 * @version 1.0 $LastChangedDate: 2012-10-5 下午2:49:10 $
 */
@SuppressWarnings("serial")
public class TreeViewObject implements Serializable {

	public final static int INIT_LEVEL   = 0;
	public final static int HAS_SUB_NODE = 1;
	public final static int NO_SUB_NODE  = 2; 

	//树节点唯一标志
	protected String id;
	//树节点显示名称
	protected String name;
	//父节点ID
	protected String parentID;
	//树节点的左侧遍历值
	protected int lft;
	//树节点的右侧遍历值
	protected int rgt;
	//扩展类型(目前用作是否有子孙) 数据库中没有该字段
	protected int type;
	//排序 
	protected int orderNO;
	//功能链接url
	protected String functionURL;
	//是否是菜单项
	protected String isMenu;
	//树形节点缩进层次，该属性由程序动态计算获取,数据库中没有该字段
	protected int level;
	
	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}
	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}
	/**
	 * @return the name
	 */
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the parentID
	 */
	public String getParentID() {
		return parentID;
	}
	/**
	 * @param parentID the parentID to set
	 */
	public void setParentID(String parentID) {
		this.parentID = parentID;
	}
	/**
	 * @return the type
	 */
	public int getType() {
		return type;
	}
	/**
	 * @param type the type to set
	 */
	public void setType(int type) {
		this.type = type;
	}
	/**
	 * @param orderNO the orderNO to set
	 */
	public void setOrderNO(int orderNO) {
		this.orderNO = orderNO;
	}
	/**
	 * @return the orderNO
	 */
	public int getOrderNO() {
		return orderNO;
	}
	/**
	 * @return the lft
	 */
	public int getLft() {
		return lft;
	}
	/**
	 * @param lft the lft to set
	 */
	public void setLft(int lft) {
		this.lft = lft;
	}
	/**
	 * @return the rgt
	 */
	public int getRgt() {
		return rgt;
	}
	/**
	 * @param rgt the rgt to set
	 */
	public void setRgt(int rgt) {
		this.rgt = rgt;
	}
	/**
	 * @return the functionURL
	 */
	public String getFunctionURL() {
		return functionURL;
	}
	/**
	 * @param functionURL the functionURL to set
	 */
	public void setFunctionURL(String functionURL) {
		this.functionURL = functionURL;
	}
	/**
	 * @return the isMenu
	 */
	public String getIsMenu() {
		return isMenu;
	}
	/**
	 * @param isMenu the isMenu to set
	 */
	public void setIsMenu(String isMenu) {
		this.isMenu = isMenu;
	}
	/**
	 * @return the level
	 */
	public int getLevel() {
		return level;
	}
	/**
	 * @param level the level to set
	 */
	public void setLevel(int level) {
		this.level = level;
	}
	
	
}
