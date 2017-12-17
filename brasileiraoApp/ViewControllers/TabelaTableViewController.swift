//
//  TabelaTableViewController.swift
//  brasileiraoApp
//
//  Created by Pedro Nascimento on 15/12/2017.
//  Copyright © 2017 Pedro Nascimento. All rights reserved.
//

import UIKit
import Kingfisher

class TabelaTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshControl = UIRefreshControl()
        self.refreshControl?.addTarget(self, action: #selector(atualizar), for: .valueChanged)
        
        self.atualizar()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        
        if CampeonatoManager.sharedInstance.clubesArray.count ==  0 {
            let semRegistrosLabel = UILabel()
            semRegistrosLabel.text = "Não há registros, verifique sua conexão\ne puxe para atualizar."
            semRegistrosLabel.textAlignment = .center
            semRegistrosLabel.lineBreakMode = .byWordWrapping
            semRegistrosLabel.numberOfLines = 2
            
            self.tableView.backgroundView = semRegistrosLabel
            self.tableView.separatorStyle = .none
            
            return 0
        }
        
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return CampeonatoManager.sharedInstance.clubesArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ClubeCell", for: indexPath) as! ClubeTableViewCell

        let clube = CampeonatoManager.sharedInstance.clubesArray[indexPath.row]
        
        cell.escudoImageView.kf.indicatorType = .activity
        cell.escudoImageView.kf.setImage(with: URL(string: clube.escudoUrl!))
        
        cell.posicaoLabel.text = NSString.init(format: "%d", clube.posicao!) as String
        cell.nomeLabel.text = clube.nome

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
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

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

}
