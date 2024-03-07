//
//  HealthKitService.swift
//  ME
//
//  Created by 새미 on 3/7/24.
//

import HealthKit

class HealthKitService {
    
    let healthStore = HKHealthStore()
    let share = Set([HKObjectType.workoutType()])
    let read = Set([HKObjectType.workoutType()])
    
    let workoutTypes: [HKWorkoutActivityType] = [.walking, .swimming, .cycling, .pilates, .running, .elliptical, .coreTraining, .stepTraining, .functionalStrengthTraining, .hiking, .highIntensityIntervalTraining, .rowing]
    
    func requestAuthorization() {
        self.healthStore.requestAuthorization(toShare: share, read: read) { scuccess, error in
            if error != nil {
                print(error.debugDescription)
            } else {
                if scuccess {
                    print("권한 허락")
                } else {
                    print("권한 없음")
                }
            }
        }
    }
    
    func getWorkoutData(completion: @escaping (Double) -> Void) {
        let calendar = Calendar.current
        let now = Date()
        let startOfDay = calendar.startOfDay(for: now)
        let endOfDay = calendar.date(byAdding: .hour, value: 24, to: startOfDay)!
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: endOfDay, options: .strictEndDate)
        
        let query = HKSampleQuery(sampleType: HKObjectType.workoutType(), predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { query, result, error in
            // 각 소모 에너지 전달
        }
    }
}
