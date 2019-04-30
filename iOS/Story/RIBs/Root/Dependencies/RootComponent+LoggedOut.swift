//
//  RootComponent+LoggedOut.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import RIBs

protocol RootDependencyLoggedOut: Dependency {}

extension RootComponent: LoggedOutDependency {}
