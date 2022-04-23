//
//  ViewController.swift
//  Dog breeds
//
//  Created by Lucas da Silva Reis on 22/04/22.
//

import UIKit

class ViewController: UITableViewController {
    var dogs: [Dog] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var dog: Dog
        
        dog = Dog(titulo: "Afghan Hound", descricao: "O Afghan Hound costuma ter pelos longos e finos, que parecem quase humanos, caso estejam bem escovados. Entre suas cores principais, o galgo afegão pode ter cores como creme, branco, preto e cinza entre suas tonalidades majoritárias, mas o cão pode ter todas as cores para ser considerado como parte dessa raça.", image: UIImage(named: "Afghan Hound")!)
        dogs.append(dog)
        
        dog = Dog(titulo: "Pastor Alemão", descricao: "O pastor alemão, também chamado de capa preta, ostenta em seu rosto a sua personalidade confiante e corajosa, enquanto suas atitudes costumam expressar toda a sua força, inteligência e instinto protetor. ", image: UIImage(named: "Pastor Alemão")!)
        dogs.append(dog)
        
        dog = Dog(titulo: "Akita", descricao: " O Akita precise de uma dose extra de paciência para o adestramento, é um ótimo companheiro – protetor, leal e muito brincalhão. ", image: UIImage(named: "Akita")!)
        dogs.append(dog)
        
        dog = Dog(titulo: "American Bully", descricao: " A esperteza é um ponto forte e, caso ele perceba estranhos com más intenções, pode alertar a família com latidos. No entanto, não deve ser considerado um cão de vigilância, uma vez que tudo o que quer é uma grande proximidade com seu dono e sua família. ", image: UIImage(named: "American Bully")!)
        dogs.append(dog)
        
        dog = Dog(titulo: "Basset hound", descricao: " Esse amigo de olhos caídos e orelhas compridas vai fazer você se apaixonar! Uma das raças mais famosas e populares do mundo, o basset hound é um cachorro companheiro e amoroso. E a raça também é muito paciente e gentil, o que faz dela uma das favoritas dos amantes de cachorros. ", image: UIImage(named: "Basset hound")!)
        dogs.append(dog)
        
        dog = Dog(titulo: "Bernese", descricao: " O bernese é um cão conhecido por diferentes nomes, como boiadeiro de Berna e boiadeiro bernês e bernese mountain dog em outros países. Com seu pelo tricolor macio e característico em tons de preto, branco e caramelo, os cães da raça bernese são afetuosos, leais e companheiros. ", image: UIImage(named: "Bernese")!)
        dogs.append(dog)
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dogs.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let dog: Dog = dogs[indexPath.row]
        let celulaReuso = "celulaReuso"
        let celula = tableView.dequeueReusableCell(withIdentifier: celulaReuso, for: indexPath) as! DogCelula
        
        celula.tituloLabel.text = dog.titulo
        celula.descricaoLabel.text = dog.descricao
        celula.dogImageView.image = dog.image
        
        celula.dogImageView.layer.cornerRadius = 42
        celula.dogImageView.clipsToBounds = true
        
        return celula
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

