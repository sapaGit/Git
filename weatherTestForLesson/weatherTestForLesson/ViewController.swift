//
//  ViewController.swift
//  weatherTestForLesson
//
//  Created by Sergey Pavlov on 21.07.2022.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {

    @IBOutlet var tempLabel: UILabel!
    @IBOutlet var cityLabel: UILabel!
    @IBOutlet var weatherDescription: UILabel!
    
    
    let locationManager = CLLocationManager()
    var weatherData = WeatherData()
    override func viewDidLoad() {
        super.viewDidLoad()
        startLocationManager()
    }
    
    func startLocationManager() {
        // запрос разерешния пользователя
        locationManager.requestWhenInUseAuthorization()
        
        //проверка работы геолокации на устройстве пользователя
        if CLLocationManager.locationServicesEnabled() {
            
            //при изменении местоположения срабатывает метод делегата и получаются новые координаты
            locationManager.delegate = self
           
            //точность получения координат - метод получения новых координат не будет срабатывать при изменении местоположения менее расстояния точности
            locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters
            
            //для экономии энергии периодически locationManager отключается
            locationManager.pausesLocationUpdatesAutomatically = false
            
            //запуск слежения за местоположением
            locationManager.startUpdatingLocation()
        }
    }
    func updateScreen(temp: Double, city: String, description: String) {
        tempLabel.text = String(temp)
        cityLabel.text = city
        weatherDescription.text = description
    }
    
    func updateWeatherInfo(latitude: Double, longitude: Double) {
        let session = URLSession.shared
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=9dc585ecc48e43d2d2420f0b3d434e7d")!
        let task = session.dataTask(with: url) { data, response, error in
            guard error == nil else {
                print("DataTask error: \(String(describing: error))")
                return
            }
            
            do {
                self.weatherData = try JSONDecoder().decode(WeatherData.self, from: data!)
                DispatchQueue.main.async {
                    self.updateScreen(temp: self.weatherData.main.temp, city: self.weatherData.name, description: self.weatherData.weather[0].weatherDescription.capitalized)
                }
                print(self.weatherData)
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}

extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let lastLocation = locations.last {
            updateWeatherInfo(latitude: lastLocation.coordinate.latitude, longitude: lastLocation.coordinate.longitude)
        }
    }
}
