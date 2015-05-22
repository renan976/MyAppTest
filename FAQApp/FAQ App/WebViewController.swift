//
//  WebViewController.swift
//  FAQ App
//
//  Created by Renan Siqueira de Souza Mesquita on 15/05/15.
//  Copyright (c) 2015 Renan Siqueira de Souza Mesquita. All rights reserved.
//

import UIKit

//Bom para ser usado quando temos respostas que requerem demonstração de código, pois possibilita a mudança de fonte via HTML.

class WebViewController: UIViewController {
    
    @IBOutlet weak var webView: UIWebView!
    
    var question: String!
    var answer: String!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Verifica se o path para o arquivo existe
        
        if let arquivo = NSBundle.mainBundle().pathForResource(answer, ofType: "rtf") {
            
            //Carrega o arquivo no webView
            
            var url = NSURL(fileURLWithPath: arquivo)
            var request = NSURLRequest(URL: url!)
            webView.loadRequest(request)
            
        } else {
            
            //Quer dizer que não há arquivo e então carrega a pergunta + resposta em String (Apenas para testes - no app final todas as perguntas vão ter um arquivo associado)
            
            webView.loadHTMLString("\(question) </br></br></br> \(answer)", baseURL: nil)
            
        }
        
       // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
