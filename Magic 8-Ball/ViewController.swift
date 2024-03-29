import UIKit
import AVKit

class ViewController: UIViewController , UITextFieldDelegate{
    
    var circleButton = UIButton()
    var responseLabel = UILabel()
    
    @IBOutlet weak var myTextField: UITextField!
    
    var labelOne = UILabel()//Tells user to press white circle or shake phone again to reshuffle responses
    let responses = ["It is certain.", "It is decidedly so.", "Without a doubt.", "Yes–definetly.", "You may rely on it.", "As I see it, yes.", "Most likely.", "Outlook good.", "Yes.", "Signs point to yes.", "Reply hazy, try again.", "Ask again later.", "Better not tell you now.", "If I tell you, it won't happen.", "Concentrate and ask again.", "Don't count on it.", "My reply is no.", "My sources say no.", "Outlook not so good.", "Very doubtful."]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.becomeFirstResponder()
        myTextField.delegate = self
        view.backgroundColor = UIColor.black
        
        //Create white circle
        let circle = UIView(frame: CGRect(x: UIScreen.main.bounds.width/7.2, y: UIScreen.main.bounds.height/3, width: 300, height: 300))
        circle.backgroundColor = UIColor.clear
        circle.layer.borderWidth = 300
        circle.layer.borderColor = UIColor.white.cgColor
        circle.layer.cornerRadius = 300/2
        self.view.addSubview(circle)
        
        //Add attributes to response shuffle button to be placed on top of the white circle
        circleButton.backgroundColor = UIColor.white
        circleButton = UIButton(frame: CGRect(x: 60, y: 300, width: 300, height: 300))
        circleButton.setTitle("8", for: .normal)
        circleButton.setTitleColor(UIColor.black, for: .normal)
        circleButton.titleLabel?.font = UIFont.systemFont(ofSize: 90.0, weight: .bold)
        circleButton.addTarget(self, action: #selector(self.pressed), for: .touchUpInside)
        self.view.addSubview(circleButton)
        
        //Add attributes to labelOne
        labelOne.frame = CGRect(x: 60, y: 213, width: 300, height: 60)
        labelOne.isHidden = true
        labelOne.text = "Type, tap the circle, or shake your device for a new response"
        labelOne.textColor = UIColor.white
        labelOne.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        labelOne.numberOfLines = 3
        labelOne.textAlignment = NSTextAlignment.center
        self.view.addSubview(labelOne)
        
        //Add attributes to responseLabel
        responseLabel.frame = CGRect(x: circle.frame.origin.x, y: circle.frame.origin.y+120, width: 300, height: 60)
        responseLabel.isHidden = true
        responseLabel.textColor = UIColor.black
        responseLabel.font = UIFont.systemFont(ofSize: 20.0, weight: .bold)
        responseLabel.numberOfLines = 0
        responseLabel.textAlignment = NSTextAlignment.center
        responseLabel.adjustsFontSizeToFitWidth = true
        self.view.addSubview(responseLabel)
        
//       myTextField.attributedPlaceholder = NSAttributedString(string: "Ask me a question...", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
//        myTextField.backgroundColor = UIColor.black
        
        
    }
    override var canBecomeFirstResponder: Bool//for shake feature
        {
        get
        {
            return true
        }
    }
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?)//for shake feature
    {
        if motion == .motionShake
        {
            changeResponse()
        }
    }
    @objc func pressed (sender: UIButton!)
    {
        changeResponse()
    }
    func changeResponse ()
    {
        circleButton.setTitleColor(UIColor.white, for: .normal)
        responseLabel.text = responses[Int.random(in: 0..<20)]
        labelOne.isHidden = false
        responseLabel.isHidden = false
        let utterance = AVSpeechUtterance(string: "\(responseLabel.text!)")
        utterance.voice = AVSpeechSynthesisVoice(language: "en-UK")
        let synth = AVSpeechSynthesizer()
        synth.speak(utterance)
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        changeResponse()
        
        return true
    }
    
    
}
