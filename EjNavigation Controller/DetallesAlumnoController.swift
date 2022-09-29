//
//  DetallesAlumnoController.swift
//  EjNavigation Controller
//
//  Created by Alumno on 27/09/22.
//  Copyright © 2022 ULSA. All rights reserved.
//

import UIKit

class DetallesAlumnoController : UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var lblValorEdad: UILabel!
    @IBOutlet weak var lblValorMatricula: UILabel!
    @IBOutlet weak var lblValorCarrera: UILabel!

    var alumno : Alumno?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if alumno != nil{
            self.title = alumno?.nombre
            lblValorMatricula.text = alumno?.matricula
            lblValorEdad.text = "\(alumno!.edad)"
            lblValorCarrera.text = alumno!.carrera
            
        }else{
            self.title = "Detalles de Alumno"
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumno!.materias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaMateria") as? CeldaMateriaController
        celda?.lblMateria.text = alumno!.materias[indexPath.row].nombre
        celda?.lblCodigo.text = alumno!.materias[indexPath.row].codigo
        
        return celda!
    }
    
}
