//
//  MainVC.swift
//  SignIn
//
//  Created by 김혜빈 on 2021/01/17.
//

import UIKit

extension UIView{
    func setGradient(color1:UIColor,color2:UIColor){
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1.cgColor,color2.cgColor]
        gradient.frame = bounds
        layer.addSublayer(gradient)
    }
}


class MainVC: UIViewController {
    let gradientView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    func setupView() {
        self.view.backgroundColor = .white
        
        setupGradientView()
    }
    
    func setupGradientView() {
        gradientView.clipsToBounds = false
        self.view.addSubview(gradientView)
        
        gradientView.translatesAutoresizingMaskIntoConstraints = false
        gradientView.topAnchor.constraint(equalTo: self.view.topAnchor, constant: self.view.safeAreaInsets.top * -1).isActive = true
        gradientView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        gradientView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        gradientView.frame.size = CGSize(width: self.view.frame.width, height: self.view.frame.height * 0.4)
        gradientView.setGradient(color1: UIColor(named: "MountainColor") ?? .systemPink, color2: .white)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
