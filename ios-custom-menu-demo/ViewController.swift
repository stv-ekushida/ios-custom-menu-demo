//
//  ViewController.swift
//  ios-custom-menu-demo
//
//  Created by Kushida　Eiji on 2017/05/14.
//  Copyright © 2017年 Kushida　Eiji. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {

    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var menuButton: RoundButton!
    @IBOutlet var buttons: [RoundButton]!

    override func viewDidLoad() {
        super.viewDidLoad()
        toggleButton()
    }

    @IBAction func didTapSelectMenuButton(_ sender: RoundButton) {

        if menuView.transform == .identity {

            UIView.animate(withDuration: 1, animations: {

                self.menuView.transform = CGAffineTransform(translationX: 0, y: -85)
                self.menuButton.transform = CGAffineTransform(rotationAngle: self.radians(degress: 180))

            },completion: { (finished) in

                UIView.animate(withDuration: 0.5, animations: {
                    self.toggleButton()
                })
            })

        } else {

            UIView.animate(withDuration: 0.75,
                           animations: {
                self.menuView.transform = .identity
                self.menuButton.transform = .identity
                self.toggleButton()
            })
        }
    }

    /// ボタンの表示切り替え
    func toggleButton() {
        buttons.forEach {
            $0.alpha = $0.alpha == 0 ? 1 : 0
        }
    }

    /// 回転する角度を求める
    func radians(degress: Double) -> CGFloat {
        return CGFloat(degress * .pi / degress)
    }
}

