//
//  Dog.swift
//  Dog breeds
//
//  Created by Lucas da Silva Reis on 22/04/22.
//

import UIKit

class Dog {
    var titulo: String!
    var descricao: String!
    var image: UIImage!
    
    init(titulo: String, descricao: String, image: UIImage) {
        self.titulo = titulo
        self.descricao = descricao
        self.image = image
    }
}
