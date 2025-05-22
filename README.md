# AgriMatch 🌱

AgriMatch is a mobile application designed to make sustainable farming smarter and more efficient.  
Farmers can swipe through recommended plant pairings (companion planting), search for crops manually, and manage their accepted and rejected plants to optimize their planting strategy.

---

## 🚀 Features

- **Tinder-Style Swiping:** Swipe right to accept, swipe left to reject plant pairings based on smart recommendations.
- **Dynamic Search:** Instantly search and pick plants directly through a fast, clean search experience.
- **Smart Home Dashboard:** (Updates coming soon) View your accepted crops, success stats, and optimize your planting decisions.
- **Profile Management:** Manage your account and reset your preferences anytime.
- **Tips Page:** View curated tips based on selected plants and a daily tip.
- **Watering Page:** Track watering frequency and ensure you are not watering too much or too little.
- **Sustainable Focus:** Encourages sustainable and eco-friendly farming practices through optimized companion planting.

---

## 🛠 Tech Stack

- **SwiftUI** (Frontend)
- **Firebase Authentication** (User login/signup)
- **Firebase Firestore** (Store accepted and rejected plants)
- **Firebase Storage** (Plant images from URLs)
- **Swift Codable + AsyncImage** (Dynamic image loading and data handling)

---

## 👨‍💻 Team Members

- **Vibhun Naredla** — Team Captain, Lead Developer, UI/UX Designer & Architect
- **Aryan Mathur** — Gemini API Backend Integration, UI/UX Designer
- **Ronav Gopal** — Data Collection & Plant Dataset Curation
- **Aditya Shah** — Project Coordinator & QA
- **Samarth Chenumolu** — Slideshow & Presentability

---

## 📋 Setup Instructions

1. Clone the repository.
2. Open the project in **Xcode**.
3. Install Firebase and configure `GoogleService-Info.plist`.
4. Add the `PlantCardsData.json` file into the Xcode project.
5. Make sure your Firestore database is set up with rules allowing authenticated reads/writes.
6. Run the project on a simulator or real device.

---

## 📈 Future Improvements

- Add seasonal tips and AI-driven planting advice.
- Real-time weather integration for planting recommendations.
- Leaderboard of most popular companion pairings among users.
- Watering Schedule

---

## 🧠 Special Thanks
To Kaggle and the open datasets community for providing the initial crop and plant datasets that helped bring AgriMatch to life.

---

## 🤖 Plant Disease Detection (ML Integration Preview)

To expand AgriMatch's impact, we developed an **AI-powered plant disease detection feature**, designed to help farmers identify plant health issues simply by uploading a photo.

### Overview
This machine learning feature uses a **deep learning image classifier** trained to detect plant diseases based on visible leaf symptoms. The model is currently being tested and will soon be integrated directly into the AgriMatch mobile app.

### Model Architecture
- **Type:** Convolutional Neural Network (CNN)
- **Base Model:** EfficientNetB0
- **Framework:** TensorFlow/Keras
- **Input Shape:** 224×224 RGB images
- **Output:** 38 plant disease classes, including "Healthy"

### Training Details
- **Dataset:** PlantVillage (open-source via Kaggle)  
- **Training Size:** ~54,000 labeled leaf images  
- **Epochs Trained:** 25  
- **Batch Size:** 32  
- **Optimizer:** Adam  
- **Loss Function:** Categorical Crossentropy  
- **Accuracy Achieved:** ~98.3% validation accuracy  
- **Confusion Matrix:** Shows strong class separation, especially for high-prevalence diseases like Early Blight and Leaf Mold.

### Model Output
- For each image input, the model outputs the **most likely disease class** (e.g., *Tomato___Leaf_Mold* or *Grape___Esca*).
- It can distinguish between **multiple diseases on similar crops**, and includes **"Healthy"** as a baseline category.

### Integration Plan
- The `.h5` model is currently being converted to **Core ML format (.mlmodel)** for seamless integration into iOS.
- Users will be able to:
  - Upload or capture a leaf image
  - Instantly receive a diagnosis
  - View treatment suggestions (future update)

### Limitations
- Trained on ideal dataset images — current goal is to improve generalization on real-world photos.
- Fine-tuning with live farm images and implementing real-time image quality checks are planned.

### Contribution Note
This model was trained using publicly available tools and datasets. The dataset used is the **PlantVillage dataset**, made available via [Kaggle](https://www.kaggle.com/datasets/emmarex/plantdisease).  
We thank the open-source ML community and researchers who have contributed foundational resources for agricultural AI.

---

## 🔐 Gemini API Integration via Cloudflare Worker

To support dynamic and secure generation of plant care tips, AgriMatch integrates the **Gemini API** through a custom-built **Cloudflare Worker**.

### Implementation Highlights
1. **Cloudflare Worker Setup:** A lightweight, serverless function was created to securely handle AI-generated content requests.
2. **API Key Management:** The Gemini API key is stored as a secret variable using `.env` configuration to prevent exposure in the frontend code.
3. **Rate Limiting:** The worker includes IP-based rate limiting to prevent abuse or excessive requests from a single user.
4. **Secure POST Requests:** Prompts are sent via a JSON-formatted POST request to ensure clean, structured data handling.
5. **Gemini API Integration:** The prompt is entered into Gemini's API, which returns curated tips relevant to user-selected crops.
6. **Error Handling:** The worker includes robust error logging and response messages in case of API issues or malformed requests.

This architecture ensures **speed**, **security**, and **scalability** while delivering personalized agricultural insights in real time.

---

AgriMatch — Helping farmers grow smarter, sustainably.
