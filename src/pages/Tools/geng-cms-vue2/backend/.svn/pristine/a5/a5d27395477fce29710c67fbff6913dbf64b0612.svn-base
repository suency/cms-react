<?php

namespace app\minipro\controller;

use app\BaseController;
use think\Request;
use app\utils\ReturnJson;
use app\utils\RequestUrl;
use think\facade\Config;
use think\facade\Db;

class Testhhk extends BaseController
{
     
    public function getBanner(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        /* $bannerList = Db::table('home_page_banner')->select();

        $re = new ReturnJson($bannerList);
        return json($re->json); */
        return json(["a"=>"123"]);
    }

}