//
//  ViewController.swift
//  NoteCalculator
//
//  Created by Siarhei Saukin (Étudiant) on 2021-05-09.
//  Copyright © 2021 Siarhei Saukin (Étudiant). All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var notesArray = NotesClasses()
    
    @IBOutlet weak var currentNote: UILabel!
    
    @IBOutlet weak var notes: UILabel!
        
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var min: UIButton! 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func inputNum(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
            if currentNote.text != nil {
                currentNote.text! += buttonTitle
            } else {
                currentNote.text = buttonTitle
            }
            
        }
    }

    @IBAction func addNote(_ sender: UIButton) {
        if let noteStr = currentNote.text {
            if let note = Int(noteStr) {
                if notes.text != nil {
                    notes.text! += " \(note)"
                } else {
                    notes.text = "\(note)"
                }
                notesArray.append(note: Int(note))
                currentNote.text = nil
            }
            resetResultText()
        }
    }
    
    @IBAction func getResult(_ sender: UIButton) {
        if let buttonTitle = sender.title(for: .normal) {
            let operation = notesArray.getOperation(operation: buttonTitle)
            result.text = operation()
        }
    }
    
    
    @IBAction func removeLast(_ sender: UIButton) {
        notesArray.popLast()
        notes.text = nil
        resetResultText()
        for note in notesArray.getNotesList() {
           if (notes.text != nil) {
               notes.text! += " \(note)"
           } else {
               notes.text = "\(note)"
           }
        }
    }
    
    
    @IBAction func resetNotes(_ sender: UIButton) {
        result.text = ""
        currentNote.text = nil
        notes.text = nil
        notesArray.reset()
    }
    
    private func resetResultText() {
        result.text = ""
    }
}
