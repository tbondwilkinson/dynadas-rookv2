This application sets up a webservice for using CAT to determine question ordering on a survey.

It is configured to run on heroku.com and scale using their web workers.  

## Current API:

### Next Question
This takes a cat object and returns the item with the lowest EVP.
It also returns the EVP for all items in case the user wants them.

All the parameters that are normally in a R cat object can be set here
#### URL
https://dynadas-rookv2.herokuapp.com/next_question
#### Method
`POST`
#### URL Params
None

#### Example request:
```json

{
   "guessing":[
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0
   ],
   "discrimination":{
      "NFC1":-1.745,
      "NFC40":-1.774,
      "NFC29":2.554,
      "NFC32":2.771,
      "NFC23":2.919,
      "NFC33":2.329,
      "NFC24":1.829,
      "NFC19":1.922,
      "NFC22":1.166,
      "NFC21":1.563,
      "NFC15":-0.337,
      "NFC10":1.959,
      "NFC39":-1.348,
      "NFC16":-0.308,
      "NFC4":-1.609,
      "NFC31":1.445,
      "NFC43":1.385,
      "NFC12":-0.696
   },
   "answers":[
      "NA",
      "NA",
      "NA",
      "NA",
      "NA",
      "NA",
      "NA",
      "NA",
      "NA",
      "NA",
      "NA",
      "NA",
      "NA",
      "NA",
      "NA",
      "NA",
      "NA",
      "NA"
   ],
   "priorName":"normal",
   "priorParams":[
      0,
      1
   ],
   "lowerBound":-4.5,
   "upperBound":4.5,
   "quadPoints":43,
   "D":1,
   "X":[
      -4.5,
      -4.28571428571429,
      -4.07142857142857,
      -3.85714285714286,
      -3.64285714285714,
      -3.42857142857143,
      -3.21428571428571,
      -3,
      -2.78571428571429,
      -2.57142857142857,
      -2.35714285714286,
      -2.14285714285714,
      -1.92857142857143,
      -1.71428571428571,
      -1.5,
      -1.28571428571429,
      -1.07142857142857,
      -0.857142857142857,
      -0.642857142857143,
      -0.428571428571429,
      -0.214285714285714,
      0,
      0.214285714285714,
      0.428571428571428,
      0.642857142857142,
      0.857142857142857,
      1.07142857142857,
      1.28571428571429,
      1.5,
      1.71428571428571,
      1.92857142857143,
      2.14285714285714,
      2.35714285714286,
      2.57142857142857,
      2.78571428571429,
      3,
      3.21428571428571,
      3.42857142857143,
      3.64285714285714,
      3.85714285714286,
      4.07142857142857,
      4.28571428571428,
      4.5
   ],
   "Theta.est":[

   ],
   "difficulty":{
      "NFC1":{
         "Extrmt1":0.752,
         "Extrmt2":-1.01,
         "Extrmt3":-1.959,
         "Extrmt4":-2.985
      },
      "NFC40":{
         "Extrmt1":1.706,
         "Extrmt2":0.297,
         "Extrmt3":-0.946,
         "Extrmt4":-2.533
      },
      "NFC29":{
         "Extrmt1":-2.371,
         "Extrmt2":-1.25,
         "Extrmt3":-0.517,
         "Extrmt4":1.013
      },
      "NFC32":{
         "Extrmt1":-2.159,
         "Extrmt2":-1.337,
         "Extrmt3":-0.569,
         "Extrmt4":0.82
      },
      "NFC23":{
         "Extrmt1":-2.002,
         "Extrmt2":-1.1,
         "Extrmt3":-0.431,
         "Extrmt4":1.07
      },
      "NFC33":{
         "Extrmt1":-2.312,
         "Extrmt2":-1.308,
         "Extrmt3":-0.588,
         "Extrmt4":1.002
      },
      "NFC24":{
         "Extrmt1":-2.234,
         "Extrmt2":-0.831,
         "Extrmt3":-0.002,
         "Extrmt4":1.676
      },
      "NFC19":{
         "Extrmt1":-2.415,
         "Extrmt2":-0.997,
         "Extrmt3":-0.39,
         "Extrmt4":1.229
      },
      "NFC22":{
         "Extrmt1":-3.022,
         "Extrmt2":-0.827,
         "Extrmt3":0.388,
         "Extrmt4":2.595
      },
      "NFC21":{
         "Extrmt1":-2.285,
         "Extrmt2":-0.601,
         "Extrmt3":0.306,
         "Extrmt4":1.993
      },
      "NFC15":{
         "Extrmt1":5.057,
         "Extrmt2":1.273,
         "Extrmt3":-1.232,
         "Extrmt4":-6.28
      },
      "NFC10":{
         "Extrmt1":-2.581,
         "Extrmt2":-1.492,
         "Extrmt3":-0.743,
         "Extrmt4":0.944
      },
      "NFC39":{
         "Extrmt1":2.192,
         "Extrmt2":0.39,
         "Extrmt3":-0.91,
         "Extrmt4":-2.704
      },
      "NFC16":{
         "Extrmt1":5.682,
         "Extrmt2":1.274,
         "Extrmt3":-1.505,
         "Extrmt4":-7.205
      },
      "NFC4":{
         "Extrmt1":1.168,
         "Extrmt2":-0.371,
         "Extrmt3":-1.372,
         "Extrmt4":-2.867
      },
      "NFC31":{
         "Extrmt1":-2.162,
         "Extrmt2":-0.718,
         "Extrmt3":0.174,
         "Extrmt4":2.117
      },
      "NFC43":{
         "Extrmt1":-2.989,
         "Extrmt2":-1.435,
         "Extrmt3":-0.586,
         "Extrmt4":1.498
      },
      "NFC12":{
         "Extrmt1":3.006,
         "Extrmt2":-0.442,
         "Extrmt3":-1.856,
         "Extrmt4":-4.907
      }
   },
   "poly":true,
   "integration":"trapezoid",
   "estimation":"EAP",
   "selection":"EPV",
   "coverage":0.9,
   "points":40
}
```
#### Response:
```json
{
  "next_item": 5,
  "epvs": [
    0.5629693465795451,
    0.5238134518329086,
    0.39197708840703016,
    0.35918581634833574,
    0.34371834209844576,
    0.42968859404758686,
    0.5131887923415044,
    0.499053368571471,
    0.7118729298376328,
    0.581221599257183,
    0.9652234287029428,
    0.5045852891649568,
    0.6483211716625897,
    0.9708166393896972,
    0.5732221068571528,
    0.6182754021577043,
    0.6505338737566538,
    0.8744107565544134
  ]
}
```

