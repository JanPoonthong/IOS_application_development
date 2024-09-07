//
//  ViewController.swift
//  three-chart-exercise
//
//  Created by Jan Poonthong on 7/9/2567 BE.
//

import UIKit
import DGCharts

class ViewController: UIViewController {

    var lineChartView: LineChartView!
    var barChartView: BarChartView!
    var pieChartView: PieChartView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        lineChartView = LineChartView()
        lineChartView.frame = CGRect(x: 0, y: 110, width: self.view.frame.width, height: 200)
        view.addSubview(lineChartView)
        setLineChartData()
        
        barChartView = BarChartView()
        barChartView.frame = CGRect(x: 0, y: 350, width: self.view.frame.width, height: 200)
        view.addSubview(barChartView)
        setBarChartData()
        
        pieChartView = PieChartView()
        pieChartView.frame = CGRect(x: 0, y: 600, width: self.view.frame.width, height: 200)
        view.addSubview(pieChartView)
        setPieChartData()
    }
    
    func setPieChartData() {
        let dataEntries = [PieChartDataEntry(value: 40, label: "John"), PieChartDataEntry(value: 30, label: "Jack"), PieChartDataEntry(value: 15, label: "James"), PieChartDataEntry(value: 15, label: "Joy")]
        let chartDataSet = PieChartDataSet(entries: dataEntries, label: "Prices")
        chartDataSet.colors = [NSUIColor.blue, NSUIColor.green, NSUIColor.red, NSUIColor.orange]
        let chartData = PieChartData(dataSet: chartDataSet)
        pieChartView.data = chartData
    }
    
    func setBarChartData() {
        let dataEntries = [BarChartDataEntry(x: 0, y: 10), BarChartDataEntry(x: 1, y: 14), BarChartDataEntry(x: 2, y: 12), BarChartDataEntry(x: 3, y: 18)]
        let chartDataSet = BarChartDataSet(entries: dataEntries, label: "Prices")
        chartDataSet.colors = [NSUIColor.cyan]
        let chartData = BarChartData(dataSet: chartDataSet)
        chartData.barWidth = 0.9
        barChartView.data = chartData
    }
    
    func setLineChartData() {
        let dataEntries = [ChartDataEntry(x: 0.0, y: 10), ChartDataEntry(x: 1.0, y: 14), ChartDataEntry(x: 2.0, y: 12), ChartDataEntry(x: 3.0, y: 18)]
        let chartDataSet = LineChartDataSet(entries: dataEntries, label: "Line Chart")
        chartDataSet.colors = [NSUIColor.cyan]
        chartDataSet.circleColors = [NSUIColor.cyan]
        let chartData = LineChartData(dataSet: chartDataSet)
        lineChartView.data = chartData
    }


}

