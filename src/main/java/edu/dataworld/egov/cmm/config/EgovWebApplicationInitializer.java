package edu.dataworld.egov.cmm.config;

import edu.dataworld.egov.cmm.context.EgovWebServletContextListener;
import egovframework.rte.ptl.mvc.filter.HTMLTagFilter;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.WebApplicationInitializer;
import org.springframework.web.context.ContextLoaderListener;
import org.springframework.web.context.request.RequestContextListener;
import org.springframework.web.context.support.XmlWebApplicationContext;
import org.springframework.web.filter.CharacterEncodingFilter;
import org.springframework.web.servlet.DispatcherServlet;

import javax.servlet.FilterRegistration;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRegistration;

public class EgovWebApplicationInitializer implements WebApplicationInitializer {

    private static final Logger logger = LoggerFactory.getLogger(EgovWebApplicationInitializer.class);

    @Override
    public void onStartup(ServletContext servletContext) throws ServletException {
        logger.info("EgovWebApplicationInitializer START-============================================");
        servletContext.addListener(new EgovWebServletContextListener());

        // Servlet Filter 설정
        FilterRegistration.Dynamic characterEncoding = servletContext.addFilter("encodingFilter", new CharacterEncodingFilter());
        characterEncoding.setInitParameter("encoding", "UTF-8");
        characterEncoding.setInitParameter("forceEncoding", "true");
        characterEncoding.addMappingForUrlPatterns(null, false, "*.do");

        // Root Context 설정
        XmlWebApplicationContext rootContext = new XmlWebApplicationContext();
        rootContext.setConfigLocations(new String[] {"classpath*:edu/dataworld/spring/com/**/context-*.xml"});
        rootContext.refresh();
        rootContext.start();

        servletContext.addListener(new ContextLoaderListener(rootContext));

        // Servlet Context 설정
        XmlWebApplicationContext xmlWebApplicationContext = new XmlWebApplicationContext();
        xmlWebApplicationContext.setConfigLocation("/WEB-INF/config/egovframework/springmvc/egov-com-*.xml");

        ServletRegistration.Dynamic dispatcher = servletContext.addServlet("dispatcher", new DispatcherServlet(xmlWebApplicationContext));
        dispatcher.addMapping("/");
        dispatcher.setLoadOnStartup(1);

        // Html tag 에 대한 필터링 적용
        FilterRegistration.Dynamic htmlTagFiler = servletContext.addFilter("htmlTagFilter", new HTMLTagFilter());
        htmlTagFiler.addMappingForUrlPatterns(null, false, "*.do");

        // 세션 타임아웃 필터
//        FilterRegistration.Dynamic sessionTimeoutFilter = servletContext.addFilter("sessionTimeoutFilter", new SessionTimeoutCookieFilter());
//        sessionTimeoutFilter.addMappingForUrlPatterns(null, false, "*.do");
//
        servletContext.addListener(new RequestContextListener());

        logger.debug("EgovWebApplicationInitializer END-============================================");
    }
}
