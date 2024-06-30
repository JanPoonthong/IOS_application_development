//
//  ViewController.swift
//  Vowels Counter
//
//  Created by Jan Poonthong on 30/6/2567 BE.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var wordsField: UITextField!
    
    @IBOutlet weak var aBox: UIView!
    @IBOutlet weak var eBox: UIView!
    @IBOutlet weak var uBox: UIView!
    @IBOutlet weak var oBox: UIView!
    @IBOutlet weak var iBox: UIView!
    
    @IBOutlet weak var eCount: UILabel!
    @IBOutlet weak var aCount: UILabel!
    @IBOutlet weak var iCount: UILabel!
    @IBOutlet weak var oCount: UILabel!
    @IBOutlet weak var uCount: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func countOccurrences(of character: Character, in string: String) -> Int {
        var count = 0
        for char in string {
            print(char)
            if char.lowercased() == character.lowercased() {
                count += 1
            }
        }
        return count
    }

    @IBAction func onChanged(_ sender: Any) {
        if let currentInput = wordsField.text {

            switch (currentInput) {
            default:
                aCount.text = "x\(countOccurrences(of: "a", in: currentInput))"
                if countOccurrences(of: "a", in: currentInput) >= 1 {
                    aBox.backgroundColor = .green
                } else {
                    aBox.backgroundColor = .lightGray
                }
                
                eCount.text = "x\(countOccurrences(of: "e", in: currentInput))"
                if countOccurrences(of: "e", in: currentInput) >= 1 {
                    eBox.backgroundColor = .green
                } else {
                    eBox.backgroundColor = .lightGray
                }
                
                iCount.text = "x\(countOccurrences(of: "i", in: currentInput))"
                if countOccurrences(of: "i", in: currentInput) >= 1 {
                    iBox.backgroundColor = .green
                } else {
                    iBox.backgroundColor = .lightGray
                }
                
                oCount.text = "x\(countOccurrences(of: "o", in: currentInput))"
                if countOccurrences(of: "o", in: currentInput) >= 1 {
                    oBox.backgroundColor = .green
                } else {
                    oBox.backgroundColor = .lightGray
                }
                
                uCount.text = "x\(countOccurrences(of: "u", in: currentInput))"
                if countOccurrences(of: "u", in: currentInput) >= 1 {
                    uBox.backgroundColor = .green
                } else {
                    uBox.backgroundColor = .lightGray
                }
            }
        }
    }
    
}

