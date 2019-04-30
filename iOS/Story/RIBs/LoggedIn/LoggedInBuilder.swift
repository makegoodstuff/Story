//
//  LoggedInBuilder.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import RIBs

protocol LoggedInBuildable: Buildable {
    func build(withListener listener: LoggedInListener, userName: String) -> (router: LoggedInRouting, actionableItem: LoggedInActionableItem)
}

final class LoggedInBuilder: Builder<LoggedInDependency>, LoggedInBuildable {
    override init(dependency: LoggedInDependency) {
        super.init(dependency: dependency)
    }

    func build(withListener listener: LoggedInListener, userName: String) -> (router: LoggedInRouting, actionableItem: LoggedInActionableItem) {
        let component = LoggedInComponent(dependency: dependency, userName: userName)
        let interactor = LoggedInInteractor(stories: component.stories)
        interactor.listener = listener

        let homeBuilder = HomeBuilder(dependency: component)
        let router = LoggedInRouter(
            interactor: interactor,
            viewController: component.loggedInViewController,
            homeBuilder: homeBuilder
        )

        return (router, interactor)
    }
}
