package cn.zwz.config.security.jwt;

import cn.zwz.common.utils.ResponseUtil;
import cn.zwz.common.exception.LoginFailLimitException;
import cn.zwz.config.properties.ZwzTokenProperties;
import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.concurrent.TimeUnit;

/**
 * @author 郑为中
 */
@Slf4j
@Component
public class AuthenticationFailHandler extends SimpleUrlAuthenticationFailureHandler {

    @Autowired
    private ZwzTokenProperties tokenProperties;

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException e) throws IOException, ServletException {

        if (e instanceof UsernameNotFoundException || e instanceof BadCredentialsException) {
            String username = request.getParameter("username");
            recordLoginTime(username);
            String key = "loginTimeLimit:"+username;
            String value = redisTemplate.opsForValue().get(key);
            if(StrUtil.isBlank(value)){
                value = "0";
            }
            //获取已登录错误次数
            int loginFailTime = Integer.parseInt(value);
            int restLoginTime = tokenProperties.getLoginTimeLimit() - loginFailTime;
            log.info("用户"+username+"登录失败，还有"+restLoginTime+"次机会");
            if(restLoginTime<=3&&restLoginTime>0){
                ResponseUtil.out(response, ResponseUtil.resultMap(false,500,"用户名或密码错误，还有"+restLoginTime+"次尝试机会"));
            } else if(restLoginTime<=0) {
                ResponseUtil.out(response, ResponseUtil.resultMap(false,500,"登录错误次数超过限制，请"+tokenProperties.getLoginAfterTime()+"分钟后再试"));
            } else {
                ResponseUtil.out(response, ResponseUtil.resultMap(false,500,"用户名或密码错误"));
            }
        } else if (e instanceof DisabledException) {
            ResponseUtil.out(response, ResponseUtil.resultMap(false,500,"账户被禁用，请联系管理员"));
        } else if (e instanceof LoginFailLimitException){
            ResponseUtil.out(response, ResponseUtil.resultMap(false,500,((LoginFailLimitException) e).getMsg()));
        } else {
            ResponseUtil.out(response, ResponseUtil.resultMap(false,500,"登录失败，其他内部错误"));
        }
    }

    /**
     * 判断用户登陆错误次数
     */
    public boolean recordLoginTime(String username){

        String key = "loginTimeLimit:"+username;
        String flagKey = "loginFailFlag:"+username;
        String value = redisTemplate.opsForValue().get(key);
        if(StrUtil.isBlank(value)){
            value = "0";
        }
        // 获取已登录错误次数
        Integer loginFailTime = Integer.parseInt(value) + 1;
        redisTemplate.opsForValue().set(key, loginFailTime.toString(), tokenProperties.getLoginAfterTime(), TimeUnit.MINUTES);
        if(loginFailTime>=tokenProperties.getLoginTimeLimit()){
            redisTemplate.opsForValue().set(flagKey, "fail", tokenProperties.getLoginAfterTime(), TimeUnit.MINUTES);
            return false;
        }
        return true;
    }
}
