//
//  NetworkMock.swift
//  Pagination
//
//  Created by 김종권 on 2021/10/02.
//

import Foundation
import UIKit

struct NetworkResponseMock {
    static let photoList: Data = """
                            [
                               {
                                  "id":"z3htkdHUh5w",
                                  "description":"Remote Working in Iceland Self-Portrait (See a video tour of this co-working space at YouTube.com/TravelingwithKristin)",
                                  "categories":[

                                  ],
                                  "sponsorship":{
                                     "tagline_url":"https://ad.doubleclick.net/ddm/trackclk/N1224323.3286893UNSPLASH/B25600467.313516386;dc_trk_aid=506408943;dc_trk_cid=157730382;dc_lat=;dc_rdid=;tag_for_child_directed_treatment=;tfua=;ltd=",
                                     "sponsor":{
                                        "id":"D-bxv1Imc-o",
                                        "total_photos":0,
                                        "for_hire":false,
                                        "social":{
                                           "instagram_username":"mailchimp",
                                           "paypal_email":null,
                                           "portfolio_url":"https://mailchimp.com/",
                                           "twitter_username":"Mailchimp"
                                        },
                                        "twitter_username":"Mailchimp",
                                        "instagram_username":"mailchimp",
                                        "portfolio_url":"https://mailchimp.com/",
                                        "bio":"The all-in-one Marketing Platform built for growing businesses.",
                                        "accepted_tos":false,
                                        "location":null,
                                        "first_name":"Mailchimp",
                                        "updated_at":"2021-10-01T14:04:57-04:00",
                                        "username":"mailchimp",
                                        "links":{
                                           "photos":"https://api.unsplash.com/users/mailchimp/photos",
                                           "following":"https://api.unsplash.com/users/mailchimp/following",
                                           "portfolio":"https://api.unsplash.com/users/mailchimp/portfolio",
                                           "html":"https://unsplash.com/@mailchimp",
                                           "followers":"https://api.unsplash.com/users/mailchimp/followers",
                                           "self":"https://api.unsplash.com/users/mailchimp",
                                           "likes":"https://api.unsplash.com/users/mailchimp/likes"
                                        },
                                        "profile_image":{
                                           "small":"https://images.unsplash.com/profile-1609545740442-928866556c38image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                                           "large":"https://images.unsplash.com/profile-1609545740442-928866556c38image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128",
                                           "medium":"https://images.unsplash.com/profile-1609545740442-928866556c38image?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64"
                                        },
                                        "last_name":null,
                                        "total_collections":0,
                                        "name":"Mailchimp",
                                        "total_likes":19
                                     },
                                     "impression_urls":[
                                        "https://secure.insightexpressai.com/adServer/adServerESI.aspx?script=false&bannerID=8967594&rnd=[timestamp]&redir=https://secure.insightexpressai.com/adserver/1pixel.gif",
                                        "https://ad.doubleclick.net/ddm/trackimp/N1224323.3286893UNSPLASH/B25600467.313516386;dc_trk_aid=506408943;dc_trk_cid=157730382;ord=[timestamp];dc_lat=;dc_rdid=;tag_for_child_directed_treatment=;tfua=;ltd=?",
                                        "https://tag.researchnow.com/t/beacon?pr=285833&adn=1&ca=25600467&si=6303199&pl=313516386&cr=506408943&did=176&ord=[timestamp]&gdpr=${GDPR}&gdpr_consent=${GDPR_CONSENT_110}&us_privacy=${US_PRIVACY}"
                                     ],
                                     "tagline":"For Growing Businesses"
                                  },
                                  "topic_submissions":{
                                     "business-work":{
                                        "status":"approved",
                                        "approved_on":"2021-07-09T12:47:56-04:00"
                                     }
                                  },
                                  "created_at":"2020-04-06T22:49:29-04:00",
                                  "width":5823,
                                  "likes":724,
                                  "blur_hash":"LfHV3ba#IUWB_NWBRiofWCayayj]",
                                  "alt_description":"person in blue jacket sitting on brown wooden chair near brown wooden table during daytime",
                                  "color":"#d9d9d9",
                                  "urls":{
                                     "raw":"https://images.unsplash.com/photo-1586227740560-8cf2732c1531?ixid=MnwyNjQwNjh8MXwxfGFsbHwxfHx8fHx8Mnx8MTYzMzE1NTMwNw&ixlib=rb-1.2.1",
                                     "full":"https://images.unsplash.com/photo-1586227740560-8cf2732c1531?crop=entropy&cs=srgb&fm=jpg&ixid=MnwyNjQwNjh8MXwxfGFsbHwxfHx8fHx8Mnx8MTYzMzE1NTMwNw&ixlib=rb-1.2.1&q=85",
                                     "thumb":"https://images.unsplash.com/photo-1586227740560-8cf2732c1531?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNjQwNjh8MXwxfGFsbHwxfHx8fHx8Mnx8MTYzMzE1NTMwNw&ixlib=rb-1.2.1&q=80&w=200",
                                     "regular":"https://images.unsplash.com/photo-1586227740560-8cf2732c1531?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNjQwNjh8MXwxfGFsbHwxfHx8fHx8Mnx8MTYzMzE1NTMwNw&ixlib=rb-1.2.1&q=80&w=1080",
                                     "small":"https://images.unsplash.com/photo-1586227740560-8cf2732c1531?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=MnwyNjQwNjh8MXwxfGFsbHwxfHx8fHx8Mnx8MTYzMzE1NTMwNw&ixlib=rb-1.2.1&q=80&w=400"
                                  },
                                  "current_user_collections":[

                                  ],
                                  "updated_at":"2021-10-01T07:17:41-04:00",
                                  "height":3517,
                                  "links":{
                                     "download_location":"https://api.unsplash.com/photos/z3htkdHUh5w/download?ixid=MnwyNjQwNjh8MXwxfGFsbHwxfHx8fHx8Mnx8MTYzMzE1NTMwNw",
                                     "self":"https://api.unsplash.com/photos/z3htkdHUh5w",
                                     "html":"https://unsplash.com/photos/z3htkdHUh5w",
                                     "download":"https://unsplash.com/photos/z3htkdHUh5w/download"
                                  },
                                  "liked_by_user":false,
                                  "promoted_at":null,
                                  "user":{
                                     "id":"Jfwg6nU-uk8",
                                     "total_photos":50,
                                     "for_hire":true,
                                     "social":{
                                        "instagram_username":"travelingwithkristin",
                                        "paypal_email":null,
                                        "portfolio_url":"https://www.youtube.com/travelingwithkristin",
                                        "twitter_username":"whereskristin"
                                     },
                                     "twitter_username":"whereskristin",
                                     "instagram_username":"travelingwithkristin",
                                     "portfolio_url":"https://www.youtube.com/travelingwithkristin",
                                     "bio":"Writer, videographer, YouTuber, and content marketing strategist. Travel blogger x 62 countries. Work with me: hello[at]travelingwithkristin.com",
                                     "accepted_tos":true,
                                     "location":"Miami, FL",
                                     "first_name":"Kristin",
                                     "updated_at":"2021-10-01T22:35:16-04:00",
                                     "username":"kristinwilson",
                                     "links":{
                                        "photos":"https://api.unsplash.com/users/kristinwilson/photos",
                                        "following":"https://api.unsplash.com/users/kristinwilson/following",
                                        "portfolio":"https://api.unsplash.com/users/kristinwilson/portfolio",
                                        "html":"https://unsplash.com/@kristinwilson",
                                        "followers":"https://api.unsplash.com/users/kristinwilson/followers",
                                        "self":"https://api.unsplash.com/users/kristinwilson",
                                        "likes":"https://api.unsplash.com/users/kristinwilson/likes"
                                     },
                                     "profile_image":{
                                        "small":"https://images.unsplash.com/profile-fb-1527578274-b6763bec03ea.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=32&w=32",
                                        "large":"https://images.unsplash.com/profile-fb-1527578274-b6763bec03ea.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=128&w=128",
                                        "medium":"https://images.unsplash.com/profile-fb-1527578274-b6763bec03ea.jpg?ixlib=rb-1.2.1&q=80&fm=jpg&crop=faces&cs=tinysrgb&fit=crop&h=64&w=64"
                                     },
                                     "last_name":"Wilson",
                                     "total_collections":7,
                                     "name":"Kristin Wilson",
                                     "total_likes":5
                                  }
                               },
                            ]
                            """.data(using: .utf8)!
    static let image: Data = UIImage(systemName: "square")!.pngData()!
}
