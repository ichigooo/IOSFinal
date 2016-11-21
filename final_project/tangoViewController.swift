//
//  tangoViewController.swift
//  final_project
//
//  Created by Linna Wang on 11/12/16.
//  Copyright © 2016 Linna Wang. All rights reserved.
//

import UIKit

class tangoViewController: UIViewController, UITableViewDataSource, UITabBarDelegate, UITableViewDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    var tangoA = ["嗚呼(ああ)", "相(あい)", "相変わらず(あいかわらず)", "愛想(あいそ)"]
    var tangoI = ["依(い)", "良い(いい)", "伊井(いい)", "否(いいえ)"]
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return tangoA.count
        } else {
            return tangoI.count
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        
        if indexPath.section == 0 {
            var tangoContent = tangoA[indexPath.row]
            cell.textLabel?.text = tangoContent
            return cell
        } else {
            var tangoContent = tangoI[indexPath.row]
            cell.textLabel?.text = tangoContent
            return cell
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "あ行"
        } else {
            return "い行"
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            performSegue(withIdentifier: "oneSegue", sender: tangoA[indexPath.row])
        } else {
            performSegue(withIdentifier: "oneSegue", sender: tangoI[indexPath.row])
        }
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let guest = segue.destination as! DetailedViewController
        guest.tango = sender as! String
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            if indexPath.section == 0 {
                tangoA.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            } else {
                tangoI.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
