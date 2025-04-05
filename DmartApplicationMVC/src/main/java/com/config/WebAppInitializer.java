package com.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class WebAppInitializer extends AbstractAnnotationConfigDispatcherServletInitializer {

    // Root configuration (e.g., Database, Security, etc.)
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[] { DatabaseConfig.class };
    }

    // Servlet configuration (Spring MVC components like Controllers, ViewResolvers)
    @Override
    protected Class<?>[] getServletConfigClasses() {
        return new Class[] { AppConfig.class };
    }

    // Map DispatcherServlet to "/"
    @Override
    protected String[] getServletMappings() {
        return new String[] { "/" };
    }
}
