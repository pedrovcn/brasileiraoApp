//
//  RestService.swift
//  brasileiraoApp
//
//  Created by Pedro Nascimento on 15/12/2017.
//  Copyright © 2017 Pedro Nascimento. All rights reserved.
//

import Foundation
import Alamofire

class RestServices {
    
    private class func getCompleteUrl(forKey key: String) -> String {
        if let path = Bundle.main.path(forResource: "RestEndpoints", ofType: "plist") {
            let dictionary = NSDictionary(contentsOfFile: path)
            let serverUrl = dictionary?.value(forKey: Constants.ServerKeys.server) as! String

            return serverUrl + (dictionary?.value(forKey: key) as! String)
        }
        
        return ""
    }
    
    class func buscarCampeonato(completion: @escaping(Error?) -> Void) {
        Alamofire.request(getCompleteUrl(forKey: Constants.ServerKeys.partidas)).responseJSON { response in
//            debugPrint(response)

            if let json = response.result.value {
                let dictionary = json as! NSDictionary
                initCampeonato(dictionary: dictionary)
                completion(nil)
                
            } else {
                completion(NSError.init(domain: "Não foi possível buscar informações.", code: 1, userInfo: nil))
            }
        }
        
    }
    
    private class func initCampeonato(dictionary: NSDictionary) {
        
        let array = dictionary["partidas"] as! Array<NSDictionary>
        var clubesArray = Array<Clube>()
        var partidasArray = Array<Partida>()
        
        for dict in array {
            if let partida = Partida.init(dictionary: dict) {
                let clubes = dictionary["clubes"] as! NSDictionary
                
                let clubeCasa = clubes[partida.idClubeCasa!] as! NSDictionary
                partida.clubeCasa = Clube.init(dictionary: clubeCasa)
                
                let clubeVisitante = clubes[partida.idClubeVisitante!] as! NSDictionary
                partida.clubeVisitante = Clube.init(dictionary: clubeVisitante)
                
                clubesArray.append(partida.clubeCasa!)
                clubesArray.append(partida.clubeVisitante!)

                partidasArray.append(partida)
            }
        }
        
        CampeonatoManager.sharedInstance.partidasArray = partidasArray
        CampeonatoManager.sharedInstance.clubesArray = clubesArray
        
        // Ordenando em ordem crescente
        CampeonatoManager.sharedInstance.clubesArray.sort { $0.posicao! < $1.posicao! }
        CampeonatoManager.sharedInstance.partidasArray.sort {$0.dataPartida! < $1.dataPartida! }
        
        // Removendo os últimos 10 clubes
        CampeonatoManager.sharedInstance.clubesArray.removeSubrange(10...19)
        
    }
}
