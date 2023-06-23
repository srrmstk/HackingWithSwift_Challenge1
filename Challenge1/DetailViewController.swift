//
//  DetailViewController.swift
//  Challenge1
//
//  Created by srrmstk on 19.06.2023.
//

import UIKit

class DetailViewController: UIViewController {
  @IBOutlet var imageView: UIImageView!
  var picture = ""

  override func viewWillAppear(_ animated: Bool) {
    imageView.image = UIImage(named: picture)
  }

  override func viewWillDisappear(_ animated: Bool) {
    imageView.image = nil
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareFlag))
  }

  @objc
  func shareFlag() {
    let items = [picture, UIImage(named: picture) as Any]
    let vc = UIActivityViewController(activityItems: items, applicationActivities: nil)
    present(vc, animated: true)
  }
}
