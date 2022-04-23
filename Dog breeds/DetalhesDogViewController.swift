//
//  DetalhesDogViewController.swift
//  Dog breeds
//
//  Created by Lucas da Silva Reis on 23/04/22.
//

import UIKit

class DetalhesDogViewController: UIViewController {
    
    var dog: Dog!
    
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dogImageView.image = dog.image
        tituloLabel.text = dog.titulo
        descricaoLabel.text = dog.descricao
    }
    

}
