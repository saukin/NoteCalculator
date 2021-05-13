//
//  ViewController.swift
//  NoteCalculator
//
//  Created by Siarhei Saukin (Étudiant) on 2021-05-09.
//  Copyright © 2021 Siarhei Saukin (Étudiant). All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var notesArray = NotesDeLaClasse()
    
    @IBOutlet weak var currentNote: UILabel!
    
    @IBOutlet weak var notes: UILabel!
        
    @IBOutlet weak var moyenne: UILabel!
    
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
        }
    }
    
    @IBAction func getAvg(_ sender: UIButton) {
        var avg : Float
        var sum : Float = 0.0
        var count = 0
        for n in notesArray.getNotesList() {
            if let _n = n {
                sum += Float(_n)
                count += 1
            }
        }
        if (count != 0) {
            avg = sum / Float(count)
            moyenne.text = "Moyenne = \(avg)"
        } else {
            moyenne.text = "Moyenne = 0.0"
        }
    }
    
    
    @IBAction func removeLast(_ sender: UIButton) {
        notesArray.popLast()
        notes.text = nil
        for i in notesArray.getNotesList() {
            if let note = i {
                if (notes.text != nil) {
                    notes.text! += " \(note)"
                } else {
                    notes.text = "\(note)"
                }
            }
        }
    }
    
    
    @IBAction func resetNotes(_ sender: UIButton) {
        moyenne.text = "Moyenne"
        currentNote.text = nil
        notes.text = nil
        notesArray.reset()    }
}
