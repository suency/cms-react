<?php

namespace app\admin\controller;

use app\BaseController;
use think\Request;
use app\utils\ReturnJson;
use app\admin\model\RoutesModel;
use app\admin\model\RolesModel;

class Routes extends BaseController
{


    public function getRoutes(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            // dump($request);
            exit('options类型的请求，结束');
        }
        // var_dump($request->post());
        $role = $request->post()[0];
        $role_routes = RolesModel::where('name', $role)->find();

        //根据角色获取相应的权限路由 超级管理员默认全部菜单
        $db = [];
        if ($role_routes->super_admin == '1') {
            $db = RoutesModel::where('display', 1)->select();
        } else {
            $db = RoutesModel::where('display', 1)->select(explode(",", $role_routes->routes));
        }

        $result = $this->convertMenuJson($db, 0);
        array_push($result, ["path" => "*", "redirect" => "/404", "hidden" => true, "meta" => []]);
        $re = new ReturnJson($result);
        return json($re->json);
    }

    public function addRoutes(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $RoutesModel = new RoutesModel;

        $title_exist = RoutesModel::where('title', $request->param('title'))->select();


        if (sizeof($title_exist) > 0) {
            $temp = new ReturnJson(["msg" => '菜单名字已存在'], "fail");
        } else {
            $re_save = $RoutesModel->save([
                'title'  =>  $request->param('title'),
                'name'  =>  $request->param('title'),
                'path' =>  $request->param('path'),
                'component' =>  $request->param('component'),
                'alwaysShow' =>  $request->param('alwaysShow'),
                'pid' =>  $request->param('pid'),
                'rank' =>  $request->param('rank'),
                'icon' =>  $request->param('icon')
            ]);
            if ($re_save) {
                $temp = new ReturnJson(["msg" => '保存成功']);
            }
        }

        // $temp = new ReturnJson($result);
        return json($temp->json);
    }

    public function editRoutes(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $id = $request->param('id');
        $RoutesModel = RoutesModel::find($id);

        $title_exist = RoutesModel::where('title', $request->param('title'))->find();

        if ($title_exist && $title_exist->id != $id) {
            $temp = new ReturnJson(["msg" => '菜单名字已存在'], "fail");
        } else {
            $re_save = $RoutesModel->save([
                'title'  =>  $request->param('title'),
                'name'  =>  $request->param('title'),
                'path' =>  $request->param('path'),
                'component' =>  $request->param('component'),
                'alwaysShow' =>  $request->param('alwaysShow'),
                'pid' =>  $request->param('pid'),
                'rank' =>  $request->param('rank'),
                'icon' =>  $request->param('icon')
            ]);
            if ($re_save) {
                $temp = new ReturnJson(["msg" => '保存成功']);
            }
        }
        return json($temp->json);
    }

    public function deleteRoutes(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $id = $request->param('id');


        $db = RoutesModel::where('display', 1)->select();

        $result = $this->getChildIds($db, $id);
        array_push($result, $id);

        $v = RoutesModel::destroy($result);
        
        if ($v) {
            $temp = new ReturnJson(["msg" => '删除成功']);
            return json($temp->json);
        }else{
            $temp = new ReturnJson(["msg" => '删除失败'],"fail");
            return json($temp->json);
        }
    }

    private function getChildIds($array, $pid)
    {
        $data = array();
        foreach ($array as $k => $v) {        //PID符合条件的
            if ($v['pid'] == $pid) {            //寻找子集
                array_push($data, $v['id']);
                $re = $this->getChildIds($array, $v['id']);            //加入数组
                $data = array_merge($data, $re);
            }
        }
        return $data;
    }


    public function getRoutesById(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }
        $db = RoutesModel::where('display', 1)->select();
        $result = $this->getChild($db, 2);
        $re = new ReturnJson($result);
        return json($re->json);
    }

    private function getChild($array, $pid = 0)
    {
        $data = array();
        foreach ($array as $k => $v) {        //PID符合条件的
            if ($v['pid'] == $pid) {            //寻找子集
                $child = $this->getChild($array, $v['id']);            //加入数组
                $v['children'] = $child ?: array();
                $data[] = $v; //加入数组中
            }
        }
        return $data;
    }

    private function convertMenuJson($data, $pid)
    {
        $result = [];
        $temp = [];
        for ($i = 0; $i < count($data); $i++) {
            if ($data[$i]->pid == $pid) {
                $obj = [
                    "path" => $data[$i]->path,
                    "id" => $data[$i]->id,
                    "pid" => $data[$i]->pid,
                    "component" => $data[$i]->component,
                    "name" => $data[$i]->name,
                    "redirect" => $data[$i]->redirect,
                    "alwaysShow" => $data[$i]->alwaysShow == 0 ? false : true,
                    "hidden" => $data[$i]->hidden == 0 ? false : true,
                    "rank" => $data[$i]->rank,
                    "meta" => [
                        "title" => $data[$i]->title,
                        "roles" => $data[$i]->roles,
                        "icon" => $data[$i]->icon,
                        "activeMenu" => $data[$i]->activeMenu,
                        "noCache" => $data[$i]->noCache == 0 ? false : true,
                        "breadcrumb" => $data[$i]->breadcrumb == 1 ? true : false
                    ]
                ];

                $temp = $this->convertMenuJson($data, $data[$i]->id);
                if (count($temp) > 0) {
                    $obj["children"] = $temp;
                }

                array_push($result, $obj);
            }
        }
        return $result;
    }
}
