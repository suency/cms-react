<?php

namespace app\admin\controller;

use app\BaseController;
use app\admin\model\UserModel;
use think\Request;
use app\admin\validate\LoginValidate;
use think\exception\ValidateException;

use \Firebase\JWT\JWT; //导入JWT

class Transaction extends BaseController
{
    public function login(Request $request)
    {

        //如果是options请求，就结束执行下面语句
        if ($request->method() == 'OPTIONS') {
            //exit是用来结束程序执行的,如果参数是字符串，PHP将会直接把字符串输出，
            //如果参数是整型（范围是0-254），那个参数将会被作为结束状态使用。
            //dump($request);
            exit('options类型的请求，结束');
        }

        $info = [];
        $data = $request->post();

        //dump($data);
        try {
            validate(LoginValidate::class)->check($data);
            $password = UserModel::where('username', '=', $data['username'])->field('password')->find();
            if ($data['password'] == $password->password) {
                $token = UserModel::where('username', '=', $data['username'])->field('token')->find();
                $info = ["code" => 20000, "data" => ["status" => "OK", "msg" => "登陆成功", "token" => $token->token]];
            } else {
                $info = ["code" => 400, "data" => ["status" => "Bad", "msg" => "用户名或者密码错误"]];
            }

            return json($info);
        } catch (ValidateException $e) {
            // 验证失败 输出错误信息
            //dump($e->getError());
            $info = ["code" => 400, "data" => ["status" => "Bad", "msg" => $e->getError()]];
            return json($info);
        }
    }

    public function list(Request $request)
    {

        //如果是options请求，就结束执行下面语句
        if ($request->method() == 'OPTIONS') {
            //exit是用来结束程序执行的,如果参数是字符串，PHP将会直接把字符串输出，
            //如果参数是整型（范围是0-254），那个参数将会被作为结束状态使用。
            //dump($request);
            exit('options类型的请求，结束');
        }

        $date = date_create();

        /* $info = [
            "code" => 20000,
            "data" => [
                "total" => 20,
                "items" => [
                    "order_no" => '@guid()',
                    "timestamp" => date_timestamp_get($date),
                    "username" => '@name()',
                    "price" => '@float(1000, 15000, 0, 2)',
                    'status|1' => ['success', 'pending']
                ]
            ]
        ]; */

        $info = '{
            "code": 20000,
            "data": {
                "total": 20,
                "items": [
                    {
                        "order_no": "DFb67F31-b3Ac-6442-E367-bC747AbA09B3",
                        "timestamp": 970952323501,
                        "username": "Jennifer Clark",
                        "price": 13408.1,
                        "status": "pending"
                    },
                    {
                        "order_no": "CA30f6Fc-2Bfe-1B23-fb6e-2BC899D01d6e",
                        "timestamp": 970952323501,
                        "username": "Sharon Williams",
                        "price": 11093,
                        "status": "pending"
                    },
                    {
                        "order_no": "6Bb80cA9-Cb3f-1164-Babb-4e7cDF7C8B7A",
                        "timestamp": 970952323501,
                        "username": "Richard Lopez",
                        "price": 1830,
                        "status": "success"
                    },
                    {
                        "order_no": "4DbDd4F7-bE7A-Ec89-8CDF-150f9D8BA82c",
                        "timestamp": 970952323501,
                        "username": "Lisa Robinson",
                        "price": 12210,
                        "status": "success"
                    },
                    {
                        "order_no": "d6A3ec64-bD4c-9d39-eB2f-087fb9bFACfd",
                        "timestamp": 970952323501,
                        "username": "Matthew Rodriguez",
                        "price": 11265.2,
                        "status": "pending"
                    },
                    {
                        "order_no": "dc5Be85a-CfBE-BbA7-dEF3-6d596cd37ef6",
                        "timestamp": 970952323501,
                        "username": "Helen Rodriguez",
                        "price": 11090,
                        "status": "success"
                    },
                    {
                        "order_no": "fCD27127-be5f-E9e3-469C-36D55bf4Bf73",
                        "timestamp": 970952323501,
                        "username": "Mark Brown",
                        "price": 5772.56,
                        "status": "pending"
                    },
                    {
                        "order_no": "3Fa5FF75-A29B-F8eE-7212-BeD168BdC7CB",
                        "timestamp": 970952323501,
                        "username": "Charles Hall",
                        "price": 9888,
                        "status": "pending"
                    },
                    {
                        "order_no": "f60E4F38-cdB7-d5dA-da9f-4c87AD66Ed61",
                        "timestamp": 970952323501,
                        "username": "Jose Taylor",
                        "price": 14409.32,
                        "status": "pending"
                    },
                    {
                        "order_no": "5DE7f2E8-dAC1-cA92-6C50-Fe6ee085df5F",
                        "timestamp": 970952323501,
                        "username": "Jose Williams",
                        "price": 11784.6,
                        "status": "pending"
                    },
                    {
                        "order_no": "2d8F81d1-578F-E20e-ddAE-D9c7d981F36c",
                        "timestamp": 970952323501,
                        "username": "Edward Moore",
                        "price": 5056,
                        "status": "success"
                    },
                    {
                        "order_no": "5F12F5C8-73Eb-e89F-f8Be-1cf143FB9dAE",
                        "timestamp": 970952323501,
                        "username": "Richard Brown",
                        "price": 14472.3,
                        "status": "success"
                    },
                    {
                        "order_no": "93ecE245-eabf-c8Be-3AEc-17AEf2CF59D5",
                        "timestamp": 970952323501,
                        "username": "Sharon Jackson",
                        "price": 11674.7,
                        "status": "pending"
                    },
                    {
                        "order_no": "9CbFD1e7-bFfb-7aB5-26Dc-CbDD1897AACB",
                        "timestamp": 970952323501,
                        "username": "George Rodriguez",
                        "price": 13413,
                        "status": "pending"
                    },
                    {
                        "order_no": "fDbA145B-6FbE-6C0D-96Bc-3A8ddBfCE0db",
                        "timestamp": 970952323501,
                        "username": "Kimberly Martinez",
                        "price": 5623,
                        "status": "pending"
                    },
                    {
                        "order_no": "5ED0FE44-2F73-FfBC-1282-Df2489245BfD",
                        "timestamp": 970952323501,
                        "username": "Kimberly Gonzalez",
                        "price": 11297.6,
                        "status": "success"
                    },
                    {
                        "order_no": "dCBb9E4b-E329-0AcE-55fe-d133064D3Df1",
                        "timestamp": 970952323501,
                        "username": "Christopher White",
                        "price": 5288.5,
                        "status": "pending"
                    },
                    {
                        "order_no": "3C6d1eFb-fbFb-be2b-A3eD-E7D5cdD5Dd2D",
                        "timestamp": 970952323501,
                        "username": "Robert Taylor",
                        "price": 11319.8,
                        "status": "success"
                    },
                    {
                        "order_no": "d1Ea8244-e69c-6c1A-B272-Ae7CF2fce78b",
                        "timestamp": 970952323501,
                        "username": "Amy Moore",
                        "price": 10420.9,
                        "status": "success"
                    },
                    {
                        "order_no": "41AB5Cec-b5fC-0Ff2-3F26-7D035Fc4dCe4",
                        "timestamp": 970952323501,
                        "username": "Frank Perez",
                        "price": 13814.2,
                        "status": "success"
                    }
                ]
            }
        }';


        return json(json_decode($info));
    }
}
