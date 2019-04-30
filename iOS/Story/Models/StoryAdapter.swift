//
//  StoryAdapter.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import RIBs

class StoryAdapter: Story, StoryBuildable, StoryListener {
    let id: String = "story"
    let title: String = "Story"
    var page: Int = 0
    var pages: [String] = []

    let storyBuilder: StoryBuilder
    var builder: StoryBuildable { return self }
    weak var storyListener: StoryListener?

    init(dependency: StoryDependency) {
        storyBuilder = StoryBuilder(dependency: dependency)
    }

    func build(withListener listener: StoryListener) -> StoryRouting {
        storyListener = listener
        return storyBuilder.build(withListener: self)
    }

    func storyDidEnd() {
        storyListener?.storyDidEnd()
    }
}