### Look Ahead
This returns the possible next items depending on what the user answers.

#### URL
https://dynadas-rookv2.herokuapp.com/look_ahead
#### Method
`POST`
#### URL Parameters
None
### Body parameters
- `this_item`: the current index of the question the user is about to answer
- `cat`: the cat object (as would be provided in `next_item`)

#### Example request
```json
{
   "this_item":1,
   "cat":{
      "guessing":[
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0,
         0
      ],
      "discrimination":{
         "NFC1":-1.745,
         "NFC40":-1.774,
         "NFC29":2.554,
         "NFC32":2.771,
         "NFC23":2.919,
         "NFC33":2.329,
         "NFC24":1.829,
         "NFC19":1.922,
         "NFC22":1.166,
         "NFC21":1.563,
         "NFC15":-0.337,
         "NFC10":1.959,
         "NFC39":-1.348,
         "NFC16":-0.308,
         "NFC4":-1.609,
         "NFC31":1.445,
         "NFC43":1.385,
         "NFC12":-0.696
      },
      "answers":[
         "NA",
         "NA",
         "NA",
         "NA",
         "NA",
         "NA",
         "NA",
         "NA",
         "NA",
         "NA",
         "NA",
         "NA",
         "NA",
         "NA",
         "NA",
         "NA",
         "NA",
         "NA"
      ],
      "priorName":"normal",
      "priorParams":[
         0,
         1
      ],
      "lowerBound":-4.5,
      "upperBound":4.5,
      "quadPoints":43,
      "D":1,
      "X":[
         -4.5,
         -4.28571428571429,
         -4.07142857142857,
         -3.85714285714286,
         -3.64285714285714,
         -3.42857142857143,
         -3.21428571428571,
         -3,
         -2.78571428571429,
         -2.57142857142857,
         -2.35714285714286,
         -2.14285714285714,
         -1.92857142857143,
         -1.71428571428571,
         -1.5,
         -1.28571428571429,
         -1.07142857142857,
         -0.857142857142857,
         -0.642857142857143,
         -0.428571428571429,
         -0.214285714285714,
         0,
         0.214285714285714,
         0.428571428571428,
         0.642857142857142,
         0.857142857142857,
         1.07142857142857,
         1.28571428571429,
         1.5,
         1.71428571428571,
         1.92857142857143,
         2.14285714285714,
         2.35714285714286,
         2.57142857142857,
         2.78571428571429,
         3,
         3.21428571428571,
         3.42857142857143,
         3.64285714285714,
         3.85714285714286,
         4.07142857142857,
         4.28571428571428,
         4.5
      ],
      "Theta.est":[

      ],
      "difficulty":{
         "NFC1":{
            "Extrmt1":0.752,
            "Extrmt2":-1.01,
            "Extrmt3":-1.959,
            "Extrmt4":-2.985
         },
         "NFC40":{
            "Extrmt1":1.706,
            "Extrmt2":0.297,
            "Extrmt3":-0.946,
            "Extrmt4":-2.533
         },
         "NFC29":{
            "Extrmt1":-2.371,
            "Extrmt2":-1.25,
            "Extrmt3":-0.517,
            "Extrmt4":1.013
         },
         "NFC32":{
            "Extrmt1":-2.159,
            "Extrmt2":-1.337,
            "Extrmt3":-0.569,
            "Extrmt4":0.82
         },
         "NFC23":{
            "Extrmt1":-2.002,
            "Extrmt2":-1.1,
            "Extrmt3":-0.431,
            "Extrmt4":1.07
         },
         "NFC33":{
            "Extrmt1":-2.312,
            "Extrmt2":-1.308,
            "Extrmt3":-0.588,
            "Extrmt4":1.002
         },
         "NFC24":{
            "Extrmt1":-2.234,
            "Extrmt2":-0.831,
            "Extrmt3":-0.002,
            "Extrmt4":1.676
         },
         "NFC19":{
            "Extrmt1":-2.415,
            "Extrmt2":-0.997,
            "Extrmt3":-0.39,
            "Extrmt4":1.229
         },
         "NFC22":{
            "Extrmt1":-3.022,
            "Extrmt2":-0.827,
            "Extrmt3":0.388,
            "Extrmt4":2.595
         },
         "NFC21":{
            "Extrmt1":-2.285,
            "Extrmt2":-0.601,
            "Extrmt3":0.306,
            "Extrmt4":1.993
         },
         "NFC15":{
            "Extrmt1":5.057,
            "Extrmt2":1.273,
            "Extrmt3":-1.232,
            "Extrmt4":-6.28
         },
         "NFC10":{
            "Extrmt1":-2.581,
            "Extrmt2":-1.492,
            "Extrmt3":-0.743,
            "Extrmt4":0.944
         },
         "NFC39":{
            "Extrmt1":2.192,
            "Extrmt2":0.39,
            "Extrmt3":-0.91,
            "Extrmt4":-2.704
         },
         "NFC16":{
            "Extrmt1":5.682,
            "Extrmt2":1.274,
            "Extrmt3":-1.505,
            "Extrmt4":-7.205
         },
         "NFC4":{
            "Extrmt1":1.168,
            "Extrmt2":-0.371,
            "Extrmt3":-1.372,
            "Extrmt4":-2.867
         },
         "NFC31":{
            "Extrmt1":-2.162,
            "Extrmt2":-0.718,
            "Extrmt3":0.174,
            "Extrmt4":2.117
         },
         "NFC43":{
            "Extrmt1":-2.989,
            "Extrmt2":-1.435,
            "Extrmt3":-0.586,
            "Extrmt4":1.498
         },
         "NFC12":{
            "Extrmt1":3.006,
            "Extrmt2":-0.442,
            "Extrmt3":-1.856,
            "Extrmt4":-4.907
         }
      },
      "poly":true,
      "integration":"trapezoid",
      "estimation":"EAP",
      "selection":"EPV",
      "coverage":0.9,
      "points":40
   }
}
```
#### Response:
```json
{
  "next_items": [
    5,
    5,
    5,
    5,
    5
  ]
}
```
