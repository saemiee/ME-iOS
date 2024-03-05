//
//  HealthKitService.swift
//  ME
//
//  Created by 새미 on 3/5/24.
//

import HealthKit

class HealthKitService {
    let healthStore = HKHealthStore()
    
    let workoutTypes: [HKWorkoutActivityType] = [.walking, .swimming, .cycling, .pilates, .running, .elliptical, .coreTraining, .stepTraining]

    let read = Set([HKWorkoutType.workoutType()])
    let share = Set([HKWorkoutType.workoutType()])
    
    func configure() {
        if HKHealthStore.isHealthDataAvailable() {
            requestAuthorization()
        }
    }
    
    private func requestAuthorization() {
        self.healthStore.requestAuthorization(toShare: share, read: read) { success, error in
            if error != nil {
                print(error?.localizedDescription ?? "error")
            } else {
                if success {
                    print("권한이 허락되었습니다.")
                } else {
                    print("권한이 없습니다.")
                }
            }
        }
    }
    
    // MARK: - 운동데이터 가져오기
    func getWorkoutData() {
        
    }
}
