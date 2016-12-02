//
//  ViewController.swift
//  EmojiMachine
//
//  Created by ChenZuo on 2016/12/2.
//  Copyright © 2016年 ChenZuo. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {

    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var goButton: UIButton!
    @IBOutlet weak var emojiPickView: UIPickerView!
    
    var imageArray = [String]()
    var dataArray1 = [Int]()
    var dataArray2 = [Int]()
    var dataArray3 = [Int]()
    var bounds: CGRect = CGRect.zero
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bounds = goButton.bounds
        imageArray = ["👻","👸","💩","😘","🍔","🤖","🍟","🐼","🚖","🐷"]
        
        for _ in 0 ..< 100 {
            dataArray1.append((Int)(arc4random() % 10 ))
            dataArray2.append((Int)(arc4random() % 10 ))
            dataArray3.append((Int)(arc4random() % 10 ))
        }
        
        resultLabel.text = ""
        
        emojiPickView.delegate = self
        emojiPickView.dataSource = self
        
        goButton.layer.cornerRadius = 6
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }

    @IBAction func goButtonDidTouch(_ sender: Any) {
        emojiPickView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 0, animated: true)
        emojiPickView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 1, animated: true)
        emojiPickView.selectRow(Int(arc4random()) % 90 + 3, inComponent: 2, animated: true)
        
        self.resultLabel.text = ""
        
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 5, options: .curveLinear, animations: {
            
            self.goButton.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width + 20, height: self.bounds.size.height)
            
        }, completion: { (compelete: Bool) in
            
            UIView.animate(withDuration: 0.1, delay: 0.0, options: UIViewAnimationOptions(), animations: {
                
                self.goButton.bounds = CGRect(x: self.bounds.origin.x, y: self.bounds.origin.y, width: self.bounds.size.width, height: self.bounds.size.height)
                
                if(self.dataArray1[self.emojiPickView.selectedRow(inComponent: 0)] == self.dataArray2[self.emojiPickView.selectedRow(inComponent: 1)] && self.dataArray2[self.emojiPickView.selectedRow(inComponent: 1)] == self.dataArray3[self.emojiPickView.selectedRow(inComponent: 2)]) {
                    self.resultLabel.text = "Bingo!"
                } else {
                    self.resultLabel.text = "💔"
                }
            }, completion: nil)
        })
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 100
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 3
    }
    
    func pickerView(_ pickerView: UIPickerView, widthForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return 100.0
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        
        let pickerLabel = UILabel()
        if component == 0 {
            pickerLabel.text = imageArray[(Int)(dataArray1[row])]
        } else if component == 1 {
            pickerLabel.text = imageArray[(Int)(dataArray2[row])]
        } else {
            pickerLabel.text = imageArray[(Int)(dataArray3[row])]
        }
        pickerLabel.font = UIFont(name: "Apple Color Emoji", size: 80)
        pickerLabel.textAlignment = NSTextAlignment.center
        return pickerLabel
    }

}

