<?php

declare(strict_types=1);

namespace app;

use think\App;
use think\exception\ValidateException;
use think\Validate;

use app\utils\ReturnJson;
use think\facade\Config;
use \Exception;
use \Firebase\JWT\JWT; //导入JWT

/**
 * 控制器基础类
 */
abstract class BaseController
{
    /**
     * Request实例
     * @var \think\Request
     */
    protected $request;

    /**
     * 应用实例
     * @var \think\App
     */
    protected $app;

    /**
     * 是否批量验证
     * @var bool
     */
    protected $batchValidate = false;

    /**
     * 控制器中间件
     * @var array
     */
    protected $middleware = [];

    /**
     * 构造方法
     * @access public
     * @param  App  $app  应用对象
     */
    public function __construct(App $app)
    {
        $this->app     = $app;
        $this->request = $this->app->request;

        // 控制器初始化
        $this->initialize();
    
    }


    // 没有启用这个 已经在中间件里面处理
    public function checkResolvedToken(){
        $userid = $this->request->userid;
        $username = $this->request->username;
        if (!$username){
            return false;
        }else {return true;}
    }

    // 初始化
    protected function initialize()
    {
        //访问XMLHttpRequest已被CORS政策阻止
        //header("Access-Control-Allow-Origin: *");
        // 指定允许其他域名访问  
        header('Access-Control-Allow-Origin:*');
        // 响应类型  
        header('Access-Control-Allow-Methods:*');
        // 响应头设置  
        header('Access-Control-Allow-Headers:*');
        //header('Access-Control-Allow-Headers:x-requested-with,content-type');   
        //允许ajax异步请求带cookie信息
        header('Access-Control-Allow-Credentials:true');
    }

    /**
     * 验证数据
     * @access protected
     * @param  array        $data     数据
     * @param  string|array $validate 验证器名或者验证规则数组
     * @param  array        $message  提示信息
     * @param  bool         $batch    是否批量验证
     * @return array|string|true
     * @throws ValidateException
     */
    protected function validate(array $data, $validate, array $message = [], bool $batch = false)
    {
        if (is_array($validate)) {
            $v = new Validate();
            $v->rule($validate);
        } else {
            if (strpos($validate, '.')) {
                // 支持场景
                list($validate, $scene) = explode('.', $validate);
            }
            $class = false !== strpos($validate, '\\') ? $validate : $this->app->parseClass('validate', $validate);
            $v     = new $class();
            if (!empty($scene)) {
                $v->scene($scene);
            }
        }

        $v->message($message);

        // 是否批量验证
        if ($batch || $this->batchValidate) {
            $v->batch(true);
        }

        return $v->failException(true)->check($data);
    }

    protected function JWT_verification($jwt)
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
