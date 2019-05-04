package com.makegoodstuff.StoryShared

expect open interface Interactable {
    fun didBecomeActive()
    fun willResignActive()
}

expect open interface Interactor: Interactable
