package ru.biosoft.muscle.util;

import com.developmentontheedge.be5.web.Session;
import ru.biosoft.biostoreapi.DefaultConnectionProvider;
import ru.biosoft.biostoreapi.JWToken;

import javax.inject.Inject;
import javax.inject.Provider;


public class BioStore
{
    private final Provider<Session> sessionProvider;

    @Inject
    public BioStore(Provider<Session> sessionProvider)
    {
        this.sessionProvider = sessionProvider;
    }

    private final String BIOSTORE_SERVER_NAME = "muscle.biouml.org";

    public final String BIOSTORE_TOKEN = "biostore-token";

    public final DefaultConnectionProvider api = new DefaultConnectionProvider(BIOSTORE_SERVER_NAME);

    private JWToken getToken()
    {
        return (JWToken) sessionProvider.get().get(BIOSTORE_TOKEN);
    }
}
