

# Cricbot: An IPL Chatbot

<p>
<img alt="iOS" src="https://img.shields.io/badge/platform-iOS-blue">
<img alt="Swift" src="https://img.shields.io/badge/Swift-5.2-brightgreen">
<img alt="XCode" src="https://img.shields.io/badge/XCode-11.5-blueviolet">
<img alt="iOS" src="https://img.shields.io/badge/iOS-13.5-orange">
</p>


A multi-turn conversation enabled IPL stats chatbot on AWS Lex.
The bot generates a response based on multiple previous utterances, called a dialogue context, as well as user’s queries to respond in a relevant and sensible manner. The bot can perform
long-form of FAQ and button driven conversation and maintain context. Turnaround time for a chatbot is less than 1 second.

FIGMA FILE-
https://www.figma.com/file/crOQNYxdwcGBX8GnvqSDaG/vithack-official?node-id=38%3A2

Main features and USPs:


 1. Amazing data retrieval algorithms were used so that even if we add extra columns and rows to the data or entirely change the data the algorithm will still be able to filter out results and return then in an exact manner required  

2. Amazing UI and very user-friendly UX helping users do what they want faster

3. We also have a huge compilation of a lot of other features which you can view in the demo

 

# Requirements

- iOS 13

## Steps to Run
* Clone or download the the repository. 
* Open project file in terminal.
* Run `pod install`.
* Open `chatbot.xworkspace`.
* Change the bundle identifier.
* Press `Ctrl + R` to run the app.

```
In the didFinishLaunchingWithOptions function:

replace the XXXXXs with your own id

```
## Sources

[IoS Integration](https://medium.com/libertyit/how-to-build-an-aws-lex-chatbot-for-an-ios-app-9fd7693353b)
[AWS Lex Documentation](https://docs.aws.amazon.com/lex/latest/dg/getting-started.html)
[AWS Lambda Documentation](https://docs.aws.amazon.com/lambda/latest/dg/python-handler.html)


### The flow

![Screenshot](/images/flowchart.png)

### Amazon sercices
![Screenshot](/images/lambda-logo.png)

![Screenshot](/images/lex-logo.png)

### Amazon Lex Console 

![Screenshot](/images/snap1.jpg)

![Screenshot](/images/snap2.jpg)

![Screenshot](/images/snap3.jpg)
