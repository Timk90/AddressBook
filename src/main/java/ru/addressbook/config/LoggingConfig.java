package main.java.ru.addressbook.config;

import ch.qos.logback.classic.LoggerContext;
import ch.qos.logback.classic.joran.JoranConfigurator;
import ch.qos.logback.core.joran.spi.JoranException;
import ch.qos.logback.core.util.FileUtil;
import org.slf4j.LoggerFactory;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

public class LoggingConfig {

    public static void config(){
            LoggerContext loggerContext = (LoggerContext) LoggerFactory.getILoggerFactory();
            loggerContext.reset();

            JoranConfigurator configurator = new JoranConfigurator();
            InputStream configStream = null;
        try {
//            ClassLoader classLoader = ClassLoader.getSystemClassLoader();
//            String path = classLoader.getResource("main/resources/logging/logback.xml").getPath();
            configStream = Files.newInputStream(Paths.get("/WEB-INF/classes/main/resources/logging/logback.xml"));
            configurator.setContext(loggerContext);
            configurator.doConfigure(configStream); // loads logback file
            configStream.close();
        } catch (IOException e) {
            e.printStackTrace();
        } catch (JoranException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        ClassLoader classLoader = ClassLoader.getSystemClassLoader();
        //String path = classLoader.getResource("Dlogback.configurationFile").getPath();
        System.out.println("Dlogback.configurationFile");
    }
}
