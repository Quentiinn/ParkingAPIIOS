//
//  DetailViewController.swift
//  ProjetParking
//
//  Created by quentin courvoisier on 11/02/2018.
//  Copyright © 2018 com.iut-bm.univ. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var lblPrix: UILabel!
    @IBOutlet weak var lblAdresse: UILabel!
    
    @IBOutlet weak var lblSouterrain: UILabel!
    
    @IBOutlet weak var lblSurveiller: UILabel!
    @IBOutlet weak var lblDispo: UILabel!
    @IBOutlet weak var BtReserver: UIButton!
    @IBAction func onClickReserver(_ sender: Any) {
        print("reserver")
        
        //let postString = "name=nom&age=20&point=344&capitaine=true"
        let postString = "id=\(id)&id_utilisateur=1"
        print(postString)
        // create post request
        let url = URL(string: "http://quentindev.ovh/Parking/user.php?todo=reserver")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // insert json data to the request
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            print(data)
        }
        
        task.resume()
        
    }
    var adresse: String = ""
    var prix: Int16 = 0
    var dispo: Int16 = 0
    var surveiller: Int16 = 0
    var souterrain: Int16 = 0
    var id: Int16 = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        lblAdresse.text = adresse
        lblPrix.text = String(prix)
        lblDispo.text = String(dispo)
        lblSouterrain.text = String(souterrain)
        lblSurveiller.text = String(surveiller)
        
        // Do any additional setup after loading the view.
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
