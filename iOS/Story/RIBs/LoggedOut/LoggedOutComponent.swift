//
//  LoggedOutComponent.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import Foundation
import RIBs

protocol LoggedOutDependency: Dependency {}

final class LoggedOutComponent: Component<LoggedOutDependency> {}
