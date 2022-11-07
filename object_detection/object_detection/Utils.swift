//
//  ViewController.swift
//  object_detection
//
//  Created by mostafizur_admin on 4/11/22.
//

import UIKit
import Vision

let classes = [
    "person",
    "bicycle",
    "car",
    "motorcycle",
    "airplane",
    "bus",
    "train",
    "truck",
    "boat",
    "traffic light",
    "fire hydrant",
    "stop sign",
    "parking meter",
    "bench",
    "bird",
    "cat",
    "dog",
    "horse",
    "sheep",
    "cow",
    "elephant",
    "bear",
    "zebra",
    "giraffe",
    "backpack",
    "umbrella",
    "handbag",
    "tie",
    "suitcase",
    "frisbee",
    "skis",
    "snowboard",
    "sports ball",
    "kite",
    "baseball bat",
    "baseball glove",
    "skateboard",
    "surfboard",
    "tennis racket",
    "bottle",
    "wine glass",
    "cup",
    "fork",
    "knife",
    "spoon",
    "bowl",
    "banana",
    "apple",
    "sandwich",
    "orange",
    "broccoli",
    "carrot",
    "hot dog",
    "pizza",
    "donut",
    "cake",
    "chair",
    "couch",
    "potted plant",
    "bed",
    "dining table",
    "toilet",
    "tv",
    "laptop",
    "mouse",
    "remote",
    "keyboard",
    "cell phone",
    "microwave",
    "oven",
    "toaster",
    "sink",
    "refrigerator",
    "book",
    "clock",
    "vase",
    "scissors",
    "teddy bear",
    "hair drier",
    "toothbrush"
];

let colors = classes.reduce(into: [String: [CGFloat]]()) {
    $0[$1] = [Double.random(in: 0.0 ..< 1.0),Double.random(in: 0.0 ..< 1.0),Double.random(in: 0.0 ..< 1.0),0.5]
}


func createDetectionTextLayer(_ bounds: CGRect, _ text: NSMutableAttributedString, length:Int) -> CATextLayer {
    let textLayer = CATextLayer()
    textLayer.string = text
    textLayer.bounds = CGRect(x: 0, y: 0, width: length * 12, height: 30)
    textLayer.position = CGPoint(x: bounds.midX - bounds.width / 2, y: bounds.midY)
    textLayer.cornerRadius = 13
    textLayer.masksToBounds  = true
    textLayer.backgroundColor = UIColor.gray.cgColor
    textLayer.contentsScale = 10.0
    textLayer.alignmentMode = .center
    textLayer.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat(.pi / 2.0)).scaledBy(x: 1.0, y: -1.0))
    textLayer.display()
    return textLayer
}

func createInferenceTimeTextLayer(_ bounds: CGRect, _ text: NSMutableAttributedString) -> CATextLayer {
    let inferenceTimeTextLayer = CATextLayer()
    inferenceTimeTextLayer.string = text
    inferenceTimeTextLayer.frame = bounds
    inferenceTimeTextLayer.contentsScale = 10.0
    inferenceTimeTextLayer.alignmentMode = .center
    return inferenceTimeTextLayer
}

func createRectLayer(_ bounds: CGRect, _ color: [CGFloat]) -> CALayer {
    let shapeLayer = CALayer()
    shapeLayer.bounds = bounds
    shapeLayer.position = CGPoint(x: bounds.midX, y: bounds.midY)
    shapeLayer.borderColor = CGColor.init(red: 1, green: 0, blue: 0, alpha: 1)
    shapeLayer.borderWidth = 2
    shapeLayer.backgroundColor = CGColor(colorSpace: CGColorSpaceCreateDeviceRGB(), components: color)
    return shapeLayer
}


