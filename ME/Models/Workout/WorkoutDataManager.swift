//
//  WorkoutDataManager.swift
//  ME
//
//  Created by 새미 on 2/7/24.
//

import UIKit

final class WorkoutDataManager {
    
    private var workoutDataArray: [Workout] = []
    
    init() {
        makeWorkoutData()
    }

    func makeWorkoutData() {
        workoutDataArray = [
            Workout(workoutImage: UIImage(systemName: "figure.walk", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), workout: "걷기", kcal: 1000, point: 100),
            Workout(workoutImage: UIImage(systemName: "figure.open.water.swim", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), workout: "수영", kcal: 200, point: 2),
            Workout(workoutImage: UIImage(systemName: "figure.outdoor.cycle", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), workout: "사이클링", kcal: 1000, point: 100),
            Workout(workoutImage: UIImage(systemName: "figure.pilates", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), workout: "필라테스", kcal: 0, point: 0),
            Workout(workoutImage: UIImage(systemName: "figure.run", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), workout: "달리기", kcal: 0, point: 0),
            Workout(workoutImage: UIImage(systemName: "figure.elliptical", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), workout: "일립티컬", kcal: 0, point: 0),
            Workout(workoutImage: UIImage(systemName: "figure.core.training", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), workout: "코어 트레이닝", kcal: 0, point: 0),
            Workout(workoutImage: UIImage(systemName: "figure.stair.stepper", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), workout: "스텝퍼 운동", kcal: 0, point: 0),
            Workout(workoutImage: UIImage(systemName: "figure.strengthtraining.functional", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), workout: "기능성 근력 강화 운동", kcal: 0, point: 0),
            Workout(workoutImage: UIImage(systemName: "figure.hiking", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), workout: "하이킹", kcal: 0, point: 0),
            Workout(workoutImage: UIImage(systemName: "figure.highintensity.intervaltraining", withConfiguration: UIImage.SymbolConfiguration(pointSize: 24)), workout: "고강도 인터벌 트레이닝", kcal: 0, point: 0),
            Workout(workoutImage: UIImage(systemName: "figure.rower", withConfiguration: UIImage.SymbolConfiguration(pointSize: 22)), workout: "로잉 운동", kcal: 1000, point: 10)
        ]
    }
    
    func getWorkoutData() -> [Workout] {
        return workoutDataArray
    }
}
