---
title: 迪士尼（Disney）Api 结构分析 - 门票验证服务
date: 2018-05-21
categories: [后端, Api]
tags: [Api, Disney, 迪士尼]
---

迪士尼 API 结构解析 - 资源服务

Entitlement view assembly service

<!--more-->

### 门票验证

### URL 格式

/entitlement-view-assembly-service/entitlements/**:ticketid**

### 请求参数：

| 参数     | 说明    |
| -------- | ------- |
| ticketid | 门票 ID |

### 成功返回

```json
{
  "entitlement": {
    "visualId": "1121xxxxxxxxxxx",
    "name": "Standard, Anyday Season Pass",
    "governmentIdLinked": false,
    "sku": "SHTPSPOLRNRP18SR",
    "productInstanceId":
      "shdrAnydaySeasonalAnnualPass_X_A_0_0_RF_AF_SOF_shdr_nonsellable_SHTPSPOLRNRP18SR",
    "status": "ACTIVE",
    "exchangeStatus": "NOT_ELIGIBLE",
    "owner": {
      "profileId": "DEFAULT",
      "ownerType": "B2C"
    },
    "shared": false,
    "assignedGuest": {
      "firstName": "ALITRIP",
      "lastName": "ALITRIP"
    },
    "productTypeId": "shdrAnydaySeasonalAnnualPass",
    "category": {
      "id": "AnnualPass",
      "name": "Annual Passes"
    },
    "lineage": [
      {
        "visualId": "1121xxxxxxxxxxx",
        "remainingUse": 0,
        "status": "TICKET_ACTIVE",
        "dateSold": "2018-03-11T16:36:00.000-07:00",
        "expirationDate": "2018-07-31T07:59:59.000-07:00"
      },
      {
        "visualId": "41394055xxxxxxx",
        "remainingUse": 0,
        "status": "TICKET_REPRINTED",
        "dateSold": "2018-03-11T16:36:00.000-07:00"
      }
    ],
    "usage": [
      {
        "acp": "8",
        "acpName": "Turnstile",
        "status": "Admission",
        "useNo": 1,
        "useTime": "2018-03-15T23:13:57.000-07:00"
      }
    ],
    "voidable": false,
    "guestAgeGroup": "ADULT",
    "remainingUse": 0,
    "useCount": 0,
    "primaryGuestLinked": false,
    "renewable": false,
    "skipRenewal": false,
    "parkHopper": true,
    "sourceLexvas": true,
    "packageEntitlement": false,
    "startDateTime": "2018-03-11T16:36:00.000-07:00",
    "endDateTime": "2018-07-31T07:59:59.000-07:00"
  },
  "productInstance": {
    "id":
      "shdrAnydaySeasonalAnnualPass_X_A_0_0_RF_AF_SOF_shdr_nonsellable_SHTPSPOLRNRP18SR",
    "links": {
      "self": {
        "href":
          "http://service-internal-hkdl-cn-prod.wdpro.starwave.com/global-pool-override-B/lexicon-view-assembler-service/product-instances/shdrAnydaySeasonalAnnualPass_X_A_0_0_RF_AF_SOF_shdr_nonsellable_SHTPSPOLRNRP18SR?view=web"
      }
    },
    "destinationId": "SHDR",
    "name": "畅游季卡无限卡 - 标准票",
    "names": {
      "wdproMobileName": {
        "text": "畅游季卡无限卡 - 标准票",
        "html": "畅游季卡无限卡 - 标准票"
      },
      "standardName": {
        "text": "畅游季卡无限卡 - 标准票",
        "html": "畅游季卡无限卡 - 标准票"
      },
      "Customer Managed Relationship Usage": {
        "text": "畅游季卡无限卡 - 标准票",
        "html": "畅游季卡无限卡 - 标准票"
      }
    },
    "type": "productInstance",
    "productTypeId": "shdrAnydaySeasonalAnnualPass",
    "productTypeName": "MDX - Anyday Seasonal AnnualPass",
    "category": {
      "id": "AnnualPass",
      "name": "Annual Passes"
    },
    "discountGroups": [
      {
        "links": {
          "self": {
            "href":
              "http://service-internal-hkdl-cn-prod.wdpro.starwave.com/global-pool-override-B/lexicon-view-assembler-service/discount-groups/STD_GST"
          }
        },
        "affiliations": [
          {
            "links": {
              "self": {
                "href":
                  "http://service-internal-hkdl-cn-prod.wdpro.starwave.com/global-pool-override-B/lexicon-view-assembler-service/affiliations/STD_GST"
              }
            },
            "id": "STD_GST",
            "name": "All Guests"
          }
        ],
        "name": "All Guests",
        "id": "STD_GST"
      }
    ],
    "renewal": false,
    "specialOffer": false,
    "advance": false,
    "demographicsRequired": false,
    "alternateIdentifiers": {
      "analytics": [
        {
          "value": "SHTPSPOLRNRP18SR"
        }
      ]
    },
    "options": [
      {
        "optionType": "addOns",
        "optionValue": []
      },
      {
        "optionType": "numDays",
        "optionValue": ["138"]
      },
      {
        "optionType": "ageGroup",
        "optionValue": ["adult"]
      }
    ],
    "blockoutDates": [
      "2017-10-02T00:00:00+08:00",
      "2017-10-03T00:00:00+08:00",
      "2017-10-04T00:00:00+08:00",
      "2017-10-05T00:00:00+08:00",
      "2018-01-26T00:00:00+08:00"
    ],
    "monthlyPaymentEligible": false
  }
}
```

entitlement 包含改门票的信息，productInstance 中包含了该门票的详细介绍，此 API 将门票信息和该门票介绍合并在了一起。可减少一次请求。

### 失败返回

```json
{
  "reasonPhrase": "Not Found",
  "family": "CLIENT_ERROR",
  "statusCode": 404
}
```

## 查询绑定的门票

/entitlements/v2/B2C/**:guestId**/tickets?storeId=shdr_mobile&destination=SHDR&includeRenewalInformation=false&contextId=shdr_mobile&hideBarcode=true

