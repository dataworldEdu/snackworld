package edu.dataworld.snackworld.standard.service.impl;

import edu.dataworld.egov.cmm.service.impl.EgovComAbstractDAO;
import edu.dataworld.snackworld.standard.service.StandardVO;
import org.springframework.stereotype.Repository;

@Repository("StandardDAO")
public class StandardDAO extends EgovComAbstractDAO {

    public StandardVO getUserStandard(String userId) {
        return selectOne("standard.getUserStandard", userId);
    }

    public int addStandard(StandardVO vo) {
        return insert("standard.addStandard", vo);
    }

    public void setDelStandard(StandardVO vo) {
        update("standard.setDelStandard", vo);
    }

    public int updatdStandard(StandardVO vo) {
        return update("standard.updatdStandard", vo);
    }
}
