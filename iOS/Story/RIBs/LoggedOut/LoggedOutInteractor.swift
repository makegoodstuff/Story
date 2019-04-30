//
//  LoggedOutInteractor.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import RIBs
import RxSwift


// MARK: Routing

protocol LoggedOutRouting: ViewableRouting {}

// MARK: Presentable

protocol LoggedOutPresentable: Presentable {
    var listener: LoggedOutPresentableListener? { get set }
}

// MARK: Listener

protocol LoggedOutListener: class {
    func didLogin(userName: String)
}

// MARK: Interactor

final class LoggedOutInteractor: PresentableInteractor<LoggedOutPresentable>, LoggedOutInteractable {
    weak var router: LoggedOutRouting?
    weak var listener: LoggedOutListener?

    override init(presenter: LoggedOutPresentable) {
        super.init(presenter: presenter)
        presenter.listener = self
    }

    override func didBecomeActive() {
        super.didBecomeActive()
    }

    override func willResignActive() {
        super.willResignActive()
    }
}

// MARK: PresentableListener

extension LoggedOutInteractor: LoggedOutPresentableListener {
    func login(userName: String?) {
        let userNameWithDefault = self.userName(userName, withDefaultName: "User")
        listener?.didLogin(userName: userNameWithDefault)
    }
}

// MARK: Private

private extension LoggedOutInteractor {
    func userName(_ name: String?, withDefaultName defaultName: String) -> String {
        if let name = name {
            return name.isEmpty ? defaultName : name
        } else {
            return defaultName
        }
    }
}
