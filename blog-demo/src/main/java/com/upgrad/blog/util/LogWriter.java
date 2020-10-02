//************************DONE**************************
package com.upgrad.blog.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

/**
 * TODO: 8.1. Implement writeLog() method with the following method signature.
 * public void writeLog(String logMessage, String path)
 * This method should append the log message to the log file that is stored at the
 * Input path.
 */

public class LogWriter {

    /**
     *
     * @param text
     * @param path
     * @throws IOException
     */
    public void writeLog(String logMessage, String path) throws IOException {
        File file = new File(path);
        System.out.println(file.createNewFile());
        FileWriter fr = new FileWriter(file, true);
        fr.write(logMessage);
        fr.close();
    }
}