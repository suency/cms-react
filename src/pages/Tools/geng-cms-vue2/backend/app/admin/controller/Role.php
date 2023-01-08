<?php

namespace app\admin\controller;

use app\BaseController;
use think\Request;
use app\utils\ReturnJson;
use app\admin\model\RolesModel;

class Role extends BaseController
{

    public function index(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $info = '{
            "code": 20000,
            "data": {
                "key": 4617
            }
        }';
        return json(json_decode($info));
    }

    public function update(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $id = $request->param('id');
        $ids = $request->param('ids');
        $name = $request->param('name');
        $description = $request->param('description');

        $role = RolesModel::find($id);

        // var_dump($des);die;
        $role->description = $description;
        $role->routes = implode(',', $ids);
        $role->name = $name;
        $role->key = $name;

        $re = $role->save();

        if ($re) {
            $re = new ReturnJson(["msg" => "更新成功"]);
            return json($re->json);
        }
    }

    public function create(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $name = $request->param('name');
        $description = $request->param('description');
        $ids = $request->param('ids');


        $role = new RolesModel();
        $role->key = $name;
        $role->name = $name;
        $role->description = $description;
        $role->routes = implode(',', $ids);

        $re = $role->save();

        $re = new ReturnJson(["name" => $name, "key" => $name, "description" => $description, "msg" => "创建成功"]);
        return json($re->json);
    }

    public function delete(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $id = $request->param('id');
        $role = RolesModel::find($id);
        $role->delete();
        $re = new ReturnJson(["msg" => "删除成功"]);
        return json($re->json);
    }
}
