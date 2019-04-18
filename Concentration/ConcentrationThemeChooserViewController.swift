//
//  ConcentrationThemeChooserViewController.swift
//  Concentration
//
//  Created by Neil R.Bhasme on 17/04/2019.
//  Copyright © 2019 Neil R.Bhasme. All rights reserved.
//

import UIKit

class ConcentrationThemeChooserViewController: UIViewController {

    // MARK: - Navigation
    let themes = [
        "Faces": "🤯😬😰😱😳🤪😵😡😠🤬😷🤒🤕🤢🤮🤧😇🤠🤡🤥🤫🤭🧐🤓",
        "Animals": "🙈🙉🙊💥💦💨💫🐵🐒🦍🐶🐕🐩🐺🦊🐱🐈🦁🐯🐅🐆",
        "Sports": "⚽️🏀🏈⚾️🥎🎾🏐🏓🏑🥍🏏🥋⛸🏋🏽‍♀️⛷🤸🏿‍♂️🏊🏼‍♀️🚵🏼‍♀️"
    ]

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Choose Theme" {
                if let themeName = (sender as? UIButton)?.currentTitle, let theme = themes[themeName] {
                    if let cvc = segue.destination as? ConcentrationViewController {
                        var something = [String]()
                        something = [theme]
                        cvc.theme = something
                    }
               }
           
            
        }
    }
}
