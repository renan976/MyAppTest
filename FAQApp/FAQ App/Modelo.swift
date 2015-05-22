//
//  Modelo.swift
//  FAQ App
//
//  Created by Renan Siqueira de Souza Mesquita on 15/05/15.
//  Copyright (c) 2015 Renan Siqueira de Souza Mesquita. All rights reserved.
//

import Foundation

//Dicioário contendo -> [categoria: [pergunta:resposta]]

/* --  Relações/Relacionamentos: -- */

//Uma categoria tem várias perguntas, junto de suas respectivas respostas

//Cada pergunta tem uma única resposta

let dicionário:[String:[String:String]] =
[
                                           "Dúvidas Swift" : [
    
                                              "Pergunta com arquivo": "QA2",
                                    "Como se declara uma variável?" : "usando var",
                            "Como se declara uma constante? ":"Usando let"
    
                                                              ],
    
                                            "Dúvidas Site" : [
                                                
                                  "Como me registro no site?":"Através desse link"
    
                                                              ],
    
                                         "Administrativas" : [
                                            
                        "Quanto tempo tenho acesso ao curso?": "Durante 3 meses"
    
                                                              ]
]


//func getRequest(fileName: String) -> NSURLRequest {
//
//    return NSURLRequest(URL: NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(fileName, ofType: "rtf")!)!)
//
//}

//Aqui as instâncias dos requests dos arquivos com as respostas já são criadas e depois são apenas usadas pelo webView

//let novoDic:[String:NSURLRequest] = ["QA1": getRequest("QA1"),
//                                     "QA2": getRequest("QA2")]





