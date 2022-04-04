package edu.dataworld.egov.cmm;

import egovframework.rte.fdl.cmmn.exception.handler.ExceptionHandler;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class EgovComExcepHndlr implements ExceptionHandler {

    private static final Logger LOGGER = LoggerFactory.getLogger(EgovComExcepHndlr.class);

    @Override
    public void occur(Exception e, String packageName) {
        LOGGER.error(packageName, e);
    }
}
