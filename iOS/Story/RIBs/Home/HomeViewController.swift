//
//  HomeViewController.swift
//  Story
//
//  Created by Justin Kaufman on 4/29/19.
//  Copyright © 2019 MakeGoodStuff. All rights reserved.
//

import RIBs
import RxCocoa
import RxSwift
import SnapKit
import UIKit

// MARK: PresentableListener

protocol HomePresentableListener: class {
    func start(_ story: Story)
}

// MARK: ViewController

final class HomeViewController: UIViewController, HomePresentable, HomeViewControllable {
    weak var listener: HomePresentableListener?
    private let disposeBag = DisposeBag()
    private let stories: [Story]

    init(stories: [Story]) {
        self.stories = stories
        super.init(nibName: nil, bundle: nil)
        setupSubviews()
        setupLayout()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("Method is not supported")
    }

    func show(storyView: ViewControllable) {
        addChild(storyView.uiviewController)
        view.addSubview(storyView.uiviewController.view)

        storyView.uiviewController.view.snp.makeConstraints { (maker: ConstraintMaker) in
            maker.top.equalTo(self.view).offset(70.0)
            maker.leading.trailing.equalTo(self.view).inset(20.0)
            maker.height.equalTo(120.0)
        }
    }
}

// MARK: Private

private extension HomeViewController {
    func setupSubviews() {
        view.backgroundColor = UIColor.yellow
        buildStartButtons()
    }

    func setupLayout() {}
}

// MARK: Control Builders

private extension HomeViewController {
    func buildStartButtons() {
        var previousButton: UIView?
        for story in stories {
            previousButton = buildStartButton(
                with: story,
                previousButton: previousButton
            )
        }
    }

    func buildStartButton(with story: Story, previousButton: UIView?) -> UIButton {
        let startButton = UIButton()
        view.addSubview(startButton)
        startButton.accessibilityIdentifier = story.title
        startButton.snp.makeConstraints { (maker: ConstraintMaker) in
            if let previousButton = previousButton {
                maker.bottom.equalTo(previousButton.snp.top).offset(-20.0)
            } else {
                maker.bottom.equalTo(self.view.snp.bottom).inset(30.0)
            }
            maker.leading.trailing.equalTo(self.view).inset(40.0)
            maker.height.equalTo(50.0)
        }

        startButton.setTitle(story.title, for: .normal)
        startButton.setTitleColor(UIColor.white, for: .normal)
        startButton.backgroundColor = UIColor.black
        startButton.rx.tap
            .subscribe(onNext: { [weak self] in
                self?.listener?.start(story)
            })
            .disposed(by: disposeBag)

        return startButton
    }
}
