//
//  ViewController.swift
//  dicoding-table-dynamic
//
//  Created by Ricky Primayuda Putra on 12/07/24.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var academyTableView: UITableView!
    override func viewDidLoad() {
      super.viewDidLoad()
     
      academyTableView.dataSource = self
      academyTableView.delegate = self
     
      academyTableView.register(
        UINib(nibName: "AcademyTableViewCell", bundle: nil),
        forCellReuseIdentifier: "AcademyCell"
      )
        
    }
    @IBAction func goToWebsite(_ sender: Any) {
        let urlDicoding = "https://www.dicoding.com"
          if let url = URL(string: urlDicoding), UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
          }
    }
}

extension ViewController: UITableViewDataSource {
 
  func tableView(
    _ tableView: UITableView,
    numberOfRowsInSection section: Int
  ) -> Int {
 
    return dummyAcademyData.count
  }

  func tableView(
    _ tableView: UITableView,
    cellForRowAt indexPath: IndexPath
  ) -> UITableViewCell {
 
      if let cell = tableView.dequeueReusableCell(
      withIdentifier: "AcademyCell",
      for: indexPath
    ) as? AcademyTableViewCell {
 
      let academy = dummyAcademyData[indexPath.row]
      cell.academyLabelView.text = academy.name
      cell.academyImageView.image = academy.image
 
      return cell
    } else {
 
      return UITableViewCell()
    }
  }
 
}

extension ViewController: UITableViewDelegate {
  func tableView(
    _ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath
  ) {
    performSegue(withIdentifier: "moveToDetail", sender: dummyAcademyData[indexPath.row])
  }
  override func prepare(
    for segue: UIStoryboardSegue,
    sender: Any?
  ) {
    if segue.identifier == "moveToDetail" {
      if let detaiViewController = segue.destination as? DetaillViewController {
        detaiViewController.academy = sender as? AcademyModel
      }
    }
  }
}
