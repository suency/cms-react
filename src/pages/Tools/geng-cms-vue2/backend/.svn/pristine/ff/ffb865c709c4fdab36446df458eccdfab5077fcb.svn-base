<?php

namespace app\admin\controller;

use app\BaseController;
use think\Request;
use app\utils\ReturnJson;
use app\utils\RequestUrl;
use think\facade\Config;
use think\facade\Db;

class Activity extends BaseController
{
     
    public function getBanner(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $bannerList = Db::table('home_page_banner')->select();

        $re = new ReturnJson($bannerList);
        return json($re->json);
    }

    public function updateBanner(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $data = $request->post();
        $result = $data;
        unset($result['id']);
        Db::table('home_page_banner')
            ->where('id', $data["id"])
            ->update($result);

        $re = new ReturnJson(["msg"=>"更新成功"]);
        return json($re->json);
    }
}