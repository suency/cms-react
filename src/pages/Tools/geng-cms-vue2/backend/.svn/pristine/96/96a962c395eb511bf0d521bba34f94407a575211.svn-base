<?php

namespace app\admin\controller;

use app\BaseController;
use think\Request;
use app\utils\ReturnJson;
use app\utils\RequestUrl;
use app\admin\model\UserListModel;

use think\facade\Config;
use think\facade\Db;

class CaseList extends BaseController
{
     
    public function getCaseDetail(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $data = $request->post();
        // var_dump($data);
        $re2 = new RequestUrl(
            env('APP.INNER_REQUEST_BASE').'/social/experienceSharing/queryExperienceSharingByEid',
            ["uid"=>0,"eid"=>$data['id']],
            'GET',
            ['Content-Type: application/json']
        );
        return json($re2->json);
    }

    public function getCaseList(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $data = $request->post();
        // var_dump($data);
        $re2 = new RequestUrl(
            env('APP.INNER_REQUEST_BASE').'/social/experienceSharing/queryExperienceSharingList',
            ["findType"=>1,"pageNo"=>$data['page'],"pageSize"=>$data['pageSize']],
            'POST',
            ['Content-Type: application/json']
        );
        return json($re2->json);
    }


    public function updateCase(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $data = $request->post();
        $sql1 = "UPDATE wx_user_info SET phone=".$data['phone'].", realname='".$data['realname']."', nickname = '".$data['nickname']."' WHERE id = ".$data['id'];
        $sql2 = "UPDATE doctor_user_info SET phone=".$data['phone'].", realname='".$data['realname']."' WHERE uid = ".$data['id'];
        $re1 = Db::execute($sql1);
        
        if( $data['type'] == 2 ){
            $re2 = Db::execute($sql2);   
        }

        $v = new ReturnJson(["msg"=>"更新成功"]);
        return json($v->json);
        
    }

    public function deleteCase(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $data = $request->post();
        $re = Db::table('experience_sharing')
        ->where('id', $data['id'])
        ->update(['state' => 1]);
        
        if($re){
            $v = new ReturnJson(["msg"=>"删除成功"]);
            return json($v->json);
        }
        
        
    }

}