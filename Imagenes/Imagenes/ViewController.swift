//
//  ViewController.swift
//  Imagenes
//
//  Created by Viviana Marcela Cruz Vega on 21/05/22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate {

    @IBOutlet weak var imagenv: UIImageView!
    @IBAction func buscarFoto(_ sender: UIButton) {
        let ipc = UIImagePickerController()
       // ipc.sourceType = .photoLibrary
        
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            ipc.sourceType = .camera
            //validar permiso de uso de la camara
            let permisos = AVCaptureDevice.authorizationStatus(for: .video)
            if permisos == .authorized {
                self.present(ipc, animated: true, completion: nil)
            }else{
                if permisos == .notDetermined{
                    AVCaptureDevice.requestAccess(for: .video){
                        respuesta in if respuesta{
                            self.present(ipc, animated: true, completion: nil)
                        }else{
                            print("no se que hacer :(")
                        }
                    }
                }else{
                    //.denied
                    let alert = UIAlertController(title: "Error", message: "Debe autorizar el uso de la cámara desde el app de configuración. Quieres hacerlo ahora?", preferredStyle:.alert)
                      let btnSI = UIAlertAction(title: "Si, por favor", style: .default) { action in
                          // lanzar el app de settings:
                          UIApplication.shared.open(URL(string: UIApplication.openSettingsURLString)!, options: [:], completionHandler: nil)
                      }
                      alert.addAction(btnSI)
                      alert.addAction(UIAlertAction(title: "NO", style: UIAlertAction.Style.destructive, handler: nil))
                      self.present(alert, animated: true, completion: nil)
                    
                }
            }
            
            
        }else{
            ipc.sourceType = .photoLibrary
        }
        
        
        
        ipc.delegate = self
        //permitir edicion
        ipc.allowsEditing = true
        self.present(ipc, animated: true, completion: nil)
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("seleccionó")
        if let imagen = info[.editedImage] as? UIImage{
            //cambiar la resolucion de la imagen
            UIGraphicsBeginImageContextWithOptions(imagen.size, true, 0.75)
            imagen.draw(in: CGRect(origin: .zero, size: imagen.size))
            let nuevaImagen = UIGraphicsGetImageFromCurrentImageContext()
            
            UIGraphicsEndImageContext()
            
            
            imagenv.image = imagen
            if picker.sourceType == .camera{
                //para guardar la imagen en la galeria
                //se requiere la llave privacy - photo library usage description en el archivo info.plist
               // UIImageWriteToSavedPhotosAlbum(imagen, nil, nil, nil)
                MiAlbum.instance.guardar(imagen)
            }
            
        }
        picker.dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print("canceló")
        picker.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }


}

