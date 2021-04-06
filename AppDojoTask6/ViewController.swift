//
//  ViewController.swift
//  AppDojoTask6
//
//  Created by Naoyuki Kan on 2021/04/02.
//

import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var label: UILabel!
	private var sliderValue = 0
	private var answer = 0

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		getRandomValue()
	}

	@IBAction func sliderChanged(_ sender: UISlider) {
		sliderValue = Int(sender.value * 100)
	}

	@IBAction private func tappedButton(_ sender: Any) {
		if sliderValue == answer{
			showAlert(message: "あたり！\nあなたの値: \(sliderValue)")
        }else{
            showAlert(message: "はずれ!\nあなたの値: \(sliderValue)")
        }
	}

    private func getRandomValue() {
        answer = Int(arc4random_uniform(100))
        label.text = String(answer)
    }

	// アラートを表示する関数
	private func showAlert(message: String){
		// 再調整ボタンの処理
		let nextAction: UIAlertAction = UIAlertAction(title: "再挑戦", style: UIAlertAction.Style.cancel, handler: { (action: UIAlertAction!) -> Void in
                                                        self.getRandomValue()
        })
		let alert: UIAlertController = UIAlertController(title: "結果", message: message, preferredStyle:  UIAlertController.Style.alert)

		alert.addAction(nextAction)

		present(alert, animated: true, completion: nil)
	}


}

