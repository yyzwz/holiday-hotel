package cn.zwz.config.security;

import cn.zwz.common.utils.NameUtil;
import cn.zwz.modules.base.entity.User;
import cn.zwz.common.exception.LoginFailLimitException;
import cn.zwz.modules.base.service.UserService;
import cn.hutool.core.util.StrUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.StringRedisTemplate;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import java.util.concurrent.TimeUnit;

/**
 * @author 郑为中
 */
@Slf4j
@Component
public class UserDetailsServiceImpl implements UserDetailsService {

    @Autowired
    private StringRedisTemplate redisTemplate;

    @Autowired
    private UserService userService;

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

        String flagKey = "loginFailFlag:" + username;
        String value = redisTemplate.opsForValue().get(flagKey);
        Long timeRest = redisTemplate.getExpire(flagKey, TimeUnit.MINUTES);
        if(StrUtil.isNotBlank(value)){
            // 超过限制次数
            throw new LoginFailLimitException("登录错误次数超过限制，请"+timeRest+"分钟后再试");
        }
        User user;
        if(NameUtil.mobile(username)){
            user = userService.findByMobile(username);
        }else if(NameUtil.email(username)){
            user = userService.findByEmail(username);
        }else{
            user = userService.findByUsername(username);
        }
        return new SecurityUserDetails(user);
    }
}
