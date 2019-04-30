//
//  LoggedInInteractor.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import RIBs
import RxSwift

// MARK: Routing

protocol LoggedInRouting: Routing {
    func cleanupViews()
    func routeToHome(with stories: [Story])
    func routeToStory(with story: StoryBuildable)
}

// MARK: Listener

protocol LoggedInListener: class {}

// MARK: Interactor

final class LoggedInInteractor: Interactor, LoggedInInteractable, LoggedInActionableItem {
    weak var router: LoggedInRouting?
    weak var listener: LoggedInListener?
    private var stories: [Story] = []

    init(stories: [Story]) {
        self.stories = stories
        super.init()
    }

    override func didBecomeActive() {
        super.didBecomeActive()
        router?.routeToHome(with: stories)
    }

    override func willResignActive() {
        super.willResignActive()
        router?.cleanupViews()
    }
}

// MARK: ActionableItem

extension LoggedInInteractor {
    func launchStory(with id: String?) -> Observable<(LoggedInActionableItem, ())> {
        let story: Story? = stories.first { story in
            return story.id.lowercased() == id?.lowercased()
        }

        if let story = story {
            router?.routeToStory(with: story.builder)
        }

        return Observable.just((self, ()))
    }

    func routeToStory(with story: StoryBuildable) {

    }
}

// MARK: HomeListener

extension LoggedInInteractor {
    func startStory(with storyBuilder: StoryBuildable) {
        router?.routeToStory(with: storyBuilder)
    }
}

// MARK: StoryListener

extension LoggedInInteractor {
    func storyDidEnd() {
        router?.routeToHome(with: stories)
    }
}
