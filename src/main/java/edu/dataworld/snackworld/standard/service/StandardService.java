package edu.dataworld.snackworld.standard.service;

public interface StandardService {

    StandardVO getUserStandard(String userId);

    int addStandard(StandardVO vo);

    void setDelStandard(StandardVO vo);

    int updatdStandard(StandardVO vo);
}