### 请求参数：

| 参数    | 说明    |
| ------- | ------- |
| guestId | 用户 ID |

### 成功返回

```json

{
	"guestId": "{xxxxx-xxxxx-xxxxx}",
	"entitlements": [{
		"visualId": "123321xxxxxxx",
		"governmentIdLinked": false,
		"sku": "SHTPSPOLRNRPQ4R",
		"productInstanceId": "shdrAnydaySeasonalAnnualPass_X_A_0_0_RF_AF_SOF_shdr_nonsellable_SHTPSPOLRNRPQ4R",
		"status": "EXPIRED",
		"exchangeStatus": "NOT_ELIGIBLE",
		"owner": {
			"profileId": "DEFAULT",
			"ownerType": "B2C"
		},
		"primaryGuest": "{xxxxx-xxxxx-xxxxx}",
		"shared": false,
		"assignedGuest": {
			"firstName": "ALITRIP",
			"lastName": "ALITRIP"
		},
		"productTypeId": "shdrAnydaySeasonalAnnualPass",
		"category": {
			"id": "AnnualPass",
			"name": "Annual Passes"
		},
		"lineage": [{
			"visualId": "123321xxxxxxx",
			"remainingUse": 0,
			"status": "TICKET_ACTIVE",
			"dateSold": "2017-09-03T10:07:00.000-07:00",
			"expirationDate": "2018-01-24T08:00:00.000-08:00"
		}, {
			"visualId": "32432423xxxxxx",
			"remainingUse": 0,
			"status": "TICKET_REPRINTED",
			"dateSold": "2017-09-03T10:07:00.000-07:00"
		}],
		"validEndDate": "2018-01-25T23:59:59+08:00",
		"validStartDate": "2017-09-03T00:00:00+08:00",
		"renewable": false,
		"skipRenewal": false,
		"sellable": true,
		"primaryGuestLinked": true,
		"transferable": false,
		"parkHopper": true,
		"packageEntitlement": false
	}],
	"total": 1,
	"productInstances": {
		"shdrAnydaySeasonalAnnualPass_X_A_0_0_RF_AF_SOF_shdr_nonsellable_SHTPSPOLRNRPQ4R": {
			"id": "shdrAnydaySeasonalAnnualPass_X_A_0_0_RF_AF_SOF_shdr_nonsellable_SHTPSPOLRNRPQ4R",
			"links": {
				"self": {
					"href": "http://service-internal-hkdl-cn-prod.wdpro.starwave.com/global-pool-override-B/lexicon-view-assembler-service/product-instances/shdrAnydaySeasonalAnnualPass_X_A_0_0_RF_AF_SOF_shdr_nonsellable_SHTPSPOLRNRPQ4R?view=web"
				}
			},
			"destinationId": "SHDR",
			"name": "畅游季卡无限卡 - 标准票",
			"names": {
				"wdproMobileName": {
					"text": "畅游季卡无限卡 - 标准票",
					"html": "畅游季卡无限卡 - 标准票"
				},
				"standardName": {
					"text": "畅游季卡无限卡 - 标准票",
					"html": "畅游季卡无限卡 - 标准票"
				},
				"Customer Managed Relationship Usage": {
					"text": "畅游季卡无限卡 - 标准票",
					"html": "畅游季卡无限卡 - 标准票"
				}
			},
			"type": "productInstance",
			"productTypeId": "shdrAnydaySeasonalAnnualPass",
			"productTypeName": "MDX - Anyday Seasonal AnnualPass",
			"category": {
				"id": "AnnualPass",
				"name": "Annual Passes"
			},
			"discountGroups": [{
				"links": {
					"self": {
						"href": "http://service-internal-hkdl-cn-prod.wdpro.starwave.com/global-pool-override-B/lexicon-view-assembler-service/discount-groups/STD_GST"
					}
				},
				"affiliations": [{
					"links": {
						"self": {
							"href": "http://service-internal-hkdl-cn-prod.wdpro.starwave.com/global-pool-override-B/lexicon-view-assembler-service/affiliations/STD_GST"
						}
					},
					"id": "STD_GST",
					"name": "All Guests"
				}],
				"name": "All Guests",
				"id": "STD_GST"
			}],
			"renewal": false,
			"specialOffer": false,
			"advance": false,
			"policies": [{
				"id": "fall-seasonal-pass",
				"name": "Fall Winter Seasonal Pass Terms and Conditions",
				"descriptions": {
					"description": {
						"id": 1037,
						"key": "description",
						"text": "<span><b>上海迪士尼乐园秋冬畅游季卡须知</b></span><br/><br/><ul><li>本秋冬畅游季卡之发出及使用受本须知，以及公布于上海迪士尼乐园（“乐园”）官网<a href=https://www.shanghaidisneyresort.com/>www.shanghaidisneyresort.com</a>（“乐园官网”）和乐园入口处的《上海迪士尼乐园游客须知》的约束。秋冬畅游季卡持有者须遵守本须知及《上海迪士尼乐园游客须知》。</li><li>秋冬畅游季卡不可转让、更换及退款，除非法律另有规定。</li><li>秋冬畅游季卡仅限持卡人本人（即姓名印于该卡上的人）使用，如出现下述情况，我们有权随时撤销该卡而毋须退款或赔偿：（A）该卡被非持卡人本人用于入园或换取其它利益；（B）该卡和/或其项下的权利被用做商业用途或被出于其他目的非正当使用；（C）游客有任何危险，非法或攻击性行为; 或（D）游客有违反《上海迪士尼乐园游客须知》以至可能妨碍乐园运营的其他行为。</li><li>每一位游客名下只限持有一张与其名字绑定的秋冬畅游季卡。如果一位游客拥有多张与其名字绑定的秋冬畅游季卡，除第一张秋冬畅游季卡外，其余季卡将无法使用。</li><li>本秋冬畅游季卡有效期至<b>2018年1月25日</b>。</li><li>畅游季卡提供以下三种类别（均在限定日期不可使用，具体限定日期以【秋冬畅游季卡票务日历】所示为准）：<ul><li>秋冬季畅游季卡 — 无限卡（2017年10月2日至10月7日期间及12月31日不可使用）</li><li>秋冬畅游季卡 — 平日卡（2017年10月2日至10月7日期间及12月31日不可使用）</li><li>秋冬畅游季卡 — 周日卡（12月31日不可使用）</li></ul>具体适用日期以上海迪士尼度假区官方网站【秋冬畅游季卡票务日历】为准。<br /></li><li>在限定日期，无法使用秋冬畅游季卡入园。具体限定日期在发放本卡时所提供的文件中有说明亦可于度假区官网查询，可能会发生变动。当乐园达到承载量的限额时，我们将无法保证持卡游客入园。</li><li>秋冬畅游季卡使用者本人须前往乐园主入口售票亭出示个人身份证件原件（即身份证、护照、旅行证件）和购卡订单号以激活秋冬畅游季卡。中国大陆居民仅可使用身份证作为个人身份证件激活秋冬畅游季卡。临时身份证、身份证遗失证明、护照、驾驶执照均无法办理激活秋冬畅游季卡。</li><li>我们将采集游客照片和身份信息作为秋冬畅游季卡持有者的凭证，并与该秋冬畅游季卡绑定，秋冬畅游季卡持有者的姓名和照片不可更改。</li><li>所有季卡持卡游客每次入园都须按正常程序从乐园主入口入园，并请遵从演职人员的指引。</li><li>游客使用秋冬畅游季卡入园时，必须出示用于激活秋冬畅游季卡时所使用的个人身份证件原件来核实身份，确保秋冬畅游季卡是由持卡人本人使用。</li><li>秋冬畅游季卡在乐园开放时间段提供入园权限（具体运营时间将于度假区官网或上海迪士尼度假区视其方便的其他资讯上公布）。</li><li>此秋冬畅游季卡不适用于另行收费的特别活动及华特迪士尼大剧院入场，无免费停车特权。</li><li>若需申请补办丢失的秋冬畅游季卡，季卡持有人须务必（i）亲自前往位于乐园外的游客服务中心现场填写并提交季卡补办申请；（ii）提供原持卡人的个人身份信息，如个人身份证件原件（身份证、护照、旅行证件）及原始收据；和（iii）支付补卡手续费人民币300元。在补卡申请提交后，丢失的季卡将做失效处理不可再次使用。在发放新秋冬畅游季卡之前，我们将核实您的身份信息和照片信息以确保与原持卡人本人匹配。非首次申请补办的秋冬畅游季卡需在补办手续完成的3天后领取。秋冬畅游季卡在使用期限到期当月不可补办。</li><li>秋冬季畅游季卡持卡人应妥善保存季卡，如因保管不善致卡面信息无法辨识，可能将导致无法正常使用。发生此类情况时，畅游季卡持卡人须本人前往游客服务中心寻求帮助。</li><li>出于乐园承载量，恶劣天气，特别活动，安全、安保或秩序原因，或情况所需，我们可能会不时更改乐园营运时间或乐园内任何游乐项目的开放时间，暂时关闭乐园或乐园内的任何部份区域，限制入园人数，及/或暂停或取消任何游乐设施或娱乐演出。</li><li>本须知可能发生变更。对于任何重大变更，我们将向您发出通知。任何该等通知将会以电子邮件、手机短信或在官网上公示该等重大变更的方式发出。</li><li>我们有权随时终止或暂停出售秋冬畅游季卡。</li><li>我们有权不允许曾有严重违反《上海迪士尼乐园游客须知》行为的游客成为秋冬畅游季卡的持卡人。</li><li>在本须知中提及“上海迪士尼度假区”或“我们”指“上海国际主题乐园有限公司”或“上海国际主题乐园及度假区管理有限公司”或以上两者。</li></ul><br/><br/><span><b>上海迪士尼乐园一日票升级畅游季卡须知</b></span><br/><br/><ul><li>单日乐园门票于2017年9月11日起可通过补偿差价的方式，于游园当天在乐园主入口任意现场售票亭升级为秋冬畅游季卡。</li><li>使用过的乐园一日票门票，升级仅适用于该门票上所绑定照片信息的游客本人。</li><li>赠票、员工折扣票、企业联盟合作伙伴折扣票不可进行畅游季卡升级。</li><li>申请升级的游客须遵守《上海迪士尼乐园秋冬畅游季卡须知》。</li></ul>",
						"type": "webDescription",
						"usageType": "WDPRO"
					}
				},
				"group": "Guest Policy",
				"subgroup": "General Condition",
				"media": {
					"webfont": {
						"type": "icon",
						"hexCharacter": "",
						"fontName": "pepmdx",
						"htmlCharacter": ""
					}
				}
			}],
			"demographicsRequired": false,
			"alternateIdentifiers": {
				"analytics": [{
					"value": "SHTPSPOLRNRPQ4R"
				}]
			},
			"options": [{
				"optionType": "addOns",
				"optionValue": []
			}, {
				"optionType": "numDays",
				"optionValue": ["145"]
			}, {
				"optionType": "ageGroup",
				"optionValue": ["adult"]
			}],
			"blockoutDates": ["2017-10-02T00:00:00+08:00", "2017-10-03T00:00:00+08:00", "2017-10-04T00:00:00+08:00", "2017-10-05T00:00:00+08:00", "2018-01-26T00:00:00+08:00"],
			"policyIds": ["fall-seasonal-pass"],
			"monthlyPaymentEligible": false
		}
	},
	"policies": {
		"fall-seasonal-pass": {
			"id": "fall-seasonal-pass",
			"name": "Fall Winter Seasonal Pass Terms and Conditions",
			"descriptions": {
				"description": {
					"id": 1037,
					"key": "description",
					"text": "<span><b>上海迪士尼乐园秋冬畅游季卡须知</b></span><br/><br/><ul><li>本秋冬畅游季卡之发出及使用受本须知，以及公布于上海迪士尼乐园（“乐园”）官网<a href=https://www.shanghaidisneyresort.com/>www.shanghaidisneyresort.com</a>（“乐园官网”）和乐园入口处的《上海迪士尼乐园游客须知》的约束。秋冬畅游季卡持有者须遵守本须知及《上海迪士尼乐园游客须知》。</li><li>秋冬畅游季卡不可转让、更换及退款，除非法律另有规定。</li><li>秋冬畅游季卡仅限持卡人本人（即姓名印于该卡上的人）使用，如出现下述情况，我们有权随时撤销该卡而毋须退款或赔偿：（A）该卡被非持卡人本人用于入园或换取其它利益；（B）该卡和/或其项下的权利被用做商业用途或被出于其他目的非正当使用；（C）游客有任何危险，非法或攻击性行为; 或（D）游客有违反《上海迪士尼乐园游客须知》以至可能妨碍乐园运营的其他行为。</li><li>每一位游客名下只限持有一张与其名字绑定的秋冬畅游季卡。如果一位游客拥有多张与其名字绑定的秋冬畅游季卡，除第一张秋冬畅游季卡外，其余季卡将无法使用。</li><li>本秋冬畅游季卡有效期至<b>2018年1月25日</b>。</li><li>畅游季卡提供以下三种类别（均在限定日期不可使用，具体限定日期以【秋冬畅游季卡票务日历】所示为准）：<ul><li>秋冬季畅游季卡 — 无限卡（2017年10月2日至10月7日期间及12月31日不可使用）</li><li>秋冬畅游季卡 — 平日卡（2017年10月2日至10月7日期间及12月31日不可使用）</li><li>秋冬畅游季卡 — 周日卡（12月31日不可使用）</li></ul>具体适用日期以上海迪士尼度假区官方网站【秋冬畅游季卡票务日历】为准。<br /></li><li>在限定日期，无法使用秋冬畅游季卡入园。具体限定日期在发放本卡时所提供的文件中有说明亦可于度假区官网查询，可能会发生变动。当乐园达到承载量的限额时，我们将无法保证持卡游客入园。</li><li>秋冬畅游季卡使用者本人须前往乐园主入口售票亭出示个人身份证件原件（即身份证、护照、旅行证件）和购卡订单号以激活秋冬畅游季卡。中国大陆居民仅可使用身份证作为个人身份证件激活秋冬畅游季卡。临时身份证、身份证遗失证明、护照、驾驶执照均无法办理激活秋冬畅游季卡。</li><li>我们将采集游客照片和身份信息作为秋冬畅游季卡持有者的凭证，并与该秋冬畅游季卡绑定，秋冬畅游季卡持有者的姓名和照片不可更改。</li><li>所有季卡持卡游客每次入园都须按正常程序从乐园主入口入园，并请遵从演职人员的指引。</li><li>游客使用秋冬畅游季卡入园时，必须出示用于激活秋冬畅游季卡时所使用的个人身份证件原件来核实身份，确保秋冬畅游季卡是由持卡人本人使用。</li><li>秋冬畅游季卡在乐园开放时间段提供入园权限（具体运营时间将于度假区官网或上海迪士尼度假区视其方便的其他资讯上公布）。</li><li>此秋冬畅游季卡不适用于另行收费的特别活动及华特迪士尼大剧院入场，无免费停车特权。</li><li>若需申请补办丢失的秋冬畅游季卡，季卡持有人须务必（i）亲自前往位于乐园外的游客服务中心现场填写并提交季卡补办申请；（ii）提供原持卡人的个人身份信息，如个人身份证件原件（身份证、护照、旅行证件）及原始收据；和（iii）支付补卡手续费人民币300元。在补卡申请提交后，丢失的季卡将做失效处理不可再次使用。在发放新秋冬畅游季卡之前，我们将核实您的身份信息和照片信息以确保与原持卡人本人匹配。非首次申请补办的秋冬畅游季卡需在补办手续完成的3天后领取。秋冬畅游季卡在使用期限到期当月不可补办。</li><li>秋冬季畅游季卡持卡人应妥善保存季卡，如因保管不善致卡面信息无法辨识，可能将导致无法正常使用。发生此类情况时，畅游季卡持卡人须本人前往游客服务中心寻求帮助。</li><li>出于乐园承载量，恶劣天气，特别活动，安全、安保或秩序原因，或情况所需，我们可能会不时更改乐园营运时间或乐园内任何游乐项目的开放时间，暂时关闭乐园或乐园内的任何部份区域，限制入园人数，及/或暂停或取消任何游乐设施或娱乐演出。</li><li>本须知可能发生变更。对于任何重大变更，我们将向您发出通知。任何该等通知将会以电子邮件、手机短信或在官网上公示该等重大变更的方式发出。</li><li>我们有权随时终止或暂停出售秋冬畅游季卡。</li><li>我们有权不允许曾有严重违反《上海迪士尼乐园游客须知》行为的游客成为秋冬畅游季卡的持卡人。</li><li>在本须知中提及“上海迪士尼度假区”或“我们”指“上海国际主题乐园有限公司”或“上海国际主题乐园及度假区管理有限公司”或以上两者。</li></ul><br/><br/><span><b>上海迪士尼乐园一日票升级畅游季卡须知</b></span><br/><br/><ul><li>单日乐园门票于2017年9月11日起可通过补偿差价的方式，于游园当天在乐园主入口任意现场售票亭升级为秋冬畅游季卡。</li><li>使用过的乐园一日票门票，升级仅适用于该门票上所绑定照片信息的游客本人。</li><li>赠票、员工折扣票、企业联盟合作伙伴折扣票不可进行畅游季卡升级。</li><li>申请升级的游客须遵守《上海迪士尼乐园秋冬畅游季卡须知》。</li></ul>",
					"type": "webDescription",
					"usageType": "WDPRO"
				}
			},
			"group": "Guest Policy",
			"subgroup": "General Condition",
			"media": {
				"webfont": {
					"type": "icon",
					"hexCharacter": "",
					"fontName": "pepmdx",
					"htmlCharacter": ""
				}
			}
		}
	},
	"blockoutDates": {
		"shdrAnydaySeasonalAnnualPass": ["2017-10-02T00:00:00+08:00", "2017-10-03T00:00:00+08:00", "2017-10-04T00:00:00+08:00", "2017-10-05T00:00:00+08:00", "2018-01-26T00:00:00+08:00"]
	}
}

```

entitlements 包含绑定的门票列表，productInstances 包含该门票的详细介绍，policies 是该门票的服务政策，这个和 productInstances 有点重复。

---

以上即是 Entitlement view assembly service 的所有接口，用户门票验证查询和查询账户下绑定的门票