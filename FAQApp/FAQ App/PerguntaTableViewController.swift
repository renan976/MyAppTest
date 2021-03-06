//
//  PerguntaTableViewController.swift
//  FAQ App
//
//  Created by Renan Siqueira de Souza Mesquita on 15/05/15.
//  Copyright (c) 2015 Renan Siqueira de Souza Mesquita. All rights reserved.
//

import UIKit

class PerguntaTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var filteredResults: [String] = []
    var isSearching: Bool = false

    var questionArray: [String]!
    var selectedQuestion: String!
    var selectedCategory: String!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "Perguntas"
        self.searchBar.placeholder = "Busque por perguntas"
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredResults = dicionário[selectedCategory]!.keys.array.filter({
            
            //Verifica se existe alguma ocorrência do que foi digitado no searchBar em alguma parte do texto de cada célula
            
            (textInCell: String) -> Bool in
            let matched = textInCell.rangeOfString(searchText, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return matched != nil
            
        })
        
        //Se estiver vazio o searchBar significa que não está ocorrendo busca
        
        if searchBar.text.isEmpty {
            isSearching = false
        } else {
            isSearching = true
        }
        
        //Atualiza os dados conforme vai sendo digitado ao no searchBar
        
        self.tableView.reloadData()
    
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
        
        //Se o searchBar não estiver vazio, retorna o total da filtragem.
        
        if isSearching {
            
            return filteredResults.count
            
        }
        
        //conta as duplas chave:valor do segundo  dicionário (Q:A)
        
        return dicionário[selectedCategory]!.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("PerguntaPrototypeCell", forIndexPath: indexPath) as! UITableViewCell
        
        //Se o searchBar não estiver vazio, carrega no tableView os dados filtrados
        
        if isSearching {
            
            cell.textLabel?.text = self.filteredResults[indexPath.row]
            
        } else {
        
        //Atualiza as células com as perguntas do Array

        cell.textLabel?.text = questionArray[indexPath.row]
            
        }

        return cell
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //Verifica qual célula foi selecionada e guarda o texto dessa célula (pergunta)

        selectedQuestion = tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text
        
        //Dispara a segunda segue
        
        performSegueWithIdentifier("QuestionToAnswerSegue", sender: self)

    }
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        let newVC = segue.destinationViewController as! WebViewController
        
        //Passa para a próxima cena (de resposta) a pergunta selecionada
        
        newVC.question = selectedQuestion
        
        //Passa a a próxima cena (de reposta) a resposta correspondente a pergunta selecionada
        
        newVC.answer = dicionário[selectedCategory]![selectedQuestion]
        
    }
    

    
    
    
    
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */




}
