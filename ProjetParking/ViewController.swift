//
//  ViewController.swift
//  ProjetParking
//
//  Created by  on 22/01/2018.
//  Copyright © 2018 com.iut-bm.univ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var id: Int? = nil
    
    @IBOutlet weak var TextLogin: UITextField!
    @IBOutlet weak var TextPassword: UITextField!
    @IBAction func buttonConnection(_ sender: UIButton) {
            }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let postString = "name=" + TextLogin.text! + "&password=" + TextPassword.text!
        
        let url = URL(string: "http://quentindev.ovh/Parking/user.php?todo=user")
        var request = URLRequest(url: url!)
        request.httpMethod = "POST"
        
        request.httpBody = postString.data(using: String.Encoding.utf8)
        
        
        let task = URLSession.shared.dataTask(with: request){data , response, error in
            if let data = data,
                let raw =  try? JSONSerialization.jsonObject(with: data),
                let json = raw as? [String: String]{
                DispatchQueue.main.async {
                    var id: Int;
                    id = Int(json["id"]!)!;
                    print("azeazeazeaze")
                    print(id)
                    let nav = segue.destination as! TabBarController
                    nav.id = id
                }
            }
        }
        task.resume()

       
    }

    
    
    @IBAction func unwindFromMapViewController(segue: UIStoryboardSegue){
    }


}

