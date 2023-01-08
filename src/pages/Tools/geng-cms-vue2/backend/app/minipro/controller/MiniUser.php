<?php

namespace app\minipro\controller;

use app\BaseController;
use think\Request;
use app\utils\ReturnJson;
use app\utils\RequestUrl;
use think\facade\Config;
use think\facade\Db;

use \Firebase\JWT\JWT; //导入JWT

class MiniUser extends BaseController
{
     
    public function login(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $re2 = new RequestUrl(
            'https://api.weixin.qq.com/sns/jscode2session',
            [
                "appid"=>"wx729232708d57fb28",
                "secret"=>"bd8d3bfe0933e9d50b5fae056e7e1d6e",
                "js_code"=>$request->post()["code"],
                "grant_type"=>"authorization_code"
            ],
            'GET',
            ['Content-Type: application/json']
        );
        $openid = $re2->json["data"]->openid;

        $user = Db::table('minipro_user')->where('openid', $openid)->find();
        
        if($user){

        }else{
            $data = ['openid' => $openid, 'nickname' => 'hehe'];
            Db::table('minipro_user')->insert($data); 
        }
        //如果没有注册自动注册 已经注册了 自动登录
        $token = $this->lssue($openid, $openid);
        
        $info = [
            "code" => "ok", 
            "data" => ["msg" => "登陆成功", "openid" => $openid,"token" => $token]];

        return json($info);
    }

    public function getUserInfo(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $info = Db::table("minipro_user")->select();

        $re = new ReturnJson($info);
        // return json($re->json);
        return json(["uu"=>$request->jwtInfo]);
    }

    //签发Token
    public function lssue($userid, $username)
    {
        //Config::get('app.JWT_timeout')
        $key = Config::get('app.JWT_key'); //key
        $time = time(); //当前时间
        $token = [
            'iss' => 'https://social.doctormeeting.com', //签发者 可选
            'aud' => 'https://social.doctormeeting.com', //接收该JWT的一方，可选
            'iat' => $time, //签发时间
            'nbf' => $time, //(Not Before)：某个时间点后才能访问，比如设置time+30，表示当前时间30秒后才能使用
            'exp' => $time + Config::get('app.JWT_timeout'), //过期时间,这里设置2个小时
            'data' => [ //自定义信息，不要定义敏感信息
                'userid' => $userid,
                'username' => $username,
                'endtime' => $time + Config::get('app.JWT_timeout')
            ]
        ];
        return JWT::encode($token, $key); //输出Token
    }

}