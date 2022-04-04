package edu.dataworld.egov.cmm.filter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;
import java.util.Map;

public class HTMLTagFilterRequestWrapper extends HttpServletRequestWrapper {

    // Tag 화이트 리스트 ( 허용할 태그 등록 )
    static private String[] whiteListTag = { "<p>","</p>","<br />" };

    public HTMLTagFilterRequestWrapper(HttpServletRequest request) {
        super(request);
    }

    public String[] getParameterValues(String parameter) {

        String[] values = super.getParameterValues(parameter);

        if(values==null){
            return null;
        }

        for (int i = 0; i < values.length; i++) {
            if (values[i] != null) {
                values[i] = getSafeParamData(values[i]);
            } else {
                values[i] = null;
            }
        }

        return values;
    }

    public String getParameter(String parameter) {

        String value = super.getParameter(parameter);

        if(value==null){
            return null;
        }

        value = getSafeParamData(value);
        return value;
    }

    /**
     * Map으로 바인딩된 경우를 처리한다.
     *
     * @return  Map - String Type Key / String배열타입 값
     */
    public Map<String, String[]> getParameterMap() {
        Map<String, String[]> valueMap = super.getParameterMap();

        String[] values;
        for( String key : valueMap.keySet() ){
            values = valueMap.get(key);

            for (int i = 0; i < values.length; i++) {
                if (values[i] != null) {
                    values[i] = getSafeParamData(values[i]);
                    //System.out.println( "[HTMLTagFilter getParameterMap] "+ key + "===>>>"+values[i] );
                } else {
                    values[i] = null;
                }
            }
        }

        return valueMap;
    }

    private String getSafeParamData(String value) {
        StringBuffer strBuff = new StringBuffer();

        for (int i = 0; i < value.length(); i++) {
            char c = value.charAt(i);
            switch (c) {
                case '<':
                    if ( checkNextWhiteListTag(i, value) == false )
                        strBuff.append("&lt;");
                    else
                        strBuff.append(c);
                    break;
                case '>':
                    if ( checkPrevWhiteListTag(i, value) == false )
                        strBuff.append("&gt;");
                    else
                        strBuff.append(c);
                    break;
                case '"':
                    strBuff.append("&quot;");
                    break;
                case '\'':
                    strBuff.append("&apos;");
                    break;
                default:
                    strBuff.append(c);
                    break;
            }
        }

        value = strBuff.toString();
        return value;
    }

    private boolean checkNextWhiteListTag(int index, String data) {
        String extractData = "";
        int endIndex = 0;
        for(String whiteListData: whiteListTag) {
            endIndex = index+whiteListData.length();
            if ( data.length() > endIndex )
                extractData = data.substring(index, endIndex);
            else
                extractData = "";
            if ( whiteListData.equals(extractData) ) return true; // whiteList 대상으로 판정
        }

        return false;
    }

    private boolean checkPrevWhiteListTag(int index, String data) {
        String extractData = "";
        int beginIndex = 0;
        int endIndex = 0;
        for(String whiteListData: whiteListTag) {
            beginIndex = index-whiteListData.length()+1;
            endIndex = index+1;
            if ( beginIndex >= 0 )
                extractData = data.substring(beginIndex, endIndex);
            else
                extractData = "";
            if ( whiteListData.equals(extractData) ) return true; // whiteList 대상으로 판정
        }

        return false;
    }
}
