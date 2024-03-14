//
//  ViewController.swift
//  project2
//
//  Created by EnesÖzcan on 23.02.2024.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var button1: UIButton!
    
    @IBOutlet var button2: UIButton!
    
    @IBOutlet var button3: UIButton!
    
    @IBOutlet var scoreLabel: UILabel!
    
    
    // Ülke adlarını tutacak dizi
    var countries = [String]()
        
        // Skor ve doğru cevap sayısı
    var score = 0
    var correctAnswer = 0
        
        // Kalan soru sayısı
    var kalanSoru = 10
        
        // ViewController'ın görünümü yüklendiğinde çağrılan yöntem
    override func viewDidLoad() {
        super.viewDidLoad()
            
            // Ülke adlarını diziye ekliyoruz
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]
            
            // Butonlara kenarlık ve rengi ayarlanıyor
        button1.layer.borderWidth = 4
        button2.layer.borderWidth = 4
        button3.layer.borderWidth = 4
            
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
            
            // Soru soruluyor
        askQuestion()
            
            // Navigation bar'a durdurma butonu ekleniyor
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .stop, target: self, action: #selector(scoreTapped))
    }
        
        // Soru sormak için kullanılan yöntem
    func askQuestion(action: UIAlertAction! = nil) {
        countries.shuffle() // Ülkeleri karıştırıyoruz
            
        correctAnswer = Int.random(in: 0...2) // Doğru cevabı rastgele belirliyoruz
            
            // Butonlara rastgele ülkelerin bayraklarını ekliyoruz
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
            
            // Navigation bar'ın başlığını doğru cevabın ülke adı yaparak gösteriyoruz
        title = countries[correctAnswer].uppercased()
        }
    
    @IBAction func ButtonTapped(_ sender: UIButton) {
        var title: String
                
                // Doğru cevap kontrolü
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
            kalanSoru -= 1
            scoreLabel.text = ("Score: \(score)")
        } else {
            title = "Wrong"
            score -= 1
            kalanSoru -= 1
            scoreLabel.text = ("Score: \(score)")
        }
                
        // Alert mesajı oluşturuluyor
        let ac = UIAlertController(title: title, message: "Doğru yapılan soru sayısı: \(correctAnswer) \n Kalan soru sayısı: \(kalanSoru)", preferredStyle: .alert)
                
        // Kalan soru sayısı 0 ise oyun sıfırlanıyor
        if kalanSoru == 0 {
            ac.message = "Soru hakkın bitti. \n Skorun \(score)"
            score = 0
            kalanSoru = 10
            correctAnswer = 0
            scoreLabel.text = "Score: 0"
        }
                
        // Yanlış cevap verildiğinde doğru cevabı gösteriyoruz
        if sender.tag != correctAnswer {
            ac.message = "Correct answer is: \(correctAnswer)"
        }
                
        // Devam et butonu ekleniyor ve soru sorma işlemi devam ediyor
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
                present(ac, animated: true)
    }
            
    // Skor butonuna tıklanınca çağrılan yöntem
    @objc func scoreTapped(action: UIAlertAction! = nil) {
        let alert = UIAlertController(title: title, message: "score: \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "score", style: .default, handler: askQuestion))
                present(alert, animated: true)
    }
            
}

