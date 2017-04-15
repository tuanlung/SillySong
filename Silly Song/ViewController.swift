//
//  ViewController.swift
//  Silly Song
//
//  Created by Tuan-Lung Wang on 4/12/17.
//  Copyright © 2017 Tuan-Lung Wang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var nameField: UITextField!
  @IBOutlet weak var lyricsView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    nameField.delegate = self
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

  @IBAction func reset(_ sender: Any) {
    nameField.text = String("")
    lyricsView.text = String("")
  }
  
  @IBAction func displayLyrics(_ sender: Any) {
    lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameField.text!)
  }

}

extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
  }
}

let bananaFanaTemplate = [
  "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
  "Banana Fana Fo F<SHORT_NAME>",
  "Me My Mo M<SHORT_NAME>",
  "<FULL_NAME>"].joined(separator: "\n")

func shortNameForName(name: String) -> String {
  // implementation here
  var name = name
  name = name.lowercased()
  
  let vowels = "aeiou"
  let characterSet = CharacterSet(charactersIn: vowels)
  let range = name.rangeOfCharacter(from: characterSet)
  let lowerBound = range?.lowerBound
  if (lowerBound != nil) {
    name = name.substring(from: lowerBound!)
  }
  return name
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
  
  let shortName = shortNameForName(name: fullName)
  
  let lyrics = lyricsTemplate
    .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
  
  return lyrics
}
