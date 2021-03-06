//
//  CategoryTableViewController.swift
//  
//
//  Created by Renan Siqueira de Souza Mesquita on 15/05/15.
//
//

import UIKit

class CategoryTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var isSearching: Bool = false
    var filteredResults: [String] = []
    
    var selectedCategory: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Atualiza a imagem do logo da MobGeek na NavigationBar dos 3 ViewControllers que estão conectados hierarquicamente ao mesmo NavigationController
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(named: "MobGeekLogo.jpg"), forBarMetrics: .Default)
        
        
        self.navigationItem.title = "Categorias"
        self.searchBar.placeholder = "Busque por categorias"
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    /* --- Se for implementar os métodos comentados abaixo, adotar o protocolo UISearchBarDelegate --- */
    
//    func searchBarTextDidBeginEditing(searchBar: UISearchBar) {
//        isSearching = true
//    }
//    func searchBarTextDidEndEditing(searchBar: UISearchBar) {
//        isSearching = false
//    }
//    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
//        isSearching = false
//    }
//    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
//        isSearching = false
//    }
    
    
    
    func searchBar(searchBar: UISearchBar, textDidChange searchText: String) {
        
        filteredResults = dicionário.keys.array.filter({
            
            //Verifica se existe alguma ocorrência do que foi digitado no searchBar em alguma parte do texto de cada célula do tableView
            
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
        
        //Atualiza os dados conforme vai sendo digitado algo no searchBar
        
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
        
        //Conta as duplas chave:valor do dicionário (categorias:[Q:A])
        
        return dicionário.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("CategoryPrototypeCell", forIndexPath: indexPath) as! UITableViewCell
        
        //Se o searchBar não estiver vazio, carrega no tableView os dados filtrados
        
        if isSearching {
            
            cell.textLabel?.text = filteredResults[indexPath.row]
            
        } else {
            
            //Agrupa as chaves do dicionário (categorias) em uma Array e ordena seus valores em ordem alfabética
            
            var categoryArray = sorted(dicionário.keys.array, <)
            
            //Atualiza cada célula com as categorias da Array
            
            cell.textLabel?.text = categoryArray[indexPath.row]
            
        }

        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        //Verifica qual célula foi selecionada e guarda o texto dessa célula (categoria)
    
        selectedCategory = tableView.cellForRowAtIndexPath(indexPath)?.textLabel?.text
        
        //Dispara a primeira segue
        
        performSegueWithIdentifier("CategoryToQuestionSegue", sender: self)
        
    }
    
    // MARK: - Navigation
    
    //In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        let newVC = segue.destinationViewController as! PerguntaTableViewController
        
        //Passa para a próxima cena (de perguntas) uma Array contendo todas as perguntas da categoria selecionada em ordem alfabética
        
        newVC.questionArray = sorted(dicionário[selectedCategory]!.keys.array, <)
        
        //Passa também a categoria selecionada para usar como chave no dicíonário na próxima cena (de perguntas)
        
        newVC.selectedCategory = selectedCategory
       
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
    // Override to support conditional rearrangingof the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return NO if you do not want the item to be re-orderable.
        return true
    }
    */


}
