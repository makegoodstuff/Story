package com.makegoodstuff.StoryShared

public interface Service {
    val name: String
}

public class BaseService: Service {
    override val name: String = "BaseService"
}

public class AuthService: Service {
    override val name: String = "AuthService"
}
