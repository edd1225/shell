/*
 * $Header: /var/lib/cvs/zjunicom/src/com/hollycrm/common/CSVObject.java,v 1.2 2003/12/11 03:59:16 tiankai Exp $
 * $Revision: 1.2 $
 * $Date: 2003/12/11 03:59:16 $
 * ====================================================================
 *
 * ����������������������޹�˾
 */

package shell.framework.taglib.support;

/**
 * <pre>
 * CSV�����
 * ���᷵��nullֵ��
 * <code>
 * String csvStr = "a,b,c";
 * CSVObject csvIter = new CSVObject(csvStr);
 * while (csvIter.hasMoreTokens()) {
 *     csvIter.nextToken(def);
 *     //csvIter.nextToken();
 * }
 * </code>
 * </pre>
 * @author ����
 * @version $Revision: 1.2 $ $Date: 2003/12/11 03:59:16 $
 */

public class CSVObject {

    public static final String CS = ",";
    private String csvStr = null;
    private String token = "";

    private int length = 0;
    private int tokenLength = 0;

    private boolean hasMoreTokens = false;

    /**
     * ��ʼ��CSVObject
     * @param csvStr csv
     */
    public CSVObject(String csvStr) {
        this.csvStr = csvStr;
        if (csvStr != null) {
            length = csvStr.length();
            if (csvStr.indexOf(CS) != -1) {
                hasMoreTokens = true;
            }
        }
    }

    /**
     *
     * @param tokens
     */
    public CSVObject(String[] tokens) {
        if (tokens != null) {
            StringBuffer sb = new StringBuffer();
            for (int i = 0; i < tokens.length; i++) {
                sb.append(tokens[i]);
                sb.append(CS);
            }
            csvStr = sb.toString();
        }
    }

    /**
     * ��һ��
     * @return ��null�ַ�
     */
    public String nextToken() {
        if (csvStr != null) {
            tokenLength = csvStr.indexOf(CS);
            //System.out.println("l: " + csvStr.length() + " tl:" + tokenLength);
            if (tokenLength != -1) {
                token = csvStr.substring(0, tokenLength);
                csvStr = csvStr.substring(tokenLength + 1);
                length = csvStr.length();
                //System.out.println("length" + length);
                //System.out.println("tokenLength" + tokenLength);
            }
            else {
                token = csvStr;
                csvStr = null;
                hasMoreTokens = false;
            }
        }
        return token;
    }

    /**
     * ��һ�У����Ϊ�մ�ʹ��def�滻��
     * @param def Ĭ��ֵ
     * @return ��null�ַ�
     */
    public String nextToken(String def) {
        String tmpToken = nextToken();
        return tmpToken.length() == 0 ? def : tmpToken;
    }

    /**
     * �Ƿ�����һ�С�
     * @return �Ƿ�
     */
    public boolean hasMoreTokens() {
        return hasMoreTokens;
    }

    /**
     *
     * @return csv
     */
    public String getCSV() {
        return csvStr;
    }
}
