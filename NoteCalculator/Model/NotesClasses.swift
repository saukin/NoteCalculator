//
//  NotesDeLaClasse.swift
//  NoteCalculator
//
//  Created by Siarhei Saukin (Étudiant) on 2021-05-13.
//  Copyright © 2021 Siarhei Saukin (Étudiant). All rights reserved.
//

import Foundation

class NotesClasses {
    
    private var notesDeLaClasse = [Note?]()
    
    func popLast() {
        notesDeLaClasse.popLast()
    }
    
    func append(note: Int) {
        notesDeLaClasse.append(Note(valeur: note))
    }
    
    func getNotesList() -> [Int] {
        var intNotes = [Int]()
        for i in notesDeLaClasse {
            if let note = i {
                intNotes.append(note.valeur)
            }
        }
        return intNotes;
    }
    
    func reset() {
        notesDeLaClasse = [Note?]()
    }
    
    func getMoyenne() -> String {
        if (notesDeLaClasse.count == 0) {
            return "NO DATA"
        }
        var avg : Float
        var sum : Float = 0.0
        var count = 0
        for n in notesDeLaClasse {
            if let _n = n {
                sum += Float(_n.valeur)
                count += 1
            }
        }
        if (count != 0) {
            avg = sum / Float(count)
        } else {
            avg = 0.0
        }
        return "Note moyenne est \(avg)"
    }
    
    func getMax() -> String {
        if (notesDeLaClasse.count == 0) {
            return "NO DATA"
        }
        var max : Int = 0
        for i in notesDeLaClasse {
            if let note = i {
                if (max < note.valeur) {
                    max = note.valeur
                }
            }
        }
        return "Note maximale est \(max)"
    }
    
    func getMin() -> String {
        if (notesDeLaClasse.count == 0) {
            return "NO DATA"
        }
        var min : Int = Int.max
        for i in notesDeLaClasse {
            if let note = i {
                if (min > note.valeur) {
                    min = note.valeur
                }
            }
        }
        return "Note minimale est \(min)"
    }
    
    func getOperation(operation : String) -> () -> (String) {
        switch operation {
            case Operation.moy.rawValue :
                return getMoyenne
            case Operation.max.rawValue :
                return getMax
            default:
                return getMin
        }
    }
}
