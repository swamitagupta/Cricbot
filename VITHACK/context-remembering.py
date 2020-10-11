
import json
import datetime
import time
import os
import dateutil.parser
import csv 




def allFilters(kwargs):
    kwargs=dict(kwargs)
    arr = ['id','season','city','date','team1','team2','toss_winner','toss_decision','result','dl_applied','winner','win_by_runs','win_by_wickets','player_of_match','venue','umpire1','umpire2','umpire3']
    sa = [-1]*len(arr)
    for i in range(len(arr)):
        if arr[i] in kwargs.keys():
            sa[i] = kwargs[arr[i]]
    
    with open('IPL_Matches_Gravitas_AI_Problem_Statement_Data - IPL_Matches_Gravitas_AI_Problem_Statement_Data.csv', newline='') as csvfile:
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
    
    return finallist
    

# x=allFilters(team1 =team1a, team2 =team2a , city=citynamea , city=citynamea)


def allFilterspaser(**kwargs):
    if 'team1' in kwargs.keys() and 'team2' in kwargs.keys():
        tempdict = kwargs.copy()
        a = kwargs['team1']
        b = kwargs['team2']
        tempdict['team1']=b
        tempdict['team2']=a
        return(allFilters(kwargs.items()) + allFilters(tempdict.items()))
    
    elif 'team1' in kwargs.keys():
        tempdict = kwargs.copy()
        a = kwargs['team1']
        tempdict['team2']=a
        tempdict['team1']='-1'
        print('in elif 1')
        return(allFilters(kwargs.items()) + allFilters(tempdict.items()))
    
    elif 'team2' in kwargs.keys():
        tempdict = kwargs.copy()
        a = kwargs['team2']
        tempdict['team1']=a
        tempdict['team2']='-1'
        print('in elif 2')
        return(allFilters(kwargs.items()) + allFilters(tempdict.items()))
    else:
        return(allFilters(kwargs.items()))




# --- Helpers that build all of the responses ---


def elicit_slot(session_attributes, intent_name, slots, slot_to_elicit, message):
    return {
        'sessionAttributes': session_attributes,
        'dialogAction': {
            'type': 'ElicitSlot',
            'intentName': intent_name,
            'slots': slots,
            'slotToElicit': slot_to_elicit,
            'message': message
        }
    }


def confirm_intent(session_attributes, intent_name, slots, message):
    return {
        'sessionAttributes': session_attributes,
        'dialogAction': {
            'type': 'ConfirmIntent',
            'intentName': intent_name,
            'slots': slots,
            'message': message
        }
    }


def close(session_attributes, fulfillment_state, message):
    response = {
        'sessionAttributes': session_attributes,
        'dialogAction': {
            'type': 'Close',
            'fulfillmentState': fulfillment_state,
            'message': message
        }
    }

    return response


def delegate(session_attributes, slots):
    return {
        'sessionAttributes': session_attributes,
        'dialogAction': {
            'type': 'Delegate',
            'slots': slots
        }
    }


# --- Helper Functions ---


def try_ex(func):
    """
    Call passed in function in try block. If KeyError is encountered return None.
    This function is intended to be used to safely access dictionary.

    Note that this function would have negative impact on performance.
    """

    try:
        return func()
    except KeyError:
        return None


def matchFinder(intent_request):
    """
    Performs dialog management and fulfillment for booking a hotel.

    Beyond fulfillment, the implementation for this intent demonstrates the following:
    1) Use of elicitSlot in slot validation and re-prompting
    2) Use of sessionAttributes to pass information that can be used to guide conversation
    """

    team1a = try_ex(lambda: intent_request['currentIntent']['slots']['TeamONEab'])
    team2a = try_ex(lambda: intent_request['currentIntent']['slots']['TeamTWOab'])
    seasona = safe_int(try_ex(lambda: intent_request['currentIntent']['slots']['Season']))
    datea = try_ex(lambda: intent_request['currentIntent']['slots']['Date'])
    citynamea = try_ex(lambda: intent_request['currentIntent']['slots']['CityName'])
    coh = try_ex(lambda: intent_request['currentIntent']['slots']['COH'])

    session_attributes = intent_request['sessionAttributes'] if intent_request['sessionAttributes'] is not None else {}

    reservation = json.dumps({
        'TeamONEab': team1a,
        'TeamTWOab': team2a,
        'Season': seasona,
        'Date': datea,
        'COH' : coh,
        'CityName': citynamea
    })

    session_attributes['currentMatch'] = reservation

    if intent_request['invocationSource'] == 'DialogCodeHook':
        # Validate any slots which have been specified.  If any are invalid, re-elicit for their value
        validation_result = validate_hotel(intent_request['currentIntent']['slots'])
        if not validation_result['isValid']:
            slots = intent_request['currentIntent']['slots']
            slots[validation_result['violatedSlot']] = None

            return elicit_slot(
                session_attributes,
                intent_request['currentIntent']['name'],
                slots,
                validation_result['violatedSlot'],
                validation_result['message']
            )

        # Otherwise, let native DM rules determine how to elicit for slots and prompt for confirmation.  Pass price
        # back in sessionAttributes once it can be calculated; otherwise clear any setting from sessionAttributes.
        if team1a and team2a and datea:
            x = allFilterspaser(team1 =team1a, team2 =team2a , date=datea)
        elif team1a and datea: 
            x = allFilterspaser(team1 =team1a, date=datea)
        elif team2a and datea: 
            x = allFilterspaser(team2 =team2a, date=datea)
        elif datea and citynamea: 
            x = allFilterspaser(city=citynamea , date=datea)
        else:
            x = allFilterspaser(team1 ="sunrisers Hyderabad", team2 ="sunrisers Hyderabad")


        if location and checkin_date and nights and room_type:
            # The price of the hotel has yet to be confirmed.
            price = generate_hotel_price(location, nights, room_type)
            session_attributes['matchValue'] = x[0][coh]
        else:
            try_ex(lambda: session_attributes.pop('matchValue'))

        session_attributes['currentMatch'] = reservation
        return delegate(session_attributes, intent_request['currentIntent']['slots'])

    try:
        x = session_attributes['matchValue']
    except:
        x = ""
    try_ex(lambda: session_attributes.pop('matchValue'))
    try_ex(lambda: session_attributes.pop('currentMatch'))
    session_attributes['lastConfirmedReservation'] = reservation

    return close(
        session_attributes,
        'Fulfilled',
        {
            'contentType': 'PlainText',
            'content': '{}'.format(x)
        }
    )

# --- Intents ---


def dispatch(intent_request):
    """
    Called when the user specifies an intent for this bot.
    """


    intent_name = intent_request['currentIntent']['name']

    # Dispatch to your bot's intent handlers
    if intent_name == 'To_Find_Match_ID':
        return matchFinder(intent_request)

    raise Exception('Intent with name ' + intent_name + ' not supported')


# --- Main handler ---


def lambda_handler(event, context):
    """
    Route the incoming request based on intent.
    The JSON body of the request is provided in the event slot.
    """

    return dispatch(event)
