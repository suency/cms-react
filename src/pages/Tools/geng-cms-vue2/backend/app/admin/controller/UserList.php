<?php

namespace app\admin\controller;

use app\BaseController;
use think\Request;
use app\utils\ReturnJson;
use app\utils\RequestUrl;
use app\admin\model\UserListModel;
use app\admin\model\DoctorListModel;

use think\facade\Config;
use think\facade\Db;

class UserList extends BaseController
{
    public function get_wx_user_info(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $keyword = $request->post()["keyword"];

        $bannerList = Db::table('wx_user_info')->where("1=1")
            ->where('id', 'like', '%' . $keyword . '%')
            ->whereOr('id', 'like', '%' . $keyword . '%')
            ->paginate([
                'list_rows' => $request->post()["pageSize"],
                'page' => $request->post()["currentPage"]
            ]);

        $re = new ReturnJson($bannerList);
        return json($re->json);
    }

    public function update_wx_user_info(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $data = $request->post();
        $result = $data;
        unset($result['id']);
        Db::table('wx_user_info')
            ->where('id', $data["id"])
            ->update($result);

        $re = new ReturnJson(["msg" => "更新成功"]);
        return json($re->json);
    }

    public function getUserList(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $userList = UserListModel::select();
        $doctorList = DoctorListModel::select();
        $pageSize = $request->post()["pageSize"];
        $currentPage = $request->post()["currentPage"];

        foreach ($userList as $key1 => $value1) {
            $userList[$key1]['doctorInfo'] = "";
            foreach ($doctorList as $key2 => $value2) {
                if ($value1->id == $value2->uid) {
                    $userList[$key1]['doctorInfo'] = $value2;
                }
            }
        }

        $re = new ReturnJson($userList);
        // $re2 = new RequestUrl(env('APP.INNER_REQUEST_BASE').'/social/userInfoManage/findUserStatisticsByUid',["uid"=>2]);
        return json($re->json);
    }

    public function updateUser(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $data = $request->post();
        $sql1 = "UPDATE wx_user_info SET phone=" . $data['phone'] . ", realname='" . $data['realname'] . "', nickname = '" . $data['nickname'] . "' WHERE id = " . $data['id'];
        $sql2 = "UPDATE doctor_user_info SET phone=" . $data['phone'] . ", realname='" . $data['realname'] . "' WHERE uid = " . $data['id'];
        $re1 = Db::execute($sql1);

        if ($data['type'] == 2) {
            $re2 = Db::execute($sql2);
        }

        $v = new ReturnJson(["msg" => "更新成功"]);
        return json($v->json);
    }

    public function test(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $re = new ReturnJson(["msg" => "nb"]);
        return json($re->json);
    }
}
