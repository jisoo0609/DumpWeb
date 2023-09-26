package com.dispatch.dump.commonModule.util;

import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class FileUtil {

    private final Logger log = LoggerFactory.getLogger(this.getClass());


    @Value("${file.upload.path}")
    private String UPLOAD_PATH;

    public void fileUpload(MultipartFile file) {
        try {
            String fileName =  file.getOriginalFilename();
            String uuid = UUID.randomUUID().toString();
            String ext = getExtension(fileName);
            String uploadFilePath = UPLOAD_PATH + uuid + "." + ext;

            File uploadFile = new File(uploadFilePath);

            file.transferTo(uploadFile);
            log.info(fileName);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }


    }

    public String getExtension(String fileName) {
        return fileName.substring(fileName.lastIndexOf(".") + 1);
    }

}
