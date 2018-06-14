//
//  ViewController.swift
//  SillySong
//
//  Created by Srikumar Sastry on 14/06/18.
//  Copyright © 2018 Srikumar Sastry. All rights reserved.
//

import UIKit
import Foundation

func shortNameForName(name word: String) -> String{
    let ind = word.index(word.startIndex, offsetBy: 1)
    return String(word[ind...])
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = shortNameForName(name: fullName)
    
    let lyrics = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName).replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    
    return lyrics
}

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

class ViewController: UIViewController {

    @IBOutlet weak var nameField: UITextField!
    
    
    @IBOutlet weak var lyricsView: UITextView!

    @IBAction func reset(_ sender: Any) {
        nameField.text = ""
        lyricsView.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        let lyrics = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
        lyricsView.text = lyrics
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameField.delegate = self
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}
