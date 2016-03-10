package com.b.util;

import javax.servlet.ServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * @author wei.Li by 16/3/10
 */
public class PrintWriterUtil {

    public static void printWriterObjectToJson(ServletResponse response, Object o)
            throws IOException {

        PrintWriter out = null;
        try {
            out = response.getWriter();
            out.print(JSONTransform.jsonTransform(o));
        } finally {
            if (out != null) {
                out.close();
            }
        }

    }
}
