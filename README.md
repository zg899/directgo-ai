# DirectGo.ai

An iOS app to upload itineraries, parse with AI, and connect directly with hotels.

## 🧠 Project Vision

Build a new AI-based travel experience that is fair, transparent, and direct — no more OTA middlemen.

**Slogan:** _Go Smarter. Go Direct._

## ✈️ Features

- Upload 1–10 itinerary photos
- AI parsing and editable results
- Submit for hotel review (48-hour feedback)
- Simulated pricing check and hotel verification
- Minimalist UI with friendly chat-based interface

## ✅ Progress

| Module                     | Status   | Notes                             |
|----------------------------|----------|-----------------------------------|
| Basic UI (chat-style)      | ✅ Done   | ChatGPT-style message history     |
| Multi-image upload         | ✅ Done   | Support up to 10 photos           |
| AI parsing (mocked)        | ✅ Done   | Simulated parsing with delay      |
| Editable results           | ⏳ Working | Add `TextEditor` to modify result |
| Submit & review logic      | ✅ Done   | Simulate 48h async response       |
| Design system              | ⏳ Working | Launch screen, app icon, colors  |

## 🛠️ Setup

- Xcode 16.2
- Target: iOS 18.2+
- Frameworks: SwiftUI, PhotosUI, UIKit
- Device: iPhone 16 Pro (iOS 18.3)

## 🗂️ Folder Structure (Coming Soon)

/DirectGo-ai
├── ContentView.swift
├── PhotoPicker.swift
└── LaunchScreen.storyboard


## 📆 Dev Log

- **2025-03-22**: Initial UI and photo upload done. Preparing for design module.
- **2025-03-23**: Added editable itinerary input + color scheme.

## 🤖 AI Co-Pilots

This project is reviewed by both **ChatGPT** and **Grok**. Suggestions from both AIs are integrated and compared before applying to production.

## 💡 Next Steps

- [ ] LaunchScreen view
- [ ] Editable ItineraryCard module
- [ ] AppIcon design
- [ ] Real AI parsing (Vision API or OCR)

---

## 🔗 License

MIT License © 2025 DirectGo.ai


## Development Log
- **2025-03-23**: Initial project setup, implemented basic UI with photo upload and simulated review (48-hour feedback).
