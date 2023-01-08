<?php

namespace app\admin\controller;

use app\BaseController;
use think\Request;
use app\utils\ReturnJson;
use app\utils\RequestUrl;
use think\facade\Config;
use think\facade\Db;

class Money extends BaseController
{
     
    public function getConsume(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $consumeList = Db::table('user_integral_consume_log')->order('id', 'desc')->withAttr('user', function($value, $data) {
            return Db::table('wx_user_info')->where('id','=',$data["uid"])->find();
        })->paginate([
            'list_rows'=> $request->post()["pageSize"],
            'page' => $request->post()["currentPage"]
        ]);

        $re = new ReturnJson($consumeList);
        // $re2 = new RequestUrl(env('APP.INNER_REQUEST_BASE').'/social/userInfoManage/findUserStatisticsByUid',["uid"=>2]);
        return json($re->json);
    }

    public function getIncome(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }
        
        $consumeList = Db::table('user_integral_add_log')->order('id', 'desc')->withAttr('user', function($value, $data) {
            return Db::table('wx_user_info')->where('id','=',$data["uid"])->find();
        })->paginate([
            'list_rows'=> $request->post()["pageSize"],
            'page' => $request->post()["currentPage"]
        ]);

        $re = new ReturnJson($consumeList);
        // $re2 = new RequestUrl(env('APP.INNER_REQUEST_BASE').'/social/userInfoManage/findUserStatisticsByUid',["uid"=>2]);
        return json($re->json);
    }

}