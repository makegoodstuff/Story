//
//  LoggedInActionableItem.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import RxSwift

public protocol LoggedInActionableItem: class {
    func launchStory(with id: String?) -> Observable<(LoggedInActionableItem, ())>
}
