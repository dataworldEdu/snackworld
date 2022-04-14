package edu.dataworld.snackworld.common;

import lombok.Getter;
import lombok.Setter;

@Getter @Setter
public class Search extends Pagination{

    private String searchType; // select box option
    private String keyword; // input box

}
