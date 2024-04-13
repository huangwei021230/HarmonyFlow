# OpenHarmony Input Method Application

## Overview

This input method application is developed on the OpenHarmony framework, providing text prediction functionality through the deployment of the opt-125m model directly on the device. By leveraging machine learning capabilities, the application offers predictive text suggestions to enhance user typing experience.

## Features

- **Text Prediction**: Utilizes the opt-125m model to predict and suggest words or phrases based on user input.
- **On-device Processing**: All text prediction computations are performed locally on the device, ensuring user privacy and minimizing network dependency.
- **Efficient Resource Utilization**: Optimized for resource-constrained environments, allowing seamless integration with various devices.

## Installation

1. **Clone Repository**: Clone the repository containing the source code for the input method application.

```bash
git clone https://github.com/huangwei021230/HarmonyFlow
```

2. **Build Application**: Build the application using the provided build scripts or IDE-specific instructions.



3. **Deploy to Device**: Deploy the compiled application binary to your target device running OpenHarmony.



## Usage

1. **Launch Application**: Open the input method application on your device.
2. **Enable Input Method**: Go to device settings and enable the OpenHarmony input method.
3. **Start Typing**: Begin typing in any text field where input is required. The application will provide predictive text suggestions as you type.
4. **Select Prediction**: Choose from the suggested words or phrases by tapping on them, or continue typing to dismiss the suggestions.

## Customization

The input method application can be customized according to specific requirements:

- **Model Tuning**: Fine-tune the opt-125m model to improve prediction accuracy for specific use cases or languages.
- **User Interface**: Modify the user interface elements, such as theme colors, font styles, or layout, to suit preferences or branding guidelines.
- **Integration**: Integrate additional features or external libraries to extend the functionality of the application.

## Contributing

Contributions to the input method application are welcome. If you encounter any issues, have feature requests, or would like to contribute enhancements, please feel free to submit pull requests or open issues on the GitHub repository.

## License

This project is licensed under the [MIT License](LICENSE).

## Acknowledgments

- This application utilizes the opt-125m model provided by [HuggingFace](https://huggingface.co/facebook/opt-125m/tree/main).
- Special thanks to the OpenHarmony community for their support and contributions.

## Contact

For inquiries or support, please contact [1138608506@qq.com](mailto:1138608506@qq.com).

```bash
hdc file send D:\download\traced_opt-125m.pt /data/app/el2/100/base/com.boogiepop.myapplication/haps/entry/files
hdc file send E:\codes\code-2023-2\ipads\HarmonyFlow\entry\src\main\resources\rawfile\merges.txt /data/app/el2/100/base/com.boogiepop.myapplication/haps/entry/files
hdc file send E:\codes\code-2023-2\ipads\HarmonyFlow\entry\src\main\resources\rawfile\vocab.json /data/app/el2/100/base/com.boogiepop.myapplication/haps/entry/files
hdc shell
cd /data/app/el2/100/base/com.boogiepop.myapplication/haps/entry/files
chown 20010049:20010049 traced_opt-125m.pt
chown 20010049:20010049 vocab.json
chown 20010049:20010049 merges.txt

```