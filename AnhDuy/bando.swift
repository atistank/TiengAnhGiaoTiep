//
//  bando.swift
//  Duy
//
//  Created by Duy on 4/24/17.
//  Copyright © 2017 Developers Academy. All rights reserved.
//

import UIKit
import MapKit
class bando: UIViewController {

    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let span:MKCoordinateSpan = MKCoordinateSpanMake(0.41111111, 0.511223)
        let location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(10.371196, 105.432474)
        let region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        map.setRegion(region, animated: true)

        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = "Đại Học An Giang"
        annotation.subtitle = "Cùng nhau học nhóm để trao dồi tiếng anh nhé !"
        map.addAnnotation(annotation)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
