<?php

    namespace app\admin\controller;
    
    use app\BaseController;
    use think\Request;
    use app\utils\ReturnJson;
    use app\utils\RequestUrl;
    use think\facade\Config;
    use think\facade\Db;
    
    class UserComplaint extends BaseController
    {
         
        public function get_user_complaint(Request $request)
        {
            if ($request->method() == 'OPTIONS') {
                exit('options类型的请求，结束');
            }
            
            $keyword = $request->post()["keyword"];
            $bannerList = Db::table('user_complaint')
                ->alias('a')
                ->where("1=1")
                ->where('a.id','like','%'.$keyword.'%')
                ->whereOr('a.id','like','%'.$keyword.'%')
                ->field('a.id,a.eid,a.uid,b.realname,b.head_url,a.content_info,a.photo_evidence_url,a.create_date')
                ->leftJoin('wx_user_info b','a.uid = b.id')
                ->paginate([
                    'list_rows' => $request->post()["pageSize"],
                    'page' => $request->post()["currentPage"]
                ]);

            $re = new ReturnJson($bannerList);
            return json($re->json);
        }
    
        public function update_user_complaint(Request $request)
        {
            if ($request->method() == 'OPTIONS') {
                exit('options类型的请求，结束');
            }
    
            $data = $request->post();
            $result = $data;
            unset($result['id']);
            Db::table('user_complaint')
                ->where('id', $data["id"])
                ->update($result);
    
            $re = new ReturnJson(["msg"=>"更新成功"]);
            return json($re->json);
        }
    }