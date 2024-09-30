https://we.tl/t-eFSlDL8PJ4
## HealthRing


HealthRing is a digital health companion app designed to work alongside the **Smart Guru Health Ring**. It offers real-time monitoring of your vital health metrics, including heart rate, blood oxygen, blood pressure, and cholesterol, as well as personalized health insights and alerts.

---

## Features

- **Health Monitoring**: Continuous or on-demand measurement of heart rate, blood oxygen (SpO2), blood pressure (systolic/diastolic), and cholesterol.
- **Battery Management**: Real-time battery monitoring of the Smart Guru Health Ring.
- **Health Data Visualization**: Historical health data tracking with filters for day, week, month, and year views.
- **Notifications & Reminders**: Customizable reminders for healthy habits such as staying hydrated, being active, and more.
- **Do Not Disturb Mode**: Silence notifications during specific times with a configurable Do Not Disturb feature.

---

## Screenshots

| Dashboard | Heart Monitoring | Blood Data History |
|-----------|------------------|--------------------|
| ![Dashboard](https://drive.google.com/file/d/1QhsFefzJYR9DVCYrZJ2Tsy8TJ4fsdDBO/view?usp=sharing) | ![Heart Monitoring](path/to/heart.png) | ![Blood History](path/to/blood.png) |

---

## Installation

### Prerequisites 
- Flutter SDK >= 3.0.0 
- Android Studio or Xcode (for iOS development)

### Hardware requirements

- Android 8.0+ or iOS 12.0+
- Bluetooth Low Energy (BLE) supported mobile device
- Smart Guru Health Ring

### Steps

1. Clone this repository:
   ```bash
   git clone https://github.com/ancerox/ringApp.git` 

2.  Navigate to the project directory:
    
    
    `cd ringApp` 
    
3.  Install dependencies:
    
  
    
    `flutter pub get` 
    
4.  Run the app:
    
    `flutter run`

## Project Structure
- `lib/`: Contains the main application code.
  - `core/`: The `core/` directory contains the foundational components that are shared across the entire application. 
  
  - `features/`

      - `heart/presentation/screen`: This directory holds the UI-related components for the **Heart Monitoring** feature. The screens in this folder are responsible for displaying heart rate, heart variability, and rhythm data to the user.
      - `home/presentation/screen`: The `home/` folder contains the main dashboard and home screen of the app. This is where the user can get a general overview of their health metrics and access different sections of the app.
      - `onboarding/presentation/screen`: This folder holds the screens for the **Onboarding** process. It guides the user through initial setup, such as pairing the Smart Guru Health Ring, setting up health goals, and adjusting notification settings.
      - `ring/presentation/screen`: This directory contains the UI screens for managing the **Smart Guru Health Ring**. Users can view battery status, manage connection settings, and update the ring's firmware if needed.
      - `notifications/presentation/screen`: This directory holds the UI screens for **Notifications and Alerts** management. Here, users can configure reminders (e.g., drink water, stay active) and adjust the Do Not Disturb mode.

## Software Requirements Specification (SRS) 
For more detailed information about the HealthRing app’s requirements, please refer to the [Software Requirements Specification (SRS)](https://docs.google.com/document/d/1raUHGrB76yf1lv-RoS3qt3Gi3-C5P5F_9_lXXh5rKFM/edit?usp=sharing).

This Software Requirements Specification (SRS) provides a comprehensive description of the HealthRing app, which is designed to be paired with the Smart Guru Health Ring. 

The document outlines the app’s functional and non-functional requirements, key features and user interactions. It serves as a blueprint for the development, testing, and deployment of the HealthRing app, ensuring that the app meets the needs of users focused on health and fitness monitoring. 
  
## Contact
- Email: winstonf@outlook.es
- GitHub: [ancerox](https://github.com/ancerox)
