<?php

namespace app\admin\controller;

use app\BaseController;
use think\Request;
use app\utils\ReturnJson;
use app\utils\RequestUrl;
use think\facade\Config;
use think\facade\Db;

class GroupInfo extends BaseController
{

    public function get_group_info(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $keyword = $request->post()["keyword"];

        $bannerList = Db::table('group_info')->where("1=1")
            ->where('id','like','%'.$keyword.'%')
            ->whereOr('group_name','like','%'.$keyword.'%')
            ->order('weight','desc')->paginate([
            'list_rows' => $request->post()["pageSize"],
            'page' => $request->post()["currentPage"]
        ]);

        $re = new ReturnJson($bannerList);
        return json($re->json);
    }

    public function update_group_info(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $data = $request->post();
        $result = $data;
        unset($result['id']);
        Db::table('group_info')
            ->where('id', $data["id"])
            ->update($result);

        $re = new ReturnJson(["msg" => "更新成功"]);
        return json($re->json);
    }
}