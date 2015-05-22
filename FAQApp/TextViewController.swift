//
//  TextViewController.swift
//  FAQ App
//
//  Created by Renan Siqueira de Souza Mesquita on 16/05/15.
//  Copyright (c) 2015 Renan Siqueira de Souza Mesquita. All rights reserved.
//

//import UIKit
//
////Limitação de uma única fonte no texto da resposta
//
//class TextViewController: UIViewController {
//    
//    @IBOutlet weak var textView: UITextView!
//    
//    var question: String!
//    var answer: String!
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        self.navigationItem.title = "Resposta"
//        
//        
//        //Deixa (true) ou não (false) o usuário editar a resposta
//        
//        textView.editable = false
//        
//        //Deixa (true) ou não (false) o usuário usar copy & paste por exemplo
//        
//        textView.userInteractionEnabled = true
//        
//        textView.font = UIFont(name: "Arial", size: 18)
//        
//        textView.text = question + "\n\n\n" + answer
//       
//        
//        // Do any additional setup after loading the view.
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//    
//    
//    /*
//    // MARK: - Navigation
//    
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//    // Get the new view controller using segue.destinationViewController.
//    // Pass the selected object to the new view controller.
//    }
//    */
//    
//}
