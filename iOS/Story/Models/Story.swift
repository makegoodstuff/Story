//
//  Story.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import RIBs

public protocol Story {
    var id: String { get }
    var title: String { get }
    var page: Int { get }
    var pages: [String] { get }
    var builder: StoryBuildable { get }
}
