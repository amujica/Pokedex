//
//  WebViewController.swift
//  Practica4
//
//  Created by g836 DIT UPM on 7/11/18.
//  Copyright © 2018 g836 DIT UPM. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    var race: Race?
    
    @IBOutlet weak var webView: UIWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let tit = race?.name{
            title = tit
        }else {
            title = "NO TITLE"
        }
        //Comprobamos si se pasa bien la raza
        //print((title)!)
        
/*
        //Para probar si se carga la pagina correctamente antes de diferenciar entre los distintos pokemon
        let str = "http://es.pokemon.wikia.com/wiki/WikiDex"
        
        if let url = URL(string: str){
            let req = URLRequest(url: url)
            webView.loadRequest(req)
        }
 */
        
        
        var str = "http://es.pokemon.wikia.com"
        
        if race != nil {
            if let path =  "wiki/\(race!.name)".addingPercentEncoding(withAllowedCharacters: .urlPathAllowed){
                str = "\(str)/\(path)"
                //Comprobamos si la ruta es la correcta
                //print(str)
            }
        } else {
            str = "http://es.pokemon.wikia.com/wiki/WikiDex"
        }
        if let url = URL(string: str){
            let req = URLRequest(url: url)
            webView.loadRequest(req)
        }
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
