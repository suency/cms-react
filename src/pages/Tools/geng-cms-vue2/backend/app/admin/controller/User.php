<?php

namespace app\admin\controller;

use app\BaseController;
use app\admin\model\UserModel;
use app\admin\model\RolesModel;
use think\Request;
use think\facade\Db;
use think\facade\Config;
use app\admin\validate\LoginValidate;
use think\exception\ValidateException;
use app\utils\ReturnJson;
use \Exception;

use Qiniu\Auth;
use Qiniu\Storage\UploadManager;

use \Firebase\JWT\JWT; //导入JWT

class User extends BaseController
{
    public function login(Request $request)
    {

        //如果是options请求，就结束执行下面语句
        if ($request->method() == 'OPTIONS') {
            return;
        }

        $info = [];
        $data = $request->post();
        // var_dump($data);
        try {
            validate(LoginValidate::class)->check($data);
            $password = UserModel::where('username', '=', $data['username'])->field('password')->find();
            if ($password && $data['password'] == $password->password) {
                $user = UserModel::where('username', '=', $data['username'])->find();
                $userid = $user->id;
                $username = $user->username;

                $token = $this->lssue($userid, $username);
                $user->token = $token; //保存token到数据库
                $user->save();

                $info = ["code" => 20000, "data" => ["status" => "OK", "msg" => "登陆成功2", "token" => $token]];
            } else {
                $info = ["code" => 60204, "message" => '账号或者密码不正确'];
            }

            return json($info);
        } catch (ValidateException $e) {

            $info = ["code" => 400, "data" => ["status" => "Bad", "msg" => $e->getError()]];
            return json($info);
        }
    }

    public function test()
    {
    }

    public function create(Request $request)
    {
        //如果是options请求，就结束执行下面语句
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }


        $user = new UserModel();

        $username = $request->param("username");
        $password = $request->param("password");
        $introduction = $request->param("introduction");
        $avatar = $request->param("avatar");
        $name = $request->param("name");
        $role = $request->param("role");

        $checkUser = UserModel::where("username", $username)->find();
        if ($checkUser) {
            $re = new ReturnJson(["msg" => "用户名已存在"], "fail");
            return json($re->json);
        }
        $releName = RolesModel::find($role)->name;

        $user->username = $username;
        $user->password = $password;
        $user->introduction = $introduction;
        $user->avatar = $avatar;
        $user->name = $name;
        $user->roles = $releName;

        $v = $user->save();

        // dump($request);

        //$query = Db::execute('admin_users')->where('id', 1)->find();
        if ($v) {
            $re = new ReturnJson(["msg" => "新增成功"]);
            return json($re->json);
        }
    }

    public function delete(Request $request)
    {
        //如果是options请求，就结束执行下面语句
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $id = $request->param("id");
        $user = UserModel::find($id);
        $v = $user->delete();

        if ($v) {
            $re = new ReturnJson(["msg" => "删除成功"]);
            return json($re->json);
        }
    }

    public function edit(Request $request)
    {
        //如果是options请求，就结束执行下面语句
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $username = $request->param("username");
        $password = $request->param("password");
        $introduction = $request->param("introduction");
        $avatar = $request->param("avatar");
        $name = $request->param("name");
        $role = $request->param("role");
        $id = $request->param("id");


        $user = UserModel::find($id);
        $checkUser = UserModel::where("username", $username)->find();

        if ($checkUser && $checkUser->id != $id) {
            $re = new ReturnJson(["msg" => "用户名已存在"], "fail");
            return json($re->json);
        }
        $releName = RolesModel::find($role)->name;

        $user->username = $username;
        $user->password = $password;
        $user->introduction = $introduction;
        $user->avatar = $avatar;
        $user->name = $name;
        $user->roles = $releName;

        $v = $user->save();

        // dump($request);

        //$query = Db::execute('admin_users')->where('id', 1)->find();
        if ($v) {
            $re = new ReturnJson(["msg" => "修改成功"]);
            return json($re->json);
        }
    }

    public function systemUsers(Request $request)
    {
        //如果是options请求，就结束执行下面语句
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }


        $query = UserModel::field("id,username,name,roles,introduction,avatar")->select();

        $re = new ReturnJson($query);
        return json($re->json);
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
        $ext = explode('.', $file->getOriginalName())[1];  //后缀
        // 上传到七牛后保存的文件名
        $key = substr(md5($file->getOriginalName()), 0, 5) . date('YmdHis') . rand(0, 9999) . '.' . $ext;
        // 初始化 UploadManager 对象并进行文件的上传。
        $uploadMgr = new UploadManager();
        // 调用 UploadManager 的 putFile 方法进行文件的上传。
        list($ret, $err) = $uploadMgr->putFile($token, $key, $filePath);
        if ($err !== null) {
            return json_encode(['ResultData' => '失败', 'info' => '失败']);
        } else {
            if ($ext == 'gif') {
                $info = [
                    'url' => $domain . '/' . $ret['key'],
                    'status' => '1'
                ];
            } else {
                $info = [
                    'url' => $domain . '/' . $ret['key'],
                    'status' => '1'
                ];
            }
        }

        $re = new ReturnJson($info);
        return json($re->json);
    }

    public function info(Request $request)
    {

        //如果是options请求，就结束执行下面语句
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        //中间件已经验证了token的正确性
        $userid = $request->userid;
        $username = $request->username;

        $info = [];
        if ($username) {
            $info = UserModel::where('id', '=', $userid)->find();
            $roles = explode(',', $info->roles);
            $info->roles = $roles;
            $info = ["code" => 20000, "data" => $info];
        } else {
            $info = ["code" => 20000, "data" => ["status" => "error"]];
        }

        return json($info);
    }

    public function logout(Request $request)
    {
        //如果是options请求，就结束执行下面语句
        if ($request->method() == 'OPTIONS') {
        }
        $info = ["code" => 20000, "data" => 'success'];
        return json($info);
    }


    //签发Token
    public function lssue($userid, $username)
    {
        //Config::get('app.JWT_timeout')
        $key = Config::get('app.JWT_key'); //key
        $time = time(); //当前时间
        $token = [
            'iss' => 'https://social.doctormeeting.com', //签发者 可选
            'aud' => 'https://social.doctormeeting.com', //接收该JWT的一方，可选
            'iat' => $time, //签发时间
            'nbf' => $time, //(Not Before)：某个时间点后才能访问，比如设置time+30，表示当前时间30秒后才能使用
            'exp' => $time + Config::get('app.JWT_timeout'), //过期时间,这里设置2个小时
            'data' => [ //自定义信息，不要定义敏感信息
                'userid' => $userid,
                'username' => $username,
                'endtime' => $time + Config::get('app.JWT_timeout')
            ]
        ];
        return JWT::encode($token, $key); //输出Token
    }
}
