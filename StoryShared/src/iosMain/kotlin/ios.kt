package com.makegoodstuff.StoryShared

import kotlinx.cinterop.alloc
import kotlinx.cinterop.memScoped
import kotlinx.cinterop.ptr
import kotlinx.cinterop.toKString
import kotlinx.cinterop.*
import platform.posix.uname
import platform.posix.utsname
import platform.Foundation.*
import platform.UIKit.*

// MARK: Builder

actual open interface Buildable {}
actual open interface Builder: Buildable {}

// MARK: Interactor

actual open interface Interactable {
    actual fun didBecomeActive()
    actual fun willResignActive()
}

actual open interface Interactor: Interactable {}

// MARK: View

open interface ViewControllable {}

actual open class Presenter: ViewControllable {}

// MARK: Router

actual open interface Routable {
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
    actual val platform: String = "iOS"
}
