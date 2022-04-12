//
//  ResultViewController.swift
//  putTheEgg
//
//  Created by 方仕賢 on 2022/4/12.
//

import UIKit

class ResultViewController: UIViewController {
    
    var answerStrings = [String](repeating: "", count: 2)

    @IBOutlet var answerLabels: [UILabel]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0...answerStrings.count-1 {
            answerLabels[i].text = answerStrings[i]
        }
    }
   
}
