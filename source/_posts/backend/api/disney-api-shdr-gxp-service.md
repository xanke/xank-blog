---
title: 迪士尼（Disney）Api 结构分析 - 快速通行证服务
date: 2018-05-21
categories: [后端, Api]
tags: [Api, Disney, 迪士尼]
---

迪士尼 API 结构解析 - 快速通行证服务

SHDR gxp service

<!--more-->

## 查询游玩组

/shdr-gxp-service/services/orchestration/guest/**:guestId**/party

### 请求参数：

| 参数    | 说明    |
| ------- | ------- |
| guestId | 用户 ID |

```json
{
	"partyMembers": [{
		"name": "ALITRIP ALITRIP",
		"gxpEligible": true,
		"managed": true,
		"annualPass": true,
		"id": "24205xxxxxx",
		"ticketType": "PASS",
		"maxPass": true
	}, {
		"gxpEligible": true,
		"managed": true,
		"annualPass": true,
		"id": "81223xxxxxx",
		"ticketType": "PASS",
		"maxPass": true
	}],
	"conflicts": [{
		"guestXid": "242xxxxxxxxxx",
		"message": "NOT_ENTERED_PARK"
	}, {
		"guestXid": "812xxxxxxxxxx",
		"message": "NOT_ENTERED_PARK"
	}]
}

partyMembers 是游玩组列表，conflicts 是错误信息，如不在乐园，则返回 NOT_ENTERED_PARK

## 查询项目可用快速通行证

/shdr-gxp-service/services/orchestration/park/shdr/2018-03-16/offers;guest-xids=**guest-xids**?includeAssets=false

| 参数       | 说明      |
| ---------- | --------- |
| guest-xids | 游玩组 ID |

### 成功返回

{
  "requestId": "7831887",
  "experienceGroups": [
    {
      "experiences": [
        {
          "status": "AVAILABLE",
          "type": "Attraction",
          "id": "attBuzzLightyearPlanetRescue",
          "offers": [
            {
              "startDateTime": "2018-03-16T19:15:00.000",
              "endDateTime": "2018-03-16T20:00:00.000",
              "facilityId": "attBuzzLightyearPlanetRescue",
              "locationId": "attBuzzLightyearPlanetRescue",
              "id": "32279814",
              "isLocked": false,
              "facilityType": "Attraction",
              "locationType": "Attraction"
            }
          ]
        },
        {
          "status": "AVAILABLE",
          "type": "Attraction",
          "id": "attRoaringRapids",
          "offers": [
            {
              "startDateTime": "2018-03-16T19:25:00.000",
              "endDateTime": "2018-03-16T20:00:00.000",
              "facilityId": "attRoaringRapids",
              "locationId": "attRoaringRapids",
              "id": "32279815",
              "isLocked": false,
              "facilityType": "Attraction",
              "locationType": "Attraction"
            }
          ]
        }
      ],
      "id": "1"
    }
  ],
  "unavailableExperiences": [
    {
      "status": "STANDBY",
      "type": "Attraction",
      "id": "attPeterPansFlight",
      "offers": []
    },
    {
      "status": "STANDBY",
      "type": "Attraction",
      "id": "attSevenDwarfsMineTrain",
      "offers": []
    },
    {
      "status": "STANDBY",
      "type": "Attraction",
      "id": "attSoaringOverHorizon",
      "offers": []
    },
    {
      "status": "STANDBY",
      "type": "Attraction",
      "id": "attTronLightcyclePowerRun",
      "offers": []
    },
    {
      "status": "STANDBY",
      "type": "Attraction",
      "id": "attAdventuresWinniePooh",
      "offers": []
    }
  ]
}

```

experienceGroups 是可领取快速通行证的项目，unavailableExperiences 是快速通行证已领完的项目

## 进取领取页面

/shdr-gxp-service/services/orchestration/inventory/**id**

### 请求参数：

| 参数    | 说明    |
| ------- | ------- |
| id | 游乐项目 ID |

```json
{
  "hasOfferChanged": false,
  "offer": {
    "startDateTime": "2018-03-16T19:15:00.000",
    "endDateTime": "2018-03-16T20:00:00.000",
    "facilityId": "attBuzzLightyearPlanetRescue",
    "locationId": "attBuzzLightyearPlanetRescue",
    "id": "32279814",
    "isLocked": true,
    "facilityType": "Attraction",
    "locationType": "Attraction"
  }
}
```

这里返回的快速通行证使用时间详情

## 领取快速通行证

/shdr-gxp-service/services/orchestration/offer/**id**

### 请求参数：

| 参数    | 说明    |
| ------- | ------- |
| id | 游乐项目 ID |


### 成功返回

```json
{
  "entitlements": [
    {
      "startDateTime": "2018-03-16T11:15:00Z",
      "endDateTime": "2018-03-16T12:00:00Z",
      "operationalDate": "2018-03-16",
      "facilityType": "Attraction",
      "locationId": "attBuzzLightyearPlanetRescue",
      "locationType": "Attraction",
      "parkId": "shdr",
      "partyGuests": [
        {
          "guestId": "1121014008050150044",
          "entitlementId": "7261190",
          "status": "BOOKED",
          "canModify": true,
          "canCancel": false,
          "canRedeem": true
        }
      ],
      "facility": "attBuzzLightyearPlanetRescue",
      "isBonus": false
    }
  ],
  "remainingSelections": [
    {
      "guestId": "1121014008050150044",
      "selectionsByGroup": [
        {
          "groupId": "1",
          "remaining": 0
        },
        {
          "groupId": "2",
          "remaining": 0
        },
        {
          "groupId": "3",
          "remaining": 0
        },
        {
          "groupId": "4",
          "remaining": 0
        }
      ]
    }
  ],
  "eligibleSelectionTime": {
    "partySelectionDateTime": "2018-03-16T19:45:13.422+08:00",
    "individualSelectionTimeDetails": [
      {
        "guestId": "1121014008050150044",
        "selectionDateTime": "2018-03-16T19:45:13.422+08:00"
      }
    ]
  }
}
```

---

以上即是 SHDR gxp service API 的所有接口