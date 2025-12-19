package com.nhdkn16.historicaltravel.config;

import jakarta.servlet.*;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class SessionDebugFilter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) 
            throws IOException, ServletException {
        
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpSession session = httpRequest.getSession(false);
        
        System.out.println("=== REQUEST DEBUG ===");
        System.out.println("Request URI: " + httpRequest.getRequestURI());
        System.out.println("Session ID: " + (session != null ? session.getId() : "NO SESSION"));
        
        if (session != null) {
            Object auth = session.getAttribute("SPRING_SECURITY_CONTEXT");
            System.out.println("Spring Security Context in session: " + (auth != null ? "PRESENT" : "NULL"));
        }
        
        chain.doFilter(request, response);
    }
}
