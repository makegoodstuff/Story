//
//  HomeComponent.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import Foundation
import RIBs

public struct SharedStory: Story {
    public let id: String = "SharedStory"
    public let title: String = "A Shared Story"
    public var page: Int = 0
    public let pages: [String] = ["Page 1", "Page 2", "Page 3"]
    public let builder: StoryBuildable
}

public protocol HomeDependency: Dependency {
    var userName: String { get }
}

final class HomeComponent: Component<HomeDependency>, StoryDependency {
    var userName: String { return dependency.userName }
    var story: Story {
        return SharedStory(page: 0, builder: StoryBuilder(dependency: self))
    }
}
