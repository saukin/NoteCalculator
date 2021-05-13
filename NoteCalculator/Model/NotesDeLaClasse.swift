//
//  NotesDeLaClasse.swift
//  NoteCalculator
//
//  Created by Siarhei Saukin (Étudiant) on 2021-05-13.
//  Copyright © 2021 Siarhei Saukin (Étudiant). All rights reserved.
//

import Foundation

class NotesDeLaClasse {
    
    private var notesDeLaClasse = [Int?]()
    
    func popLast() {
        notesDeLaClasse.popLast()
    }
    
    func append(note: Int) {
        notesDeLaClasse.append(note)
    }
    
    func getNotesList() -> [Int?] {
        return notesDeLaClasse;
    }
    
    func reset() {
        notesDeLaClasse = [Int?]()
    }
}
