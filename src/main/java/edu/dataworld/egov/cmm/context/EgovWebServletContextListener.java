package edu.dataworld.egov.cmm.context;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class EgovWebServletContextListener implements ServletContextListener {
    private final Logger logger = LoggerFactory.getLogger(EgovWebServletContextListener.class);

    @Override
    public void contextInitialized(ServletContextEvent servletContextEvent) {
        logger.info("|--> Context Initialized ~ !!!! ");
    }

    @Override
    public void contextDestroyed(ServletContextEvent servletContextEvent) {
        logger.info("|--> Context Destroyed ~ !!!! ");
    }
}
