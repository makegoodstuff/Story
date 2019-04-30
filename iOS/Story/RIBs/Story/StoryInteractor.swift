//
//  StoryInteractor.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import RIBs
import RxSwift

public protocol StoryRouting: ViewableRouting {}

protocol StoryPresentable: Presentable {
    var listener: StoryPresentableListener? { get set }
    func setStoryText(_ text: String)
}

public protocol StoryListener: class {
    func storyDidEnd()
}

final class StoryInteractor: PresentableInteractor<StoryPresentable>, StoryInteractable {
    weak var router: StoryRouting?
    weak var listener: StoryListener?
    private var story: Story?

    override init(presenter: StoryPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}

// MARK: StoryPresentableListener

extension StoryInteractor: StoryPresentableListener {
    func goToNextPage() {
        guard let story = story else { return }
        if story.page == story.pages.count {
            listener?.storyDidEnd()
        } else {
            // TODO: Go to next page
        }
    }

    func goToPreviousPage() {
        // TODO: Go to previous page
    }
}
