//
//  GetWeatherViewController.swift
//  ClimateApp
//
//  Created by Grace Njoroge on 25/06/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class GetWeatherViewController: UIViewController {
  
  lazy var mainImageView: UIImageView = {
    let img = UIImageView()
    img.contentMode = .scaleAspectFill
    img.image = UIImage(named: "city")
    img.translatesAutoresizingMaskIntoConstraints = false
    return img
  }()
  
  lazy var cityNameTextField: UITextField = {
    let tf = UITextField()
    tf.placeholder = "Enter City Name"
    tf.textAlignment = .center
    tf.backgroundColor = .white
    tf.borderStyle = .roundedRect
    tf.translatesAutoresizingMaskIntoConstraints = false
    return tf
  }()
  
  lazy var getWeatherButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.tintColor = .white
    btn.setTitle("Get Weather", for: .normal)
    btn.titleLabel?.font = UIFont.systemFont(ofSize: 50)
    btn.translatesAutoresizingMaskIntoConstraints = false
    return btn
  }()
  
  lazy var backButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.tintColor = .white
    btn.setImage(UIImage(named: "backArrow"), for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.addTarget(self, action: #selector(dismissCurrentView), for: .touchUpInside)
    return btn
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }
  
  private func setupViews() {
    view.addSubview(mainImageView)
    view.addSubview(cityNameTextField)
    view.addSubview(getWeatherButton)
    view.addSubview(backButton)
    NSLayoutConstraint.activate([
      mainImageView.topAnchor.constraint(equalTo: view.topAnchor),
      mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      mainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      mainImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    NSLayoutConstraint.activate([
      cityNameTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: view.bounds.height/3),
      cityNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
      cityNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30)
    ])
    cityNameTextField.frame.size.height = 50
    NSLayoutConstraint.activate([
      getWeatherButton.topAnchor.constraint(equalTo: cityNameTextField.bottomAnchor, constant: 10),
      getWeatherButton.leadingAnchor.constraint(equalTo: cityNameTextField.leadingAnchor),
      getWeatherButton.trailingAnchor.constraint(equalTo: cityNameTextField.trailingAnchor)
    ])
    NSLayoutConstraint.activate([
      backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
      backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
    ])
  }
  
  @objc private func dismissCurrentView() {
    self.dismiss(animated: true, completion: nil)
  }

}
