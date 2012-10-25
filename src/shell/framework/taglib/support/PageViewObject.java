/*
 * $Header: /var/lib/cvs/zjunicom/src/com/hollycrm/callcenter/foundation/util/PageViewObject.java,v 1.2 2003/12/11 03:59:23 tiankai Exp $
 * $Revision: 1.2 $
 * $Date: 2003/12/11 03:59:23 $
 * ====================================================================
 *
 * ����������������������޹�˾
 */

package shell.framework.taglib.support;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

/**
 * �����ҳ��ʾ����ݴ������
 * @author Tian Kai
 * @version $Revision: 1.2 $ $Date: 2003/12/11 03:59:23 $
 */

public class PageViewObject
    implements Serializable {

    /**
     * �������
     */
    private int totalCount = 0;

    /**
     * ��ҳ��
     */
    private int totalPage = -1;

    /**
     * ÿҳ��ʾ��
     */
    private int perPageCount = 0;

    /**
     * �������Ϣ����ֵ��
     */
    private Map columnInfo = new HashMap();

    /**
     * ����ݵļ��ϣ����ж���Ϊʵ����jakarda common beanutils�е�DynaBean�ӿڶ���
     */
    private Collection rowList = new ArrayList();

    /*
     ��ȡ����
     */

    public int getTotalCount() {
        return totalCount;
    }

    public void setTotalCount(int totalCount) {
        this.totalCount = totalCount;
    }

    public int getTotalPage() {
        if (totalPage < 0)
        totalPage = (int) Math.ceil( (double) totalCount /
                                        (double) perPageCount);
        return totalPage;
    }

    public Collection getRowList() {
        return rowList;
    }

    public void setRowList(Collection rowList) {
        this.rowList = rowList;
    }

    public int getPerPageCount() {
        return perPageCount;
    }

    public void setPerPageCount(int perPageCount) {
        this.perPageCount = perPageCount;
    }

    public Map getColumnInfo() {
        return columnInfo;
    }

    public void setColumnInfo(Map columnInfo) {
        this.columnInfo = columnInfo;
    }
}
