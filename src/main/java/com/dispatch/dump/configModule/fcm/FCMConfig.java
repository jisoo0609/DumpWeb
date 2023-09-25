package com.dispatch.dump.configModule.fcm;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

import java.io.FileInputStream;
import java.io.IOException;

@Configuration
public class FCMConfig {

    @Autowired
    private ResourceLoader resourceLoader;
    public void initializeFCM() throws IOException {
        //web push성공하면 회사 key.json 파일로 바꾸기
        Resource resource=resourceLoader.getResource("classpath:static/json/fir-215dd-firebase-adminsdk-qci0q-cbbd161e2a.json");

        System.out.println(resource.getFile().getAbsolutePath());
        System.out.println(resource.getFile());

        FileInputStream serviceAccount =
                new FileInputStream(resource.getFile());

        FirebaseOptions options = new FirebaseOptions.Builder()
                .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                //.setDatabaseUrl("https://<DATABASE_NAME>.firebaseio.com/")
                .build();

        FirebaseApp.initializeApp(options);
    }
}


