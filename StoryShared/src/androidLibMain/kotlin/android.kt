package com.makegoodstuff.StoryShared

import android.os.Build

// MARK: Builder

actual interface Buildable {}
actual interface Builder: Buildable {}

// MARK: Interactor

actual interface Interactable {
    actual fun didBecomeActive()
    actual fun willResignActive()
}

actual interface Interactor: Interactable {}

// MARK: View

interface ViewControllable {}

actual open class Presenter: ViewControllable {}

// MARK: Router

actual interface Routable {
    val children: MutableList<Routable>
    val presenter: Presenter
    val interactor: Interactable

    fun detachChildren()
    fun didBecomeActive()
    fun willResignActive()
}

actual open class Router: Routable {
    val viewController: ViewControllable

    override val children: MutableList<Routable> = ArrayList()
    override val interactor: Interactable
    override val presenter: Presenter
        get() = viewController as Presenter

    constructor(interactor: Interactable, viewController: ViewControllable) {
        this.interactor = interactor
        this.viewController = viewController
    }

    override fun detachChildren() {
        while (!children.isEmpty()) {
            detachCurrentChild()
        }
    }

    override fun didBecomeActive() {
        interactor.didBecomeActive()
    }

    override fun willResignActive() {
        interactor.willResignActive()
        detachChildren()
    }

    fun rebaseChild(router: Routable) {
        detachCurrentChild()
        attachChild(router)
    }

    fun attachChild(router: Routable) {
        router.didBecomeActive()
        children.add(router)
    }

    fun detachChild(router: Routable) {
        children.remove(router)
        router.willResignActive()
    }

    fun detachCurrentChild() {
        val router = children.lastOrNull()
        if (router != null) {
            detachChild(router)
        }
    }
}

// MARK: Other

actual class Platform actual constructor() {
    actual val platform: String = "Android"
}

class Product(val user: String) {
    fun androidSpecificOperation() {
        println("I am ${Build.MODEL} by ${Build.MANUFACTURER}")
    }

    override fun toString() = "Android product of $user for ${Build.MODEL}"
}

object Factory {
    fun create(config: Map<String, String>) =
        Product(config["user"]!!)

    val platform: String = "android"
}
