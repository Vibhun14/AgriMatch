---

## 🤖 AI-Powered Plant Disease Detection (Beta)

AgriMatch now includes an experimental **plant disease detection feature** powered by **deep learning**.

### 🧠 How It Works
- The feature uses a **Convolutional Neural Network (CNN)** based on the **EfficientNetB0** architecture.
- The model was trained on the **PlantVillage dataset**, which contains over **54,000 labeled images** of healthy and diseased leaves across 38 plant disease classes.
- Once trained, the model was tested using Python to verify its accuracy and effectiveness on real-world examples.
- It is currently being prepared for integration into the iOS app using Apple’s **CoreML** framework.

### 🧪 Model Details
- **Architecture:** EfficientNetB0 (lightweight, mobile-ready CNN)
- **Input Size:** 224x224 pixels (RGB)
- **Output:** 38 classes (e.g., Apple Scab, Tomato Mosaic Virus, Healthy, etc.)
- **Format:** Trained Keras model (`model.h5`)
- **Accuracy:** ~98% validation accuracy on test data

### 📂 Files
- `model.h5`: Pretrained TensorFlow/Keras model file (available in the repo)
- `predict_plant_disease.py`: Python script to test the model on leaf images
- `class_labels.json`: List of class names (optional, included for mapping)

### 🧠 Why Use a Pretrained Model?
To prioritize testing, UI development, and real-world demo readiness, a pretrained public model was used and validated in our pipeline. This allowed our team to:
- Focus on the integration and user experience
- Ensure the system worked reliably under testing conditions
- Prepare for full CoreML conversion and iOS deployment

> The model is fully functional, and the integration process into the AgriMatch iOS app is actively underway.

---

🧠 **Special Thanks:** The PlantVillage dataset and the open-source ML community were crucial in helping us accelerate model development and real-world testing.

