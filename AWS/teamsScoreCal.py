import csv

scores = {
"mumbai indians" : 57.51,
"chennai super kings" : 59.65,
"kolkata knight riders" : 51.08,
"royal challengers bangalore" : 45.45,
"kings xi punjab" : 44.51,
"delhi capitals" : 43.48,
"rajasthan royals" : 48.39,
"sunrisers hyderabad" : 52.63,
"deccan chargers" : 38.16,
"deccan daredevils" : 40.00,
"rising pune supergiant" : 50.00,
"gujarat lions" : 43.33, 
"pune warriors" : 26.09,
"kochi tuskers kerala" : 42.86
}

def lambda_handler(event, context):
    print('received request: ' + str(event))
    team1a = event['currentIntent']['slots']['TeamONE']
    team2a = event['currentIntent']['slots']['TeamTWO']


    
    response = {
        "sessionAttributes": 
            {
                "teamONE": team1a,
                "teamTWO": team2a
            },
        "recentIntentSummaryView": 
        [
            {
                "intentName": "searchMatches",
                "checkpointLabel": "Label",
                "confirmationStatus": "None",
                "dialogActionType": "ConfirmIntent",
                "fulfillmentState": "Fulfilled",
                # "slotToElicit": "Next slot to elicit"
            }
        ],
        "dialogAction": 
        {
            "type": "Close",
            "fulfillmentState": "Fulfilled",
            "message": {
                "contentType": "PlainText",
                "content": "{}".format(int(scores[team1a.lower()])/(int(scores[team2a.lower()])+int(scores[team1a.lower()])))
                }
        }

    }
    
    # the winning chances of team 1 wtr to team 2 
    
    print('result = ' + str(response))
    return response
