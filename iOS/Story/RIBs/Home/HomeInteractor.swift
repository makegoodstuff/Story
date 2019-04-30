//
//  HomeInteractor.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import RIBs
import RxSwift

// MARK: Routing

protocol HomeRouting: ViewableRouting {}

// MARK: Presentable

protocol HomePresentable: Presentable {
    var listener: HomePresentableListener? { get set }
}

// MARK: Listener

protocol HomeListener: class {
    func startStory(with storyBuilder: StoryBuildable)
}

// MARK: Interactor

final class HomeInteractor: PresentableInteractor<HomePresentable>, HomeInteractable {
    weak var router: HomeRouting?
    weak var listener: HomeListener?

    override init(presenter: HomePresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }

    func storyDidEnd() {}
}

// MARK: PresentableListener

extension HomeInteractor: HomePresentableListener {
    func start(_ story: Story) {
        listener?.startStory(with: story.builder)
    }
}
