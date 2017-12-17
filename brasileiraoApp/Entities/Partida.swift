//
//  Partida.swift
//  brasileiraoApp
//
//  Created by Pedro Nascimento on 15/12/2017.
//  Copyright © 2017 Pedro Nascimento. All rights reserved.
//

import Foundation

public class Partida {
    public var idPartida : String?
    public var idClubeCasa : String?
    public var posicaoClubeCasa : Int?
    public var idClubeVisitante : String?
    public var posicaoClubeVisitante : Int?
    public var dataPartida : Date?
    public var local : String?
    
    public var clubeCasa : Clube?
    public var clubeVisitante : Clube?
    
    private final let idPartidaKey = "partida_id"
    private final let idClubeCasaKey = "clube_casa_id"
    private final let posicaoClubeCasaKey = "clube_casa_posicao"
    private final let idClubeVisitanteKey = "clube_visitante_id"
    private final let posicaoClubeVisitanteKey = "clube_visitante_posicao"
    private final let dataPartidaKey = "partida_data"
    private final let localKey = "local"
    
    /**
     Constructs the object based on the given dictionary.
     
     Sample usage:
     let partidas = Partidas(someDictionaryFromJSON)
     
     - parameter dictionary:  NSDictionary from JSON.
     
     - returns: Partidas Instance.
     */
    required public init?(dictionary: NSDictionary) {
        
        idPartida = String.init(format: "%d", (dictionary[idPartidaKey] as? Int)!)
        idClubeCasa = String.init(format: "%d", (dictionary[idClubeCasaKey] as? Int)!)
        posicaoClubeCasa = dictionary[posicaoClubeCasaKey] as? Int
        idClubeVisitante = String.init(format: "%d", (dictionary[idClubeVisitanteKey] as? Int)!)
        posicaoClubeVisitante = dictionary[posicaoClubeVisitanteKey] as? Int
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let dataPartidaString = dictionary[dataPartidaKey] as! String
        dataPartida = dateFormatter.date(from:dataPartidaString)
        
        local = dictionary[localKey] as? String
    }
    
    
    /**
     Returns the dictionary representation for the current instance.
     
     - returns: NSDictionary.
     */
    public func dictionaryRepresentation() -> NSDictionary {
        
        let dictionary = NSMutableDictionary()
        
        dictionary.setValue(self.idPartida, forKey: idPartidaKey)
        dictionary.setValue(self.idClubeCasa, forKey: idClubeCasaKey)
        dictionary.setValue(self.posicaoClubeCasa, forKey: posicaoClubeCasaKey)
        dictionary.setValue(self.idClubeVisitante, forKey: idClubeVisitanteKey)
        dictionary.setValue(self.posicaoClubeVisitante, forKey: posicaoClubeVisitanteKey)
        dictionary.setValue(self.dataPartida, forKey: dataPartidaKey)
        dictionary.setValue(self.local, forKey: localKey)
        
        return dictionary
    }
    
}
