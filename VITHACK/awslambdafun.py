"""
This sample demonstrates an implementation of the Lex Code Hook Interface
in order to serve a sample bot which manages reservations for hotel rooms and car rentals.
Bot, Intent, and Slot models which are compatible with this sample can be found in the Lex Console
as part of the 'BookTrip' template.

For instructions on how to set up and test this bot, as well as additional samples,
visit the Lex Getting Started documentation http://docs.aws.amazon.com/lex/latest/dg/getting-started.html.
"""

import json
import datetime
import csv

def allFilters(kwargs):
    kwargs=dict(kwargs)
    arr = ['id','season','city','date','team1','team2','toss_winner','toss_decision','result','dl_applied','winner','win_by_runs','win_by_wickets','player_of_match','venue','umpire1','umpire2','umpire3']
    sa = [-1]*len(arr)
    for i in range(len(arr)):
        if arr[i] in kwargs.keys():
            sa[i] = kwargs[arr[i]]
    
    with open('data.csv', newline='') as csvfile:
        reader = csv.DictReader(csvfile)
    
        # templist = []
        # for i in reader:
        #     templist.append(i)
        templist = list(reader)
    csvfile.close()
    check = [0]*len(templist)

    for i in range(len(arr)):
        if str(sa[i]) != '-1':
            for row in range(len(templist)):
                if str(templist[row][arr[i]]).lower() != str(sa[i]).lower() :
                    check[row] = 1

    finallist = []
    for i in range(len(templist)):
        if check[i] == 0:
            finallist.append(templist[i])
    
    # for i in finallist:
    #     print(i['id'])
    
    return (finallist)
    



def allFilterspaser(**kwargs):
    if 'team1' in kwargs.keys() and 'team2' in kwargs.keys():
        tempdict = kwargs.copy()
        a = kwargs['team1']
        b = kwargs['team2']
        tempdict['team1']=b
        tempdict['team2']=a
        return(str(allFilters(kwargs.items()) + allFilters(tempdict.items())))
    
    elif 'team1' in kwargs.keys():
        tempdict = kwargs.copy()
        a = kwargs['team1']
        tempdict['team2']=a
        tempdict['team1']='-1'
        print('in elif 1')
        return(str(allFilters(kwargs.items()) + allFilters(tempdict.items())))
    
    elif 'team2' in kwargs.keys():
        tempdict = kwargs.copy()
        a = kwargs['team2']
        tempdict['team1']=a
        tempdict['team2']='-1'
        print('in elif 2')
        return(str(allFilters(kwargs.items()) + allFilters(tempdict.items())))
    else:
        return(str(allFilters(kwargs.items())))

    
def lambda_handler(event, context):
    print('received request: ' + str(event))
    team1a = event['currentIntent']['slots']['TeamONE']
    team2a = event['currentIntent']['slots']['TeamTWO']
    cn = 0
    try :
        cityNamea = event['currentIntent']['slots']['CityName']
        if cityNamea is None:
            cn=1
    except:
        cn=1
        pass
    
    # if cityNamea is None:
    #     cn=1

    if seasona is None:
        sena=1
    

    if cn == 0 and sena == 0:
        retdict = allFilterspaser(team1 =team1a, team2 =team2a , city= cityNamea , season= seasona)
    elif cn == 0 :
        retdict = allFilterspaser(team1 =team1a, team2 =team2a , city= cityNamea )
    elif sena == 0 :
        retdict = allFilterspaser(team1 =team1a, team2 =team2a , season= seasona)
    else :
        retdict = allFilterspaser(team1 =team1a, team2 =team2a )
    

    
    response = {
        "sessionAttributes": 
            {
                "teamONE": team1a,
                "teamTWO": team2a
            },
        "recentIntentSummaryView": [
            {
                "intentName": "searchMatches",
                "checkpointLabel": "Label",
                # "slots": {
                    # "CityName": "pune"
                #     "teamTWO": team2
                        # },
        "confirmationStatus": "None",
        "dialogActionType": "ConfirmIntent",
        "fulfillmentState": "Fulfilled",
        # "slotToElicit": "Next slot to elicit"
    }
    ],
    "dialogAction": {
        "type": "Close",
        "fulfillmentState": "Fulfilled",
        "message": {
          "contentType": "PlainText",
          "content": "{}".format(retdict)
    }
    }

  }
    print('result = ' + str(response))
    return response
    
