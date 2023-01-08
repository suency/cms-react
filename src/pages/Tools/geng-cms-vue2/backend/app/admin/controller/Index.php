<?php

namespace app\admin\controller;

use app\BaseController;
use app\admin\model\Student;
use app\admin\model\UserModel;
use app\utils\ReturnJson;
use \Exception;

use \Firebase\JWT\JWT; //导入JWT

class Index extends BaseController
{
    public function index()
    {
        return '<style type="text/css">*{ padding: 0; margin: 0; } div{ padding: 4px 48px;} a{color:#2E5CD5;cursor: pointer;text-decoration: none} a:hover{text-decoration:underline; } body{ background: #fff; font-family: "Century Gothic","Microsoft yahei"; color: #333;font-size:18px;} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.6em; font-size: 42px }</style><div style="padding: 24px 48px;"> <h1>:) </h1><p> ThinkPHP V6<br/><span style="font-size:30px">13载初心不改-admin - 你值得信赖的PHP框架</span></p></div><script type="text/javascript" src="https://tajs.qq.com/stats?sId=64890268" charset="UTF-8"></script><script type="text/javascript" src="https://e.topthink.com/Public/static/client.js"></script><think id="eab4b9f840753f8e7"></think>';
    }

    public function hello($name = 'ThinkPHP6')
    {
        return 'hello,' . $name;
    }

    public function hello3()
    {
        $re = UserModel::where('id', '<', 10)->select();

        $user = new Student();
        $data = ["name"=>"吊臂部"];
        $user->save($data);
        $re2 = Student::select();
        return $re2;
    }

    public function restErr(){
        $re = new ReturnJson(["msg"=>"token 错误","data"=>[]]);
        return json($re->json);
    }

    //签发Token
    public function lssue()
    {
        $key = '344'; //key
        $time = time(); //当前时间
               $token = [
            'iss' => 'http://www.helloweba.net', //签发者 可选
               'aud' => 'http://www.helloweba.net', //接收该JWT的一方，可选
               'iat' => $time, //签发时间
               'nbf' => $time , //(Not Before)：某个时间点后才能访问，比如设置time+30，表示当前时间30秒后才能使用
               'exp' => $time+20, //过期时间,这里设置2个小时
                'data' => [ //自定义信息，不要定义敏感信息
                     'userid' => 1,
                       'username' => '李小龙'
            ]
        ];
        echo JWT::encode($token, $key); //输出Token
    }

    public function verification()
    {
        $key = '344'; //key要和签发的时候一样

        $jwt = "1eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC93d3cuaGVsbG93ZWJhLm5ldCIsImF1ZCI6Imh0dHA6XC9cL3d3dy5oZWxsb3dlYmEubmV0IiwiaWF0IjoxNTc1NDc1MDU3LCJuYmYiOjE1NzU0NzUwNTcsImV4cCI6MTU3NTQ3NTA3NywiZGF0YSI6eyJ1c2VyaWQiOjEsInVzZXJuYW1lIjoiXHU2NzRlXHU1YzBmXHU5Zjk5In19.v-ITowNoeWIVkiN1Yi9SOzdROrVUKbOVrtbsNMfbmSw"; //签发的Token
        
        
        try {
            JWT::$leeway = 0;//当前时间减去60，把时间留点余地
            $decoded = JWT::decode($jwt, $key, ['HS256']); //HS256方式，这里要和签发的时候对应
            $arr = (array)$decoded;
            return json_encode($arr);

            
            } catch(\Firebase\JWT\SignatureInvalidException $e) {  //签名不正确
                echo $e->getMessage();
            }catch(\Firebase\JWT\BeforeValidException $e) {  // 签名在某个时间点之后才能用
                echo $e->getMessage();
            }catch(\Firebase\JWT\ExpiredException $e) {  // token过期
                //echo $e->getMessage();

                return json_encode(array("info"=>$e->getMessage()));
           }catch(\Firebase\JWT\MyException $e) {  //其他错误
            //dump($e);
            return json_encode(array("info"=>$e->getErrorInfo()));
            }catch(Exception $e) {  //其他错误
                    echo $e->getMessage();
                }
        //Firebase定义了多个 throw new，我们可以捕获多个catch来定义问题，catch加入自己的业务，比如token过期可以用当前Token刷新一个新Token
    }
}
