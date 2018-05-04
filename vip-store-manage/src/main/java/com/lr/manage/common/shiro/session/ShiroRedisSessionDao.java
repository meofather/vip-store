package com.lr.manage.common.shiro.session;

import com.lr.manage.common.shiro.SerializeUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.apache.shiro.session.Session;
import org.apache.shiro.session.UnknownSessionException;
import org.apache.shiro.session.mgt.eis.AbstractSessionDAO;

import java.io.Serializable;
import java.util.Collection;

public class ShiroRedisSessionDao extends AbstractSessionDAO {

    private static Log logger = LogFactory.getLog(ShiroRedisSessionDao.class);
    /**
     * shiro-redis的session对象前缀
     */
    private ShiroRedis shiroRedis;

    @Override
    public void update(Session session) throws UnknownSessionException {
        this.saveSession(session);
    }

    /**
     * save session
     *
     * @param session
     * @throws UnknownSessionException
     */
    private void saveSession(Session session) throws UnknownSessionException {
        if (session == null || session.getId() == null) {
            return;
        }

        try {
            shiroRedis.updateCached(getByteKey(session.getId()), SerializeUtils.serialize(session), shiroRedis.getExpire());
            session.setTimeout(shiroRedis.getExpire());
        } catch (Exception e) {
            logger.error( "saveSession",e);
        }
       /* byte[] key = getByteKey(session.getId());
        byte[] value = SerializeUtils.serialize(session);
        session.setTimeout(redisManager.getExpire());
        this.redisManager.set(key, value, redisManager.getExpire());*/
    }

    @Override
    public void delete(Session session) {
        if (session == null || session.getId() == null) {
            return;
        }

        try {
            shiroRedis.deleteCached(this.getByteKey(session.getId()));
        } catch (Exception e) {
            logger.error("delete",e);
        }

        //redisManager.del(this.getByteKey(session.getId()));

    }

    @Override
    public Collection<Session> getActiveSessions() {
        try {
            return shiroRedis.getValues(getByteKey("*"));
        } catch (Exception e) {
            logger.error("getActiveSessions",e);
        }
        return null;
    }

    @Override
    protected Serializable doCreate(Session session) {
        Serializable sessionId = this.generateSessionId(session);
        super.assignSessionId(session, sessionId);
        this.saveSession(session);
        return sessionId;
    }

    @Override
    protected Session doReadSession(Serializable sessionId) {
        if (sessionId == null) {
            return null;
        }

      /*  Session s = (Session) SerializeUtils.deserialize(redisManager.get(this.getByteKey(sessionId)));
        return s;*/

        Session session = null;
        try {
            session = (Session) shiroRedis.getCached(this.getByteKey(sessionId.toString()));
        } catch (Exception e) {
            logger.error(e.getMessage(), e);
        }
        return session;

    }

    /**
     * 获得byte[]型的key
     *
     * @param sessionId
     * @return
     */
    private byte[] getByteKey(Serializable sessionId) {
        String preKey = this.shiroRedis.getSessionRediskeyPrefix()
                + ShiroRedis.NAMESPACE_SEPARATOR
                + sessionId;
        return preKey.getBytes();
    }

    public ShiroRedis getShiroRedis() {
        return shiroRedis;
    }

    public void setShiroRedis(ShiroRedis shiroRedis) {
        this.shiroRedis = shiroRedis;
    }
}
