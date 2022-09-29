//
//  AlumnoController.swift
//  EjNavigation Controller
//
//  Created by Alumno on 22/09/22.
//  Copyright © 2022 ULSA. All rights reserved.
//

import UIKit

class AlumnoController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    @IBOutlet weak var tvAlumnos: UITableView!
    var alumnos : [Alumno] = []
    
    var materias1 : [Materia] = []
    var materias2 : [Materia] = []
    var materias3 : [Materia] = []

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alumnos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaAlumno") as? CeldaAlumnoController
            celda?.lblNombre.text = alumnos[indexPath.row].nombre
            celda?.lblCarrera.text = alumnos[indexPath.row].carrera
            celda?.lblMatricula.text = alumnos[indexPath.row].matricula
            return celda!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destino = segue.destination as! DetallesAlumnoController
        destino.alumno = alumnos[tvAlumnos.indexPathForSelectedRow!.row]
        
    }
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        materias1.append(Materia(nombre: "Historia", codigo: "3252AGW"))
        materias1.append(Materia(nombre: "Ingenieria", codigo: "NRTEB23"))
        
        materias2.append(Materia(nombre: "Derecho", codigo: "2562VS"))
        materias2.append(Materia(nombre: "Juicios justos", codigo: "43634BDRR"))

        materias3.append(Materia(nombre: "Ingles", codigo: "4Y7HRTBH"))
        materias3.append(Materia(nombre: "Aleman", codigo: "875353DBD"))

        alumnos.append(Alumno(nombre: "Max", matricula: "15647", carrera: "IPM", edad: 22, materias: materias1))
        alumnos.append(Alumno(nombre: "Cesar", matricula: "64367", carrera: "ITM", edad: 21,materias: materias2))
        alumnos.append(Alumno(nombre: "German", matricula: "35758", carrera: "TRE", edad: 21,materias: materias3))

        
    }
}
