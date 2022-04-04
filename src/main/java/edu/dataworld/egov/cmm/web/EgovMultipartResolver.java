package edu.dataworld.egov.cmm.web;

import edu.dataworld.egov.cmm.service.EgovProperties;
import org.apache.commons.fileupload.FileItem;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import javax.servlet.ServletContext;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class EgovMultipartResolver extends CommonsMultipartResolver {

    private static final Logger LOGGER = LoggerFactory.getLogger(EgovMultipartResolver.class);

    public EgovMultipartResolver() {
    }

    /**
     * 첨부파일 처리를 위한 multipart resolver를 생성한다.
     *
     * @param servletContext
     */
    public EgovMultipartResolver(ServletContext servletContext) {
        super(servletContext);
    }

    /**
     * multipart에 대한 parsing을 처리한다.
     */
    @Override
    protected MultipartParsingResult parseFileItems(List<FileItem> fileItems, String encoding) {

        // 스프링 3.0변경으로 수정한 부분
        MultiValueMap<String, MultipartFile> multipartFiles = new LinkedMultiValueMap<String, MultipartFile>();
        Map<String, String[]> multipartParameters = new HashMap<String, String[]>();
        String whiteListFileUploadExtensions = EgovProperties.getProperty("Globals.fileUpload.Extensions");

        // Extract multipart files and multipart parameters.
        for (Iterator<FileItem> it = fileItems.iterator(); it.hasNext();) {
            FileItem fileItem = it.next();

            if (fileItem.isFormField()) {

                String value = null;
                if (encoding != null) {
                    try {
                        value = fileItem.getString(encoding);
                    } catch (UnsupportedEncodingException ex) {
                        LOGGER.warn("Could not decode multipart item '{}' with encoding '{}': using platform default",
                                fileItem.getFieldName(), encoding);
                        value = fileItem.getString();
                    }
                } else {
                    value = fileItem.getString();
                }
                String[] curParam = (String[]) multipartParameters.get(fileItem.getFieldName());
                if (curParam == null) {
                    // simple form field
                    multipartParameters.put(fileItem.getFieldName(), new String[] { value });
                } else {
                    // array of simple form fields
                    String[] newParam = StringUtils.addStringToArray(curParam, value);
                    multipartParameters.put(fileItem.getFieldName(), newParam);
                }
            }
        }

        return new MultipartParsingResult(multipartFiles, multipartParameters, null);
    }
}
