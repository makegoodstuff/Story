//
//  Interactor.kt
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

package com.makegoodstuff.StoryShared

expect interface Interactable {
    fun didBecomeActive()
    fun willResignActive()
}

expect interface Interactor: Interactable
