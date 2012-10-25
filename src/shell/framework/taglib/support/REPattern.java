package shell.framework.taglib.support;

public class REPattern {
    public final static String ComplexPrefix =
        "complex:";
    public final static String M_EMAIL =
        "^[_.0-9a-z-]+@([0-9a-z][0-9a-z]+.)+[a-z]{2,3}$";
    public final static String M_NUMBER =
        "^\\d+$";
    public final static String M_TELEPHONE_NUMBER =
        "^\\d{8}$";
    public final static String M_MOBILE_NUMBER =
        "^(13|013)\\d{9}$";
    public final static String M_YEAR_MONTH_DAY =
        "^(199|200)\\d-(0|1)\\d-[0123]\\d$";
    public final static String M_USER_ID =
        "^\\d{4}$";
    public final static String M_HOUR_MIN =
        "^(0|1|2)\\d:[0123456]\\d$";
}
