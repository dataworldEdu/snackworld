package edu.dataworld.snackworld.standard.service.impl;

import edu.dataworld.snackworld.standard.service.StandardService;
import edu.dataworld.snackworld.standard.service.StandardVO;
import edu.dataworld.snackworld.user.service.impl.UserDAO;
import egovframework.rte.fdl.cmmn.EgovAbstractServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("StandardService")
public class StandardServiceImpl extends EgovAbstractServiceImpl implements StandardService {

    @Resource(name="StandardDAO")
    private StandardDAO standardDAO;

    @Override
    public StandardVO getUserStandard(String userId) {
        return standardDAO.getUserStandard(userId);
    }
}
