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

let dicionário:[String:[String:String]] = ["Dúvidas Swift" : ["Como se declara uma variável?" : "Usando var",
                                                              "Como se declara uma constante? ":"Usando let"],
                                           "Dúvidas Site" : ["Como me registro no site?": "Através desse link: ..."],
                                           "Administrativas" : ["Quanto tempo tenho acesso ao curso?": "Durante 3 meses"]]

