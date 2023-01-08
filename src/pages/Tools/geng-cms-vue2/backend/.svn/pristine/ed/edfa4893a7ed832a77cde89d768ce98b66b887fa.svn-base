<?php

namespace app\admin\middleware;

use think\facade\Config;
use \Exception;
use \Firebase\JWT\JWT; //导入JWT
use app\utils\ReturnJson;

class CheckToken
{
    public function handle($request, \Closure $next)
    {
        if ($request->method() == 'OPTIONS') {
            return $next($request);
        }
        // echo 111111;
        // var_dump($request->server('REQUEST_URI'));
        // return $next($request);
        // 设置白名单，不通过token解析，直接进入控制器，数组项代表控制器名字
        // \/ 表示斜杠的转义，tip\/表示tip下面所有方法都可以通过
        // user\/login，表示只有user/login 这个方法可以通过

        $whiteList = ["tip\/","user\/login"];
        $temp = implode("|",$whiteList);
        $pattern = "/^\/admin\/".$temp.".*/";
        preg_match($pattern, $request->server('REQUEST_URI'), $matches);

        if ($matches
            /* $request->server('REQUEST_URI') == '/user/login' || 
            $request->server('REQUEST_URI') == '/tip/getTip' || 
            $request->server('REQUEST_URI') == '/tip/uploadPhoto' ||
            $request->server('REQUEST_URI') == '/tip/updateInfo' ||
            $request->server('REQUEST_URI') == '/tip/voting' ||
            $request->server('REQUEST_URI') == '/tip/deleteVote' ||
            $request->server('REQUEST_URI') == '/tip/test' */
            ) {
            return $next($request);
        } else {
            $jwt = $request->header('x-token');
            $jwt_info = $this->JWT_verification($jwt);

            // 解析正确
            if (!array_key_exists('status', $jwt_info)) {
                $request->userid = $jwt_info['data']->userid;
                $request->username = $jwt_info['data']->username;
                return $next($request);
            } else {
                // 解析错误
                $request->jwt_token = 'error';

                header('Access-Control-Allow-Origin:*');
                // 响应类型  
                header('Access-Control-Allow-Methods:*');
                // 响应头设置  
                header('Access-Control-Allow-Headers:*');
                //header('Access-Control-Allow-Headers:x-requested-with,content-type');   
                //允许ajax异步请求带cookie信息
                header('Access-Control-Allow-Credentials:true');

                $re = new ReturnJson(["info"=>$jwt_info],"fail");
                return json($re->json);
   
            }

        }
    }

    private function JWT_verification($jwt)
    {
        $key = Config::get('app.JWT_key'); //key要和签发的时候一样

        //$jwt = "1eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC93d3cuaGVsbG93ZWJhLm5ldCIsImF1ZCI6Imh0dHA6XC9cL3d3dy5oZWxsb3dlYmEubmV0IiwiaWF0IjoxNTc1NDc1MDU3LCJuYmYiOjE1NzU0NzUwNTcsImV4cCI6MTU3NTQ3NTA3NywiZGF0YSI6eyJ1c2VyaWQiOjEsInVzZXJuYW1lIjoiXHU2NzRlXHU1YzBmXHU5Zjk5In19.v-ITowNoeWIVkiN1Yi9SOzdROrVUKbOVrtbsNMfbmSw"; //签发的Token


        try {
            JWT::$leeway = 0; //当前时间减去60，把时间留点余地
            $decoded = JWT::decode($jwt, $key, ['HS256']); //HS256方式，这里要和签发的时候对应
            $arr = (array) $decoded;
            return $arr;
        } catch (\Firebase\JWT\SignatureInvalidException $e) {  //签名不正确
            return array("msg" => $e->getMessage(), "status" => "error");
        } catch (\Firebase\JWT\BeforeValidException $e) {  // 签名在某个时间点之后才能用
            return array("msg" => $e->getMessage(), "status" => "error");
        } catch (\Firebase\JWT\ExpiredException $e) {  // token过期
            //echo $e->getMessage();

            return array("msg" => $e->getMessage(), "status" => "error");
        } catch (\Firebase\JWT\MyException $e) {  //其他错误
            //dump($e);
            return array("msg" => $e->getErrorInfo(), "status" => "error");
        } catch (Exception $e) {  //其他错误
            return array("msg" => $e->getMessage(), "status" => "error");
        }
        //Firebase定义了多个 throw new，我们可以捕获多个catch来定义问题，catch加入自己的业务，比如token过期可以用当前Token刷新一个新Token
    }
}
