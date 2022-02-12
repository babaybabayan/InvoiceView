//
//  ViewController.swift
//  InvoiceView
//
//  Created by Binar - Akbar on 10/02/22.
//

import UIKit

class ViewController: UIViewController {
    // 3 items
    @IBOutlet var billKeyLabels: [UILabel]!{
        didSet { billKeyLabels.sort { $0.tag < $1.tag } }
    }
    @IBOutlet var billKeyValues: [UILabel]!{
        didSet { billKeyValues.sort { $0.tag < $1.tag } }
    }
    @IBOutlet var billKeyContainers: [UIStackView]!{
        didSet { billKeyContainers.sort { $0.tag < $1.tag } }
    }
    // 17 items
    @IBOutlet var billInfoLabels: [UILabel]! {
        didSet { billInfoLabels.sort { $0.tag < $1.tag } }
    }
    @IBOutlet var billInfoValues: [UILabel]! {
        didSet { billInfoValues.sort { $0.tag < $1.tag } }
    }
    @IBOutlet var billInfoContainers: [UIStackView]!{
        didSet { billInfoContainers.sort { $0.tag < $1.tag } }
    }
    
    @IBOutlet weak var confirmationTitleLabel: UILabel!
    @IBOutlet weak var confirmationSubtitleLabel: UILabel!
    @IBOutlet weak var productIcon: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var softitleLabel: UILabel!
    @IBOutlet weak var sofProductValueLabel: UILabel!
    @IBOutlet weak var accountBalanceLabel: UILabel!
    @IBOutlet weak var showBillInfoButtonLabel: UILabel!
    @IBOutlet weak var containerDetail: UIView!
    @IBOutlet weak var paymentButton: UIButton!
    
    var isShowingExpandedState: Bool = false {
        didSet {
            updateBillInfoViewVisibility()
        }
    }
    
    var object: DataClass? {
        didSet {
            setupInfoBill()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.setupView()
        self.initialState()
        self.object = DataClass.init()
    }
    
    private func initialState() {
        billInfoContainers.forEach({ $0.isHidden = true })
    }
    
    private func setupInfoBill() {
        guard let objects = object else { return }
        for i in 0..<objects.values.count {
            billInfoContainers[i].isHidden = false
            billInfoLabels[i].text = DataClass.init().keys[i]
            billInfoValues[i].text = DataClass.init().values[i]
        }
    }
    
    private func setupView() {
        showBillInfoButtonLabel.isUserInteractionEnabled = true
        let gesture = UITapGestureRecognizer(target: self, action: #selector(showBillInfoButtonLblTapped))
        showBillInfoButtonLabel.addGestureRecognizer(gesture)
        
        let allcontext = billInfoLabels + billInfoValues + billKeyLabels + billKeyValues
        allcontext.forEach({
            $0.font = UIFont.boldSystemFont(ofSize: 20)
        })
        
    }
    
    func updateBillInfoViewVisibility() {
        UIView.animate(withDuration: 0.2, delay: .zero, options: .curveEaseInOut, animations: {
            self.containerDetail.isHidden = self.isShowingExpandedState
        }, completion: nil)
        
    }
    
    @objc func showBillInfoButtonLblTapped(_ sender: UITapGestureRecognizer) {
        isShowingExpandedState.toggle()
    }
    
    struct DataClass {
        let keys: [String] = [
            "Nama CA",
            "Jenis Penerimaan",
            "Tanggal Buku",
            "Kode Nama Cabang CA",
            "NTB/NTL",
            "STAN",
            "Kode Billing",
            "NPWP",
            "Nama Wajib Pajak",
            "Alamat Wajib Pajak",
            "Nomer objek pajak",
            "Kode Akun",
            "Jenis Setoran",
            "Masa Pajak",
            "Nomor Ketetapan",
            "Jumlah Setoran",
            "Mata uang"
        ]
        
        let values: [String] = [
            "Mandiri",
            "Surat Berharga Negara",
            "22 Sep 2021",
            "4537GHJL67 Mandiri",
            "7859465783494785",
            "534645HJL8r74839",
            "35454365464564574567",
            "354543654645",
            "Amanda Kirana",
            "Jurang mangu no 23 RT03 / RW04, Kec. Matan, Kel. Urahan, Kota. Jakarta 40121",
            "6472354692",
            "2312312fgd45",
            "Penerimaan Negara Bukan Pajak",
            "September 2021",
            "1265325gfg4632",
            "Rp 100.000.000",
            "Rupiah"
        ]
    }

}

