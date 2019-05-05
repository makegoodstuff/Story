package com.makegoodstuff.StoryShared

expect interface Interactable {
    fun didBecomeActive()
    fun willResignActive()
}

expect interface Interactor: Interactable
