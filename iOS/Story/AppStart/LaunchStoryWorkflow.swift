//
//  LaunchStoryWorkflow.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import RIBs
import RxSwift

public class LaunchStoryWorkflow: Workflow<RootActionableItem> {
    public init(url: URL) {
        super.init()

        let storyId: String? = parseStoryId(from: url)

        self
            .onStep { (rootItem: RootActionableItem) -> Observable<(LoggedInActionableItem, ())> in
                rootItem.waitForLogin()
            }
            .onStep { (loggedInItem: LoggedInActionableItem, _) -> Observable<(LoggedInActionableItem, ())> in
                loggedInItem.launchStory(with: storyId)
            }
            .commit()
    }

    private func parseStoryId(from url: URL) -> String? {
        let components = URLComponents(string: url.absoluteString)
        let items = components?.queryItems ?? []
        guard let item = items.filter({ $0.name == "storyId" }).first else { return nil }
        return item.value
    }
}
