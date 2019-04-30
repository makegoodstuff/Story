//
//  StoryRouter.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import RIBs

protocol StoryInteractable: Interactable {
    var router: StoryRouting? { get set }
    var listener: StoryListener? { get set }
}

protocol StoryViewControllable: ViewControllable {}

final class StoryRouter: ViewableRouter<StoryInteractable, StoryViewControllable>, StoryRouting {
    override init(interactor: StoryInteractable, viewController: StoryViewControllable) {
        super.init(interactor: interactor, viewController: viewController)
        interactor.router = self
    }
}
