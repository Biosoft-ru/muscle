package ru.biosoft.muscle;

import com.developmentontheedge.be5.modules.core.CoreModule;
import com.developmentontheedge.be5.modules.core.CoreServletModule;
import com.developmentontheedge.be5.server.servlet.Be5ServletListener;
import com.developmentontheedge.be5.server.servlet.TemplateModule;
import com.developmentontheedge.be5.web.WebModule;
import com.google.inject.AbstractModule;
import com.google.inject.Guice;
import com.google.inject.Injector;


public class MuscleServletConfig extends Be5ServletListener
{
    @Override
    protected Injector getInjector()
    {
        return Guice.createInjector(getStage(), new MuscleAppModule());
    }

    private static class MuscleAppModule extends AbstractModule
    {
        @Override
        protected void configure()
        {
            install(new CoreModule());
            install(new CoreServletModule());
            install(new WebModule());
            install(new TemplateModule());
        }
    }
}
