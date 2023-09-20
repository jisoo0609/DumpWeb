package com.dispatch.dump.configModule.fcm;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import org.springframework.context.annotation.Configuration;

import java.io.FileInputStream;
import java.io.IOException;

@Configuration
public class FCMConfig {
    public void initializeFCM() throws IOException {
        FileInputStream serviceAccount =
                new FileInputStream("C:/DumpWeb_git/src/main/resources/static/json/fir-215dd-firebase-adminsdk-qci0q-cbbd161e2a.json");

        FirebaseOptions options = new FirebaseOptions.Builder()
                .setCredentials(GoogleCredentials.fromStream(serviceAccount))
                //.setDatabaseUrl("https://<DATABASE_NAME>.firebaseio.com/")
                .build();

        FirebaseApp.initializeApp(options);
    }
}


