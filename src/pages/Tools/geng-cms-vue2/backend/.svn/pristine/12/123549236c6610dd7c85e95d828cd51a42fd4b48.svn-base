<?php

namespace app\admin\controller;

use app\BaseController;
use think\Request;
use app\utils\ReturnJson;
use app\utils\RequestUrl;
use think\facade\Config;
use think\facade\Db;

class DbAdmin extends BaseController
{
     
    public function getAllTables(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $bannerList = Db::query('SELECT
        TABLE_NAME,
            Engine,
            Table_rows,
            Table_collation,
            TABLE_COMMENT,
            CREATE_TIME
        FROM
            information_schema.TABLES
        WHERE
            TABLE_SCHEMA = (SELECT DATABASE ())
            ORDER BY CREATE_TIME DESC
        ');

        $re = new ReturnJson($bannerList);
        // $re2 = new RequestUrl(env('APP.INNER_REQUEST_BASE').'/social/userInfoManage/findUserStatisticsByUid',["uid"=>2]);
        return json($re->json);
    }

}