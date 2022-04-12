//
//  SelectViewController.swift
//  putTheEgg
//
//  Created by 方仕賢 on 2022/4/12.
//

import UIKit

class SelectViewController: UIViewController {

    @IBOutlet weak var treeImageView: UIImageView!
    @IBOutlet weak var riverImageView: UIImageView!
    @IBOutlet weak var soilImageView: UIImageView!
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet var eggs: [UIImageView]!
    
    var chosenAnswers = [String]()
    let answers = ["眼光高而且很會挑", "愛情觀濫情", "愛情觀是一切隨緣", "愛情觀很專一"]
    var chosenButtonIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        treeImageView.image = UIImage.animatedImageNamed("tree-", duration: 1)
        riverImageView.image = UIImage.animatedImageNamed("river-", duration: 1)
        // Do any additional setup after loading the view.
    }
    
    func hideEggs() {
        for imageView in eggs {
            imageView.image = nil
        }
    }
    
    @IBAction func selectPlace(_ sender: UIButton) {
        hideEggs()
        
        switch sender {
        case buttons[0]:
            eggs[0].image = UIImage(named: "egg")
            chosenButtonIndex = 0
        case buttons[1]:
            eggs[1].image = UIImage(named: "egg")
            chosenButtonIndex = 1
        case buttons[2]:
            eggs[2].image = UIImage(named: "egg")
            chosenButtonIndex = 2
        case buttons[3]:
            eggs[3].image = UIImage(named: "egg")
            chosenButtonIndex = 3
        default:
            print("There's no button.")
        }
    }
    
    @IBAction func next(_ sender: Any) {
        chosenAnswers.append(answers[chosenButtonIndex])
        if chosenAnswers.count == 1 {
            questionLabel.text = "2. 如果有一顆熟雞蛋，你會放在哪？"
            nextButton.setTitle("測驗", for: .normal)
        } else if chosenAnswers.count == 2 {
            performSegue(withIdentifier: "showResult", sender: chosenAnswers)
            nextButton.setTitle("下一題", for: .normal)
            chosenAnswers.removeAll()
        }
    }
    
    
    @IBSegueAction func showResult(_ coder: NSCoder, sender: Any?) -> ResultViewController? {
        let controller = ResultViewController(coder: coder)
        controller?.answerStrings[0] = chosenAnswers[0]
        controller?.answerStrings[1] = chosenAnswers[1]
        return controller
    }
    
    

}
