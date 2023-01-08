<?php

namespace app\admin\controller;

use app\BaseController;
use think\Request;
use app\utils\ReturnJson;
use app\utils\RequestUrl;
use think\facade\Config;
use think\facade\Db;
use OSS\OssClient;
use OSS\Core\OssException;

class Activity extends BaseController
{
     
    public function getBanner(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $bannerList = Db::table('home_page_banner')->select();

        $re = new ReturnJson($bannerList);
        // $re2 = new RequestUrl(env('APP.INNER_REQUEST_BASE').'/social/userInfoManage/findUserStatisticsByUid',["uid"=>2]);
        return json($re->json);
    }

    public function updateOrder(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $old = $request->post()["old"];
        $new = $request->post()["new"];

        /* Db::name('home_page_banner')
            ->save(['id' => $old["id"], 'ranking' => $new["ranking"]]); */

        Db::table('home_page_banner')
            ->where('id', $old["id"])
            ->update(['ranking' => $new["ranking"]]);
        Db::table('home_page_banner')
            ->where('id', $new["id"])
            ->update(['ranking' => $old["ranking"]]);

        //$bannerList = Db::table('home_page_banner')->select();

        $re = new ReturnJson(["msg"=>"更新成功"]);
        // $re2 = new RequestUrl(env('APP.INNER_REQUEST_BASE').'/social/userInfoManage/findUserStatisticsByUid',["uid"=>2]);
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

        //var_dump($old);
        //$bannerList = Db::table('home_page_banner')->select();

        $re = new ReturnJson(["msg"=>"更新成功"]);
        // $re2 = new RequestUrl(env('APP.INNER_REQUEST_BASE').'/social/userInfoManage/findUserStatisticsByUid',["uid"=>2]);
        return json($re->json);
    }
}