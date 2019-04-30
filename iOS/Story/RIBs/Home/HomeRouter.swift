//
//  HomeRouter.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import RIBs

// MARK: Interactable

protocol HomeInteractable: Interactable, StoryListener {
    var router: HomeRouting? { get set }
    var listener: HomeListener? { get set }
}

// MARK: ViewControllable

protocol HomeViewControllable: ViewControllable {
    func show(storyView: ViewControllable)
}

// MARK: Router

final class HomeRouter: ViewableRouter<HomeInteractable, HomeViewControllable>, HomeRouting {
    private var storyBuilder: StoryBuildable

    init(interactor: HomeInteractable,
         viewController: HomeViewControllable,
         storyBuilder: StoryBuildable) {
        self.storyBuilder = storyBuilder
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }

    override func didLoad() {
        super.didLoad()
        attachStory()
    }
}

// MARK: Private

private extension HomeRouter {
    func attachStory() {
        let story = storyBuilder.build(withListener: interactor)
        attachChild(story)
        viewController.show(storyView: story.viewControllable)
    }
}
