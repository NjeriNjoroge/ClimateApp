//
//  ViewController.swift
//  ClimateApp
//
//  Created by Grace Njoroge on 25/06/2020.
//  Copyright © 2020 Grace. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
  
  let weatherURL = "https://api.openweathermap.org/data/2.5/weather"
  let appID = "0fd65ae8051cec4f21c386659c25955b"
  
  lazy var mainImageView: UIImageView = {
    let img = UIImageView()
    img.contentMode = .scaleAspectFill
    img.image = UIImage(named: "treeTrunk")
    img.translatesAutoresizingMaskIntoConstraints = false
    return img
  }()
  
  lazy var temparatureLabel: UILabel = {
    let label = UILabel()
    label.text = "21°"
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 100.0)
    return label
  }()
  
  lazy var weatherIcon: UIImageView = {
    let img = UIImageView()
    img.contentMode = .scaleToFill
    img.translatesAutoresizingMaskIntoConstraints = false
    img.image = UIImage(named: "treeTrunk")
    return img
  }()
  
  lazy var loadingLabel: UILabel = {
    let label = UILabel()
    label.text = "Loading..."
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    label.font = UIFont.systemFont(ofSize: 30.0)
    return label
  }()
  
  lazy var arrowButton: UIButton = {
    let btn = UIButton(type: .custom)
    btn.tintColor = .white
    btn.setImage(UIImage(named: "arrows"), for: .normal)
    btn.translatesAutoresizingMaskIntoConstraints = false
    btn.addTarget(self, action: #selector(openGetWeather), for: .touchUpInside)
    return btn
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
 
  }
  
  private func setupView() {
    view.addSubview(mainImageView)
    view.addSubview(temparatureLabel)
    view.addSubview(loadingLabel)
    view.addSubview(weatherIcon)
    view.addSubview(arrowButton)
    NSLayoutConstraint.activate([
      arrowButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
      arrowButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15)
    ])
    NSLayoutConstraint.activate([
      mainImageView.topAnchor.constraint(equalTo: view.topAnchor),
      mainImageView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      mainImageView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      mainImageView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
    NSLayoutConstraint.activate([
      temparatureLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      temparatureLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
    ])
    NSLayoutConstraint.activate([
      weatherIcon.topAnchor.constraint(equalTo: temparatureLabel.bottomAnchor, constant: 15),
      weatherIcon.widthAnchor.constraint(equalTo: view.widthAnchor, constant: 100),
      weatherIcon.heightAnchor.constraint(equalToConstant: 200)
    ])
    NSLayoutConstraint.activate([
      loadingLabel.topAnchor.constraint(equalTo: weatherIcon.bottomAnchor, constant: 15),
      loadingLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15)
    ])
  }
  
  @objc private func openGetWeather() {
    let nextVC = GetWeatherViewController()
    self.present(nextVC, animated: true, completion: nil)
  }


}

