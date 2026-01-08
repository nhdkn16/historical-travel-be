package com.nhdkn16.historicaltravel.config;

import java.io.IOException;
import java.util.Set;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

@Component
public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

    private static final Logger logger =
            LoggerFactory.getLogger(CustomAuthenticationSuccessHandler.class);

    private final HttpSessionRequestCache requestCache = new HttpSessionRequestCache();

    @Override
    public void onAuthenticationSuccess(
            HttpServletRequest request,
            HttpServletResponse response,
            Authentication authentication
    ) throws IOException {

        logger.info("Authentication successful for user: {}", authentication.getName());
        logger.info("Session ID: {}", request.getSession().getId());

        Set<String> roles =
                AuthorityUtils.authorityListToSet(authentication.getAuthorities());

        if (roles.contains("ROLE_ADMIN")) {
            logger.info("Redirecting ADMIN to /admin");
            response.sendRedirect("/admin");
            return;
        }

        SavedRequest savedRequest =
                requestCache.getRequest(request, response);

        if (savedRequest != null) {
            String targetUrl = savedRequest.getRedirectUrl();
            logger.info("Redirecting USER back to: {}", targetUrl);
            response.sendRedirect(targetUrl);
        } else {
            logger.info("No saved request, redirecting USER to /");
            response.sendRedirect("/");
        }
    }
}
