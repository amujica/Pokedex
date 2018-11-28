//
//  RacesTableViewController.swift
//  Practica4
//
//  Created by g836 DIT UPM on 6/11/18.
//  Copyright © 2018 g836 DIT UPM. All rights reserved.
//

import UIKit

class RacesTableViewController: UITableViewController {
    
    var type: Type?
    var model = PokedexModel()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        if let tit = type?.name{
            title = tit
        }else {
            title = "NO TITLE"
        }
        //print(title!)
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    /*
    override func viewWillAppear(_ animated: Bool) {
        self.clearsSelectionOnViewWillAppear = self.splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }
    */
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return type?.races.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Race cell", for: indexPath)

        let race = type!.races[indexPath.row]
        
        // Configure the cell...

        cell.textLabel?.text = race.name
        cell.detailTextLabel?.text = "\(race.code)"
        cell.imageView?.image = UIImage(named: race.icon)
        
        return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "Show web info"{
            if let wvc = segue.destination as? WebViewController,
                let cell = sender as? UITableViewCell,
                let ip = tableView.indexPath(for: cell){
                
                wvc.race = (type?.races[ip.row])!
                
                //De esta forma comprobamos si el nombre del pokemon que se pasa es el correcto:
                //print((type?.races[ip.row].name)!)
            }
            
            }
        }
   /*
    @IBAction func goBack(_ segue: UIStoryboardSegue){
        if segue.identifier == "Show web info"{
            if segue.identifier == "Go Back"{
                if let rtvc = segue.source as? WebViewController{
                    //Si nos quisieramos traer algo, lo incluiriamos aqui con una variable
                }
            }
        }
            
    }*/

}
