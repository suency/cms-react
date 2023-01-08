<?php

namespace app\admin\controller;

use app\BaseController;
use think\Request;
use app\utils\ReturnJson;
use app\admin\model\TipModel;
use app\admin\model\TipdataModel;

use think\facade\Config;
use think\facade\Db;
use Qiniu\Auth;
use Qiniu\Storage\UploadManager;

class Tip extends BaseController
{
     
    public function getTip(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $tip = TipModel::find(1);
        $left = TipdataModel::sum('vote_left');
        $right = TipdataModel::sum('vote_right');

        $tip->leftVote = $left;
        $tip->rightVote = $right;

        // var_dump($tip);
        $re = new ReturnJson($tip);
        return json($re->json);
    }

    public function test(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $list = Db::table('topic_info')->paginate([
            'list_rows'=> 10,
            'page' => 2,
        ]);
        $re = new ReturnJson($list);
        return json($re->json);
    }

    public function changeVoteStatus(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $tip = TipModel::find(1);

        $stop = $request->param('stop');

        $tip->stop = $stop;
        $re = $tip->save();

        if($re){
            $v = new ReturnJson(["msg"=>"changed"]);
            return json($v->json);
        }
        
    }

    public function updateInfo(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        // var_dump($request->param('name'));
        $name = $request->param('name');

        $user = TipdataModel::where("voter",$name)->find();

        if($user){
            $re = new ReturnJson(["msg"=>"名字已存在"]);
            return json($re->json);
        }else{
            $voter = new TipdataModel();
            $voter->voter = $name;
            $v = $voter->save();

            if($v){
                $re = new ReturnJson(["msg"=>"new"]);
                return json($re->json);
            }
            
        }
        
    }

    public function voting(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $tip = TipModel::find(1)->stop;

        if($tip=='1'){
            $re = new ReturnJson(["msg"=>"暂停投票"],"fail");
            return json($re->json);
        }
        //var_dump($request->param('support'));
        //var_dump($request->param('name'));
        $name = $request->param('name');
        $support = $request->param('support');

        $user = TipdataModel::where("voter",$name)->find();
        if($user){
            if($support=="0"){
                $user->vote_left = '1';
                $user->vote_right = '0';
            }else{
                $user->vote_left = '0';
                $user->vote_right = '1';
            }

            $v = $user->save();

            if($v){
                $re = new ReturnJson(["msg"=>"投票成功"]);
                return json($re->json);
            }

        }else{
            $re = new ReturnJson(["msg"=>"网络繁忙"]);
            return json($re->json);
        }

        
        
    }

    public function updateTip(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $tip = TipModel::find(1);

        $tip->left_name = $request->param('left_name');
        $tip->middle_name = $request->param('middle_name');
        $tip->right_name = $request->param('right_name');
        $tip->left_color = $request->param('left_color');
        $tip->right_color = $request->param('right_color');
        $tip->url = $request->param('url');


        $rest = $tip->save();

        $tip2 = TipModel::find(1);

        $re = new ReturnJson($tip2);
        return json($re->json);
    }

    public function deleteVote(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $v = Db::table('admin_tip_data')->where("1=1")->delete();

        if($v){
            $re = new ReturnJson(["msg"=>"删除成功"]);
            return json($re->json);
        }
        
    }

    public function uploadPhoto(Request $request)
    {
        
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $file = request()->file('file');
        
        /* print_r($file->getOriginalName());
        dump($file);die; */

        $config = Config::get('qiniu');
        // print_r($config);die;
        // 需要填写你的 Access Key 和 Secret Key
        $accessKey = $config['accessKey'];
        $secretKey = $config['secretKey'];
        // 构建鉴权对象
        $auth = new Auth($accessKey, $secretKey);
        // 要上传的空间
        $bucket = $config['bucket'];
        //图片域名
        $domain = $config['domain'];
        // 生成上传 Token
        $token = $auth->uploadToken($bucket);

        // 要上传文件的本地路径
        $filePath = $file->getPathname();
        // 上传到七牛后保存的文件名
        $ext = explode('.',$file->getOriginalName())[1];  //后缀
        // 上传到七牛后保存的文件名
        $key =substr(md5($file->getOriginalName()) , 0, 5). date('YmdHis') . rand(0, 9999) . '.' . $ext;
        // 初始化 UploadManager 对象并进行文件的上传。
        $uploadMgr = new UploadManager();
        // 调用 UploadManager 的 putFile 方法进行文件的上传。
        list($ret, $err) = $uploadMgr->putFile($token, $key, $filePath);
        if ($err !== null) {
            return json_encode(['ResultData'=>'失败','info'=>'失败']);
        } else {
            if ($ext == 'gif') {
                $info = [
                    'url'=>$domain.'/'.$ret['key'],
                    'status'=>'1'
                ];
            }else{
                $info = [
                    'url'=>$domain.'/'.$ret['key'],
                    'status'=>'1'
                ];
            }
        }

        $re = new ReturnJson($info);
        return json($re->json);
    }
}