//
//  ViewController.swift
//  movilesMiriam
//
//  Created by Arnold Norabuena on 6/9/23.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
   
    var listLibros: [Book] = []
    
    @IBOutlet weak var tvLibritos: UITableView!
    @IBOutlet weak var txtCriterio: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvLibritos.dataSource = self
        tvLibritos.delegate = self
    }
    func buscar(criterio:String){
        let urlbase: String = "https://api.itbook.store/1.0/search/" + criterio
        let urlConsuta = URL(string: urlbase)
        let request = URLRequest(url: urlConsuta!)
        let tarea = URLSession.shared.dataTask(with: request)
        {Datos,Respuesta, Error in
            if(Error == nil)    {
                if let libros = try? JSONDecoder().decode(BookResponse.self,from: Datos!){
                    self.listLibros = libros.books
                    DispatchQueue.main.async {
                        self.tvLibritos.reloadData()
                    }
                }
        }
        
    }
        tarea.resume()
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listLibros.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let fila = tvLibritos.dequeueReusableCell(withIdentifier: "celdita") as! BookTableViewCell
        fila.lblTitulo.text = "Titulo: " + listLibros[indexPath.row].title
         fila.lblPrecio.text = "Precio: " + listLibros[indexPath.row].price
        let url = URL(string: listLibros [indexPath.row].image)!
        if let data = try? Data(contentsOf:url){
            fila.imgImagen.image = UIImage(data:data)
    }
        return fila
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
}
    
    @IBAction func btnBuscar(_ sender: UIButton) {
        let datos = txtCriterio.text
        buscar(criterio: datos!)
    }
    
  
    
}
    


