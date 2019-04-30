package com.makegoodstuff.StoryShared

expect class Platform() {
    val platform: String
}

class Greeting {
    fun StoryShared(): String = "Hello, ${Platform().platform}"
}
