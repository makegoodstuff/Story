//
//  Service.kt
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

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
