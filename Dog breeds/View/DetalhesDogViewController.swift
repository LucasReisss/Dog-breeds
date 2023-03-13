//
//  DetalhesDogViewController.swift
//  Dog breeds
//
//  Created by Lucas da Silva Reis on 23/04/22.
//

import UIKit

class DetalhesDogViewController: UIViewController {
    
    var dog: Dog?
    
    
    @IBOutlet weak var dogImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descricaoLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getdata()
    }
    
    func getdata() {
        guard let dogImage = dog?.image else {return}
        guard let dogTitleLabel = dog?.name else {return}
        guard let dogDescription = dog?.description else {return}

        dogImageView.image = UIImage(named: dogImage)
        tituloLabel.text = dogTitleLabel
        descricaoLabel.text = dogDescription
    }
    

}
