//
//  StoryViewController.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import RIBs
import SnapKit
import UIKit

protocol StoryPresentableListener: class {
    func goToNextPage()
    func goToPreviousPage()
}

final class StoryViewController: UIViewController, StoryViewControllable {
    weak var listener: StoryPresentableListener?
    private let textView: UITextView = UITextView()

    init() {
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Method is not supported")
    }
}

// MARK: Private

private extension StoryViewController {
    func setupSubviews() {
        view.backgroundColor = UIColor.lightGray
        view.addSubview(textView)
        textView.snp.makeConstraints { (maker: ConstraintMaker) in
            maker.edges.equalToSuperview().inset(16.0)
        }
    }

    func setupLayout() {}
}

// MARK: StoryPresentable

extension StoryViewController: StoryPresentable {
    func setStoryText(_ text: String) {
        textView.text = text
    }
}
