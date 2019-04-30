//
//  RootRouter.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import RIBs

// MARK: Interactable

protocol RootInteractable: Interactable, LoggedOutListener, LoggedInListener {
    var router: RootRouting? { get set }
    var listener: RootListener? { get set }
}

// MARK: ViewControllable

protocol RootViewControllable: ViewControllable {
    func replaceModal(viewController: ViewControllable?)
}

// MARK: Router

final class RootRouter: LaunchRouter<RootInteractable, RootViewControllable>, RootRouting {
    private let loggedOutBuilder: LoggedOutBuildable
    private let loggedInBuilder: LoggedInBuildable
    private var loggedOut: ViewableRouting?

    init(interactor: RootInteractable,
         viewController: RootViewControllable,
         loggedOutBuilder: LoggedOutBuildable,
         loggedInBuilder: LoggedInBuildable) {
        self.loggedOutBuilder = loggedOutBuilder
        self.loggedInBuilder = loggedInBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    override func didLoad() {
        super.didLoad()
        routeToLoggedOut()
    }

    func routeToLoggedIn(userName: String) -> LoggedInActionableItem {
        if let loggedOut = self.loggedOut {
            detachChild(loggedOut)
            viewController.replaceModal(viewController: nil)
            self.loggedOut = nil
        }

        let loggedIn = loggedInBuilder.build(withListener: interactor, userName: userName)
        attachChild(loggedIn.router)
        return loggedIn.actionableItem
    }

    private func routeToLoggedOut() {
        let loggedOut = loggedOutBuilder.build(withListener: interactor)
        self.loggedOut = loggedOut
        attachChild(loggedOut)
        viewController.replaceModal(viewController: loggedOut.viewControllable)
    }
}
