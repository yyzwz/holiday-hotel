package cn.zwz.common.utils;

import com.google.gson.Gson;
import lombok.extern.slf4j.Slf4j;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

/**
 * @author 郑为中
 */
@Slf4j
public class ResponseUtil {

    /**
     *  使用response输出JSON
     * @param response
     * @param resultMap
     */
    public static void out(HttpServletResponse response, Map<String, Object> resultMap){

        ServletOutputStream out = null;
        try {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json;charset=UTF-8");
            out = response.getOutputStream();
            out.write(new Gson().toJson(resultMap).getBytes());
        } catch (Exception e) {
            log.error(e + "输出JSON出错");
        } finally{
            if(out!=null){
                try {
                    out.flush();
                    out.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public static Map<String, Object> resultMap(boolean flag, Integer code, String msg){

        return resultMap(flag, code, msg, null);
    }

    public static Map<String, Object> resultMap(boolean flag, Integer code, String msg, Object data){

        Map<String, Object> resultMap = new HashMap<String, Object>(16);
        resultMap.put("success", flag);
        resultMap.put("message", msg);
        resultMap.put("code", code);
        resultMap.put("timestamp", System.currentTimeMillis());
        if(data!=null){
            resultMap.put("result", data);
        }
        return resultMap;
    }
}
