//
//  ViewController.swift
//  Dog breeds
//
//  Created by Lucas da Silva Reis on 22/04/22.
//

import UIKit

class ViewController: UITableViewController, DogViewModelDelegate {
    
    let viewModel = DogViewModel()
    var dogs: [Dog] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.delegate = self
        viewModel.getDogs()
    }
    
    func didFetchDogs(dogs: [Dog]) {
        self.dogs = dogs
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celulaReuso", for: indexPath) as! DogCelula
        let dog = dogs[indexPath.row]
        
        cell.tituloLabel.text = dog.name
        cell.descricaoLabel.text = dog.description
        cell.dogImageView.image = UIImage(named: dog.image ?? "")
        
        cell.dogImageView.layer.cornerRadius = 42
        cell.dogImageView.clipsToBounds = true
        
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let detalheDog = "detalheDog"
        if segue.identifier == detalheDog {
            if let indexPath = tableView.indexPathForSelectedRow {
                let dogSelecionado = self.dogs[indexPath.row]
                let viewControllerDestino = segue.destination as! DetalhesDogViewController
                viewControllerDestino.dog = dogSelecionado
            }
        }
    }
     


}
