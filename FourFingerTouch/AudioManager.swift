
//
//  AudioManager.swift
//  FourFingerTouch
//
//  Created by Gabriel Push on 5/21/24.
//

import Foundation
import SwiftUI
import AVKit
import Combine

class AudioRecorder: ObservableObject {
    let objectWillChange = PassthroughSubject<AudioRecorder, Never>()
    var audioRecorder: AVAudioRecorder!
    var audios: [URL] = []
    var recordingSession: AVAudioSession!
    var recording = false {
        didSet {
            objectWillChange.send(self)
        }
    }
    
    func startRecording() {
        do {
            self.recordingSession = AVAudioSession.sharedInstance()
            try self.recordingSession.setCategory(.playAndRecord)
            try recordingSession.setActive(true)
            
            recordingSession.requestRecordPermission { [unowned self] granted in
                if granted {
                    self.startActualRecording()
                } else {
                    print("Permission not granted")
                }
            }
        } catch {
            print("Failed to set recording session")
        }
    }
    
    func getAudios() {
        do {
            let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let result = try FileManager.default.contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: .producesRelativePathURLs)
            
            self.audios.removeAll()
            
            for i in result {
                self.audios.append(i)
                print(audios.description)
            }
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func startActualRecording() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .medium
        
        do {
            if self.recording {
                self.audioRecorder.stop()
                self.recording.toggle()
                self.getAudios()
                return
            }
            
            let docPath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            let audioFileName = docPath.appendingPathComponent("\(self.audios.count + 1) Record.m4a")
        
        let settings = [
            AVFormatIDKey: Int(kAudioFormatMPEG4AAC),
            AVSampleRateKey: 12000,
            AVNumberOfChannelsKey: 1,
            AVEncoderAudioQualityKey: AVAudioQuality.high.rawValue
        ]
            self.audioRecorder = try AVAudioRecorder(url: audioFileName, settings: settings)
            self.audioRecorder.record()
            self.recording = true
        } catch {
            print("Couldn't start recording: \(error.localizedDescription)")
        }
    }
    
    func stopRecording() {
        audioRecorder.stop()
        recording = false
    }
}


