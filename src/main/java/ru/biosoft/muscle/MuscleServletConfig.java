package ru.biosoft.muscle;

import com.developmentontheedge.be5.ServerModule;
import com.developmentontheedge.be5.modules.core.CoreModule;
import com.developmentontheedge.be5.servlet.Be5GuiceServletContextListener;
import com.developmentontheedge.be5.servlet.TemplateModule;
import com.google.inject.Guice;
import com.google.inject.Injector;


public class MuscleServletConfig extends Be5GuiceServletContextListener
{
    @Override
    protected Injector getInjector()
    {
        return Guice.createInjector(
                new ServerModule(),
                new CoreModule(),
                new TemplateModule(),
                new MuscleModule()
        );
    }
}