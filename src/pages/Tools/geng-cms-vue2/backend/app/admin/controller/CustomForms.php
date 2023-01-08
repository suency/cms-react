<?php

namespace app\admin\controller;

use app\BaseController;
use think\Request;
use app\utils\ReturnJson;
use app\admin\model\CustomFormsModel;

use think\facade\Config;
use think\facade\Db;


class CustomForms extends BaseController
{
     
    public function getForms(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $result = CustomFormsModel::select();

        $re = new ReturnJson($result);
        return json($re->json);
    }

    public function createForm(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }
        $name = $request->param('name');
        $json = $request->param('json');

        $form = CustomFormsModel::where("name",$name)->find();

        if($form){
            $re = new ReturnJson(["msg"=>"名字已存在"]);
            return json($re->json);
        }else{
            $voter = new CustomFormsModel();
            $voter->name = $name;
            $voter->json = $json;
            $v = $voter->save();

            if($v){
                $re = new ReturnJson(["msg"=>"创建成功"]);
                return json($re->json);
            }   
        }
    }

    public function editForm(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }
        $name = $request->param('name');
        $json = $request->param('json');
        $id = $request->param('id');
        
        $form = CustomFormsModel::where("name",$name)->find();

        if($form && $form->id != $id){
            $re = new ReturnJson(["msg"=>"名字已存在"]);
            return json($re->json);
        }else{
            $voter = CustomFormsModel::find($id);
            $voter->name = $name;
            $voter->json = $json;
            $v = $voter->save();

            if($v){
                $re = new ReturnJson(["msg"=>"更新成功"]);
                return json($re->json);
            }   
        }
    }

    public function deteleForm(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $id = $request->param('id');
        
        $voter = CustomFormsModel::find($id);
        if($voter){
            $v = $voter->delete();
            if($v){
                $re = new ReturnJson(["msg"=>"删除成功"]);
                return json($re->json);
            }   
        }   
    }

    public function test(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $re = new ReturnJson(["msg"=>"nb"]);
        return json($re->json);
    }

    
    
}