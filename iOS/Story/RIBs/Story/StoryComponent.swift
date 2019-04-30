//
//  StoryComponent.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import Foundation
import RIBs

protocol StoryDependency: Dependency {
    var userName: String { get }
}

final class StoryComponent: Component<StoryDependency> {
    fileprivate var userName: String { return dependency.userName }
}
