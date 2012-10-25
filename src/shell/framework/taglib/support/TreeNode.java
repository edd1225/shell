package shell.framework.taglib.support;

/**
 *
 * <p>Title: </p>
 * <p>Description: </p>
 * <p>Copyright: Copyright (c) 2004</p>
 * <p>Company: </p>
 * @author not attributable
 * @version 1.0
 */

public interface TreeNode {

    public String getID();

    public void setID(String ID);

    public String getName();

    public void setName(String name);

    public String getParentID();

    public void setParentID(String parentID);

    public int getIsLeaf();

    public void setIsLeaf(int isLeaf);
}
