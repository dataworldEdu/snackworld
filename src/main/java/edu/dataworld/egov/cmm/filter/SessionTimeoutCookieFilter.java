package edu.dataworld.egov.cmm.filter;

import javax.servlet.*;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SessionTimeoutCookieFilter implements Filter {

    @SuppressWarnings("unused")
    private FilterConfig config;

    @Override
    public void init(FilterConfig config) throws ServletException {
        this.config = config;
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        long serverTime = System.currentTimeMillis();
        long sessionExpireTime = serverTime + httpRequest.getSession().getMaxInactiveInterval() * 1000;
        Cookie cookie = new Cookie("egovLatestServerTime", "" + serverTime);
        //cookie.setSecure(true);
        cookie.setPath("/");
        httpResponse.addCookie(cookie);
        cookie = new Cookie("egovExpireSessionTime", "" + sessionExpireTime);
        cookie.setPath("/");

        Date dateServer = new Date(serverTime);
        Date dateExpiry = new Date(sessionExpireTime);
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        String serverYMD = format.format(dateServer);
        String expiryYMD = format.format(dateExpiry);

        httpResponse.addCookie(cookie);

        chain.doFilter(request, response);
    }

    @Override
    public void destroy() {

    }
}
