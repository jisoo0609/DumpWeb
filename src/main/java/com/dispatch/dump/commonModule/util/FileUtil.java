package com.dispatch.dump.commonModule.util;

import com.dispatch.dump.commonModule.db.dto.FileDTO;
import com.dispatch.dump.commonModule.db.mapper.FileMapper;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.activation.MimetypesFileTypeMap;
import javax.servlet.http.HttpServletResponse;
import java.io.*;
import java.net.URLEncoder;
import java.util.UUID;

@Service
@RequiredArgsConstructor
public class FileUtil {

    private final Logger log = LoggerFactory.getLogger(this.getClass());
    private final FileMapper fileMapper;


    @Value("${file.upload.path}")
    private String UPLOAD_PATH;

    public void fileUpload(MultipartFile file, long sheetID) {
        try {
            String fileName =  file.getOriginalFilename();
            String uuid = UUID.randomUUID().toString();
            String ext = getExtension(fileName);
            String uploadFilePath = UPLOAD_PATH + uuid;

            File uploadFile = new File(uploadFilePath);
            FileDTO fileDTO = new FileDTO();

            file.transferTo(uploadFile);

            fileDTO.setFileName(fileName);
            fileDTO.setUuid(uuid);
            fileDTO.setExt(ext);
            fileDTO.setSheetID(sheetID);

            fileMapper.insertFileInfoBySheetID(fileDTO);
            log.info(fileName);
        } catch (IOException e) {
            log.error("Excepetion ["+ e.getMessage() +"]");
        }


    }



    public void getImageFile(HttpServletResponse response, int idx) {

        FileDTO fileInfo = fileMapper.findFileInfoBySheetID(idx);

        File downloadFile = new File(UPLOAD_PATH + fileInfo.getUuid());

        log.info(fileInfo.getFileName());

        try {
            String mime = new MimetypesFileTypeMap().getContentType(fileInfo.getFileName());
            response.setContentType(mime);
            response.setHeader("Content-Disposition", "attachment; filename=\"" + URLEncoder.encode(fileInfo.getFileName(), "UTF-8") + "\"");
            InputStream is = new FileInputStream(downloadFile);
            int len;
            byte[] buffer = new byte[1024];
            OutputStream os = response.getOutputStream();
            while ((len = is.read(buffer)) > -1) {
                os.write(buffer, 0 ,len);
            }

            os.flush();
            os.close();

        } catch (Exception e) {
            log.error("Excepetion ["+ e.getMessage() +"]");
        }

    }

    public boolean deleteImageFile(int idx) {

        boolean result = false;

        FileDTO fileInfo = fileMapper.findFileInfoBySheetID(idx);

        File deleteFile = new File(UPLOAD_PATH + fileInfo.getUuid());

        log.info(fileInfo.getFileName());

        try {

            if (deleteFile.delete()) {
                result = true;
            } else {
                result = false;
            }


        } catch (Exception e) {
            log.error("Excepetion ["+ e.getMessage() +"]");
        }

        return result;

    }

    public void updateImageFile(MultipartFile file, int idx) {

        FileDTO fileInfo = fileMapper.findFileInfoBySheetID(idx);

        File orgFile = new File(UPLOAD_PATH + fileInfo.getUuid());

        log.info(fileInfo.getFileName());

        try {
            String fileName =  file.getOriginalFilename();
            String ext = getExtension(fileName);


            file.transferTo(orgFile);

            FileDTO fileDTO = new FileDTO();

            fileDTO.setFileName(fileName);
            fileDTO.setExt(ext);
            fileDTO.setSheetID(fileInfo.getSheetID());

//            fileMapper.updateFileInfoBySheetID(fileDTO);





        } catch (Exception e) {
            log.error("Excepetion ["+ e.getMessage() +"]");
        }

    }

    public String getExtension(String fileName) {
        return fileName.substring(fileName.lastIndexOf(".") + 1);
    }

}
