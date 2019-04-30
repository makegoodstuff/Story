//
//  LoggedInRouter.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import RIBs

// MARK: Interactable

protocol LoggedInInteractable: Interactable, HomeListener, StoryListener {
    var router: LoggedInRouting? { get set }
    var listener: LoggedInListener? { get set }
}

// MARK: ViewControllable

protocol LoggedInViewControllable: ViewControllable {
    func replaceModal(viewController: ViewControllable?)
}

// MARK: Router

final class LoggedInRouter: Router<LoggedInInteractable> {
    private let viewController: LoggedInViewControllable
    private let homeBuilder: HomeBuildable
    private var currentChild: ViewableRouting?

    init(interactor: LoggedInInteractable,
         viewController: LoggedInViewControllable,
         homeBuilder: HomeBuildable) {
        self.viewController = viewController
        self.homeBuilder = homeBuilder
        super.init(interactor: interactor)
        interactor.router = self
    }
}

// MARK: LoggedInRouting

extension LoggedInRouter: LoggedInRouting {
    func cleanupViews() {
        if currentChild != nil {
            viewController.replaceModal(viewController: nil)
        }
    }

    func routeToHome(with stories: [Story]) {
        detachCurrentChild()
        attachHome(with: stories)
    }

    func routeToStory(with storyBuilder: StoryBuildable) {
        detachCurrentChild()

        let story = storyBuilder.build(withListener: interactor)
        self.currentChild = story
        attachChild(story)
        viewController.replaceModal(viewController: story.viewControllable)
    }
}

// MARK: Private

private extension LoggedInRouter {
    func attachHome(with stories: [Story]) {
        let home = homeBuilder.build(withListener: interactor, stories: stories)
        self.currentChild = home
        attachChild(home)
        viewController.replaceModal(viewController: home.viewControllable)
    }

    func detachCurrentChild() {
        if let currentChild = currentChild {
            detachChild(currentChild)
            viewController.replaceModal(viewController: nil)
        }
    }
}
