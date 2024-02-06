import UIKit
import AVFoundation

class ViewController: UIViewController {
    var player: AVAudioPlayer?
    var url: URL!

    override func viewDidLoad() {
        super.viewDidLoad()

     
    }

    @IBAction func keyPressed(_ sender: UIButton) {
        playSound(input: sender.titleLabel?.text ?? "C")
    }

    func playSound(input: String) {
        if let soundURL = Bundle.main.url(forResource: "Sounds/\(input)", withExtension: "wav") {
            url = soundURL
        } else {
            print("Error: Could not find the sound file.")
        }
        do {
            guard let soundURL = url else {
                print("Error: Sound URL is nil.")
                return
            }
            player = try AVAudioPlayer(contentsOf: soundURL)
            player?.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
