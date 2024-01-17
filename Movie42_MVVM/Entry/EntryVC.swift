import UIKit

class EntryViewController : UIViewController {
    @IBOutlet weak var idField: UITextField!
    @IBOutlet weak var pwdField: UITextField!
    
    private let viewModel = EntryViewModel()
    private let defaults = UserDefaultManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpBinders()
    }
    
    private func setUpBinders() {
        viewModel.error.bind { [weak self] error in
            if let error = error {
                print(error)
            } else {
                self?.goToMovieList()
            }
        }
    }
    
    //영화목록으로 가는 함수
    private func goToMovieList() {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "MovieListViewController") as? MovieListViewController else {
            return
        }
        present(controller, animated: true, completion: nil)
    }
    
    //처음회원가입 하는 경우
    @IBAction func signupBtnClicked(_ sender: Any) {
        guard let controller = storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as? SignupViewController else {
            return
        }
        present(controller, animated: true, completion: nil)
    }
    
    //로그인 버튼 눌러서 아이디 패스워드 확인
    @IBAction func loginBtnClicked(_ sender: Any) {
        guard let id = idField.text,
              let pwd = pwdField.text
        else { return }
        viewModel.login(id: id, password: pwd)
    }
    
    
}
