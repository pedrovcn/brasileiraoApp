//
//  campeonatoManager.swift
//  brasileiraoApp
//
//  Created by Pedro Nascimento on 15/12/2017.
//  Copyright © 2017 Pedro Nascimento. All rights reserved.
//

class CampeonatoManager {
    static let sharedInstance = CampeonatoManager()
    
    var clubesArray: Array<Clube>!
    var partidasArray: Array<Partida>!

    private init() {
        clubesArray = Array<Clube>()
        partidasArray = Array<Partida>()
    }
    
}
