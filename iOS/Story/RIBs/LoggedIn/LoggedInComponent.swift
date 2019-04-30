//
//  LoggedInComponent.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import Foundation
import RIBs
import RxCocoa
import RxSwift

protocol LoggedInDependency: Dependency {
    var loggedInViewController: LoggedInViewControllable { get }
}

final class LoggedInComponent: Component<LoggedInDependency> {
    let userName: String

    var loggedInViewController: LoggedInViewControllable {
        return dependency.loggedInViewController
    }

    var stories: [Story] {
        return shared { return [StoryAdapter(dependency: self)] }
    }

    init(dependency: LoggedInDependency, userName: String) {
        self.userName = userName
        super.init(dependency: dependency)
    }
}
