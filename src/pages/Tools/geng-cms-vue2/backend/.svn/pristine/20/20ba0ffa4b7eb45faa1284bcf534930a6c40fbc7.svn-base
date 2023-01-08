<?php

namespace app\admin\controller;

use app\BaseController;
use think\Request;
use app\utils\ReturnJson;
use app\admin\model\RolesModel;

class Roles extends BaseController
{
     
    public function index(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $roles = RolesModel::select();

        $re = new ReturnJson($roles);
        return json($re->json);
        
    }

    public function update(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $re = new ReturnJson(["status"=>"success"]);
        return json($re->json);
    }
}