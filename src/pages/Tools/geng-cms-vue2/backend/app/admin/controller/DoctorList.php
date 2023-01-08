<?php

namespace app\admin\controller;

use app\BaseController;
use think\Request;
use app\utils\ReturnJson;
use app\utils\RequestUrl;
use app\admin\model\DoctorListModel;

use think\facade\Config;
use think\facade\Db;

class DoctorList extends BaseController
{
     
    public function getDoctorList(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $doctorList = DoctorListModel::select();

        $re = new ReturnJson($doctorList);
        // $re2 = new RequestUrl(env('APP.INNER_REQUEST_BASE').'/social/userInfoManage/findUserStatisticsByUid',["uid"=>2]);
        return json($re->json);
    }

}