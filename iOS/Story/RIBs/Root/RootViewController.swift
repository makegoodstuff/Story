//
//  RootViewController.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import RIBs
import SnapKit
import UIKit

protocol RootPresentableListener: class {}

final class RootViewController: UIViewController, RootPresentable {
    weak var listener: RootPresentableListener?
    private var targetViewController: ViewControllable?
    private var animationInProgress: Bool = false

    init() {
        super.init(nibName: nil, bundle: nil)
        setupSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Method is not supported")
    }
}

// MARK: Private

private extension RootViewController {
    func setupSubviews() {
        view.backgroundColor = UIColor.white
    }

    func setupLayout() {}

    func presentTargetViewController() {
        if let targetViewController = targetViewController {
            animationInProgress = true
            present(targetViewController.uiviewController, animated: true) { [weak self] in
                self?.animationInProgress = false
            }
        }
    }
}

// MARK: RootViewControllable

extension RootViewController: RootViewControllable {
    func replaceModal(viewController: ViewControllable?) {
        targetViewController = viewController

        guard !animationInProgress else { return }

        if presentedViewController != nil {
            animationInProgress = true
            dismiss(animated: true) { [weak self] in
                if self?.targetViewController != nil {
                    self?.presentTargetViewController()
                } else {
                    self?.animationInProgress = false
                }
            }
        } else {
            presentTargetViewController()
        }
    }
}

// MARK: LoggedInViewControllable

extension RootViewController: LoggedInViewControllable {}
