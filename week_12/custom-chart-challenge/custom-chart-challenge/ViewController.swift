//
//  ViewController.swift
//  custom-chart-challenge
//
//  Created by Jan Poonthong on 7/9/2567 BE.
//

import UIKit
import DGCharts

class ViewController: UIViewController {
    
    var lineChartView: LineChartView!
    
    @IBOutlet weak var outterView: UIView!
    @IBOutlet weak var insideView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        outterView.layer.cornerRadius = 8
        
        lineChartView = LineChartView()
        lineChartView.backgroundColor = .systemBlue
//        // Enable only axis lines
//        lineChartView.xAxis.drawAxisLineEnabled = true
//        lineChartView.leftAxis.drawAxisLineEnabled = true
//        lineChartView.rightAxis.drawAxisLineEnabled = true
//        
//        // Remove grid lines
//        lineChartView.xAxis.drawGridLinesEnabled = false
//        lineChartView.leftAxis.drawGridLinesEnabled = false
//        lineChartView.rightAxis.drawGridLinesEnabled = false
//        
//        // Remove any background grid and borders
//        lineChartView.drawGridBackgroundEnabled = false
//        lineChartView.drawBordersEnabled = false
//
//        // Hide axis labels
//        lineChartView.xAxis.drawLabelsEnabled = false
//        lineChartView.leftAxis.drawLabelsEnabled = false
//        lineChartView.rightAxis.drawLabelsEnabled = false
//
//        // Hide legend and description
//        lineChartView.legend.enabled = false
//        lineChartView.chartDescription.enabled = false
        
        lineChartView.xAxis.labelPosition = .bottom
        lineChartView.frame = CGRect(x: 0, y: 0, width: self.insideView.frame.width, height: 243)
        insideView.addSubview(lineChartView)
        setLineChartData()
    }
    
    func setLineChartData() {
        let dataEntries = [ChartDataEntry(x: 6.0, y: 9.0), ChartDataEntry(x: 7.0, y: 10.0), ChartDataEntry(x: 8.0, y: 27.0), ChartDataEntry(x: 9.0, y: 25.0), ChartDataEntry(x: 10.0, y: 11.0), ChartDataEntry(x: 11.0, y: 9.0), ChartDataEntry(x: 12.0, y: 11.0)]
        let chartDataSet = LineChartDataSet(entries: dataEntries)
        chartDataSet.colors = [NSUIColor.cyan]
        chartDataSet.circleColors = [NSUIColor.cyan]
        let chartData = LineChartData(dataSet: chartDataSet)
        lineChartView.data = chartData
    }


}

