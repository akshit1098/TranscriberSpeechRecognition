# 📝 Transcriber iOS App

**Transcriber** is a SwiftUI-based iOS application that provides real-time voice-to-text transcription using Apple’s native Speech Recognition framework. Built with CoreData for offline storage and structured using the MVVM design pattern, Transcriber is perfect for users who need fast, accurate, and searchable speech transcriptions on the go.

---

## 📲 Features

- 🎙️ **Live Speech Recognition**
  - Converts spoken audio into text in real-time
  - Supports multiple locales and dialects
  - Handles audio interruptions gracefully

- 💾 **Local Data Persistence with CoreData**
  - Save and retrieve transcripts directly on the device
  - Automatically adds timestamps and titles
  - Search and manage historical transcripts

- 🎨 **Modern SwiftUI Interface**
  - Clean, responsive, and intuitive user interface
  - Optimized for all screen sizes
  - Native support for Dark Mode

- 🧠 **MVVM Architecture**
  - Decoupled components for better maintainability
  - Scalable and testable code structure

- 🔍 **Transcript Management**
  - View, edit, delete, and rename transcripts
  - Keyword-based search functionality

---

## 🛠️ Tech Stack

| Component     | Usage                                 |
|---------------|----------------------------------------|
| **SwiftUI**   | UI development                         |
| **CoreData**  | Local persistent storage               |
| **MVVM**      | App architecture                       |
| **Speech**    | Real-time speech recognition           |
| **AVFoundation** | Audio recording and session handling |

---

## 📁 Project Structure

Transcriber/
├── Models/
│ └── Transcript.swift
├── ViewModels/
│ └── TranscriptionViewModel.swift
├── Views/
│ ├── TranscriptionView.swift
│ ├── TranscriptListView.swift
│ └── TranscriptDetailView.swift
├── Persistence/
│ └── CoreDataStack.swift
├── Utilities/
│ └── SpeechRecognizer.swift
└── Resources/
└── Assets.xcassets, Info.plist



---

## 🚀 Getting Started

### Prerequisites

- macOS with Xcode 13 or above
- iOS 15.0+ device (Speech framework may not work on simulators)
- Swift 5.5+

### Setup Instructions

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/transcriber-ios.git
   cd transcriber-ios
Open the Xcode project:

bash
Copy
Edit
open Transcriber.xcodeproj
Connect a real iOS device and run the app.

Ensure you allow microphone and speech recognition permissions when prompted.

🔐 Permissions Required
The app requires the following iOS permissions to function:

🎤 Microphone Access

🗣️ Speech Recognition Access

Make sure these are enabled in your device's Settings app.

📈 Planned Features
🌐 iCloud sync for transcripts across devices

📤 Export as PDF, TXT, or DOCX

🏷️ Smart tagging and summarization

🌍 Support for more languages and dialects

🤝 Contributing
Contributions are welcome! If you'd like to suggest improvements or fixes:

Fork the repo

Create a new branch (git checkout -b feature/YourFeature)

Commit your changes (git commit -am 'Add new feature')

Push to the branch (git push origin feature/YourFeature)

Create a Pull Request

