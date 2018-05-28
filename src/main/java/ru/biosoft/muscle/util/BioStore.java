package ru.biosoft.muscle.util;

import com.developmentontheedge.be5.servlet.UserInfoHolder;
import ru.biosoft.biostoreapi.DefaultConnectionProvider;
import ru.biosoft.biostoreapi.JWToken;


public class BioStore
{
    private static final String BIOSTORE_SERVER_NAME = "muscle.biouml.org";

    public static final String BIOSTORE_TOKEN = "biostore-token";

    public static final DefaultConnectionProvider api = new DefaultConnectionProvider(BIOSTORE_SERVER_NAME);

    private static JWToken getToken()
    {
        return (JWToken) UserInfoHolder.getSession().get(BIOSTORE_TOKEN);
    }
}
