//
//  Clube.swift
//  brasileiraoApp
//
//  Created by Pedro Nascimento on 15/12/2017.
//  Copyright © 2017 Pedro Nascimento. All rights reserved.
//

import Foundation
import UIKit

public class Clube {
    public var idClube : Int?
    public var nome : String?
    public var abreviacao : String?
    public var posicao : Int?
    public var escudoUrl : String?
    
    public var escudo : UIImage?
    
    private final let idClubeKey = "id"
    private final let nomeKey = "nome"
    private final let abreviacaoKey = "abreviacao"
    private final let posicaoKey = "posicao"
    private final let escudoUrlKey = "60x60"
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let Clube = Clube(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: Clube Instance.
     */
    required public init?(dictionary: NSDictionary) {
        
        idClube = dictionary["id"] as? Int
        nome = dictionary["nome"] as? String
        abreviacao = dictionary["abreviacao"] as? String
        posicao = dictionary["posicao"] as? Int
        
        if let escudos = dictionary["escudos"] as? NSDictionary  {
            escudoUrl = escudos[escudoUrlKey] as? String
        }
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.idClube, forKey: idClubeKey)
        dictionary.setValue(self.nome, forKey: nomeKey)
        dictionary.setValue(self.abreviacao, forKey: abreviacaoKey)
        dictionary.setValue(self.posicao, forKey: posicaoKey)
        dictionary.setValue(self.escudoUrlKey, forKey: escudoUrlKey)
        
        return dictionary
    }
    
    static func ==(primeiro:Clube, segundo:Clube) -> Bool { // Implement Equatable
        return primeiro.idClube == segundo.idClube
    }
    
}

