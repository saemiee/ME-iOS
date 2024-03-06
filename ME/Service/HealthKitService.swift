//
//  HealthKitService.swift
//  ME
//
//  Created by 새미 on 3/5/24.
//

import HealthKit

class HealthKitService {
    let healthStore = HKHealthStore()
    
    let workoutTypes: [HKWorkoutActivityType] = [.walking, .swimming, .cycling, .pilates, .running, .elliptical, .coreTraining, .stepTraining, .functionalStrengthTraining, .hiking, .highIntensityIntervalTraining, .rowing]
    
    let read = Set([HKWorkoutType.workoutType()])
    let share = Set([HKWorkoutType.workoutType()])
    
    var caloriesByActivityType: [HKWorkoutActivityType: Double] = [:]
    
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
    
    func getWorkoutData(completion: @escaping ([HKWorkoutActivityType: Double]?, Error?) -> Void) {
        let calendar = Calendar.current
        let now = Date()
        let startOfDay = calendar.startOfDay(for: now)
        let endOfDay = calendar.date(byAdding: .day, value: 1, to: startOfDay)!
        let predicate = HKQuery.predicateForSamples(withStart: startOfDay, end: endOfDay, options: .strictEndDate)
        
        for activityType in workoutTypes {
            let query = HKSampleQuery(sampleType: HKObjectType.workoutType(), predicate: predicate, limit: HKObjectQueryNoLimit, sortDescriptors: nil) { query, samples, error in
                guard let workouts = samples as? [HKWorkout], error == nil else {
                    completion(nil, error)
                    return
                }
                
                let totalCalories = workouts.reduce(0.0) { result, workout in
                    return result + (workout.totalEnergyBurned?.doubleValue(for: HKUnit.kilocalorie()) ?? 0.0)
                }
                
                self.caloriesByActivityType[activityType] = totalCalories
                completion(self.caloriesByActivityType, nil)
            }
            
            self.healthStore.execute(query)
        }
    }
}
