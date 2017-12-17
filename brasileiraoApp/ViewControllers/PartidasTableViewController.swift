//
//  PartidasTableViewController.swift
//  brasileiraoApp
//
//  Created by Pedro Nascimento on 15/12/2017.
//  Copyright © 2017 Pedro Nascimento. All rights reserved.
//

import UIKit

class PartidasTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(atualizar), for: .valueChanged)
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        
        if CampeonatoManager.sharedInstance.partidasArray.count ==  0 {
            let semRegistrosLabel = UILabel()
            semRegistrosLabel.text = "Não há registros, verifique sua conexão\ne puxe para atualizar."
            semRegistrosLabel.textAlignment = .center
            semRegistrosLabel.lineBreakMode = .byWordWrapping
            semRegistrosLabel.numberOfLines = 2
            
            self.tableView.backgroundView = semRegistrosLabel
            self.tableView.separatorStyle = .none
            
            return 0
        }
        
        self.tableView.separatorStyle = .singleLine
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CampeonatoManager.sharedInstance.partidasArray.count
    }
    
    @objc func atualizar() {
        RestServices.buscarCampeonato() { error in
            if error != nil {
                let alert = UIAlertController.init(title: "Erro", message: error?.localizedDescription, preferredStyle: .alert)
                let action = UIAlertAction.init(title: "OK", style: .default, handler: nil)
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
            self.tableView.reloadData()
            self.refreshControl?.endRefreshing()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PartidaCell", for: indexPath) as! PartidaTableViewCell

        let partida = CampeonatoManager.sharedInstance.partidasArray[indexPath.row]
        
        cell.clubeCasaImageView.kf.indicatorType = .activity
        cell.clubeCasaImageView.kf.setImage(with: URL(string: (partida.clubeCasa?.escudoUrl)!))
        
        cell.clubeVisitanteImageView.kf.indicatorType = .activity
        cell.clubeVisitanteImageView.kf.setImage(with: URL(string: (partida.clubeVisitante?.escudoUrl)!))
        
        cell.clubeCasaAbreviacaoLabel.text = partida.clubeCasa?.abreviacao
        cell.clubeVisitanteAbreviacaoLabel.text = partida.clubeVisitante?.abreviacao
        cell.localLabel.text = partida.local
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy - HH:mm"
        cell.dataHorarioLabel.text = formatter.string(from: partida.dataPartida!)

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 210
    }

}
