package com.lr.manage.common.shiro;

import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;

import java.util.ArrayList;
import java.util.List;

/**
 * 自定义Realm AuthorizingRealm将获取的Subject相关信息分成两步 主要实现认证和授权的管理操作
 *
 * @author dell
 */
public class OwnSystemRealm extends AuthorizingRealm {
    /**
     * &#x83b7;&#x53d6;&#x6743;&#x9650;
     * @return
     */
    protected AuthorizationInfo doGetAuthorizationInfo() {
        return doGetAuthorizationInfo();
    }

    /**
     * &#x83b7;&#x53d6;&#x6743;&#x9650;
     * @param principalCollection
     * @return
     */
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principalCollection) {
        // 获取身份信息
        String username = (String) principalCollection.getPrimaryPrincipal();
        // 根据身份信息从数据库中查询权限数据

        // 这里使用静态数据模拟
        List<String> permissions = new ArrayList<>();
        permissions.add("user:*");
        permissions.add("department:*");

        // 将权限信息封闭为AuthorizationInfo
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo();
        // 模拟数据，添加 manager 角色
        simpleAuthorizationInfo.addRole("manager");

        for(String permission:permissions){
            simpleAuthorizationInfo.addStringPermission(permission);
        }

        return simpleAuthorizationInfo;

    }

    /**
     * 数据认证
     * @param authenticationToken
     * @return
     * @throws AuthenticationException
     */
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken authenticationToken) throws AuthenticationException {
        // 从 token 中获取用户身份信息
        String username = (String) authenticationToken.getPrincipal();
        // 通过 username 从数据库中查询

        // 如果查询不到则返回 null
        if(!username.equals("luorong")){//这里模拟查询不到
            return null;
        }

        //获取从数据库查询出来的用户密码
        String dbPassword = "123456";//这里使用静态数据模拟

        //返回认证信息由父类 AuthenticatingRealm 进行认证
        SimpleAuthenticationInfo simpleAuthenticationInfo = new SimpleAuthenticationInfo(username, dbPassword, getName());
        return simpleAuthenticationInfo;
    }
}
