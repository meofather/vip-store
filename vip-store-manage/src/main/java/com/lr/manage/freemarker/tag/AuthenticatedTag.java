package com.lr.manage.freemarker.tag;

import freemarker.core.Environment;
import freemarker.template.TemplateDirectiveBody;
import freemarker.template.TemplateException;
import org.slf4j.LoggerFactory;

import java.io.IOException;
import java.util.Map;


/**
 * JSP tag that renders the tag body only if the current user has executed a <b>successful</b> authentication attempt
 * <em>during their current session</em>.
 *
 * <p>This is more restrictive than the {@link UserTag}, which only
 * ensures the current user is known to the system, either via a current login or from Remember Me services,
 * which only makes the assumption that the current user is who they say they are, and does not guarantee it like
 * this tag does.
 *
 * <p>The logically opposite tag of this one is the {@link NotAuthenticatedTag}
 *
 * <p>Equivalent to {@link org.apache.shiro.web.tags.AuthenticatedTag}</p>
 *
 * @since 0.2
 */
public class AuthenticatedTag extends SecureTag {
    private org.slf4j.Logger logger = LoggerFactory.getLogger(AuthenticatedTag.class);

    @Override
    public void render(Environment env, Map params, TemplateDirectiveBody body) throws IOException, TemplateException {
        if (getSubject() != null && getSubject().isAuthenticated()) {
            logger.debug("Subject exists and is authenticated.  Tag body will be evaluated.");

            renderBody(env, body);
        } else {
            logger.debug("Subject does not exist or is not authenticated.  Tag body will not be evaluated.");
        }
    }
}