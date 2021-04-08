//
//  ViewController.swift
//  AppDojoTask6
//
//  Created by Naoyuki Kan on 2021/04/02.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var slider: UISlider!
    private var answer = 0

	override func viewDidLoad() {
		super.viewDidLoad()

        resetGame()
	}

	@IBAction private func tappedButton(_ sender: Any) {
        let sliderValue = Int(slider.value)

        let firstLine: String

		if sliderValue == answer {
            firstLine = "あたり！"
        }else{
            firstLine = "はずれ!"
        }

        showAlert(message: "\(firstLine)\nあなたの値: \(sliderValue)")
	}

    private func resetGame() {
        answer = Int.random(in: 1...100)
        label.text = String(answer)
    }

	// アラートを表示する関数
	private func showAlert(message: String){
		// 再調整ボタンの処理
		let nextAction = UIAlertAction(title: "再挑戦", style: .cancel, handler: { [weak self] _ in
            self?.resetGame()
        })
		let alert = UIAlertController(title: "結果", message: message, preferredStyle: .alert)

		alert.addAction(nextAction)

		present(alert, animated: true, completion: nil)
	}
}
