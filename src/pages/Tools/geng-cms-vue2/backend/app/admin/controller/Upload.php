<?php

namespace app\admin\controller;

use app\BaseController;
use think\Request;
use app\utils\ReturnJson;
use app\utils\RequestUrl;
use think\facade\Config;
use think\facade\Db;
use OSS\OssClient;
use OSS\Core\OssException;

class Upload extends BaseController
{
     


        /*
    * 图片上传，将图片上传至阿里云oss
    * */
    public function uploadFile(Request $request){

        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }
        // var_dump(11111111111);
        $file = request()->file('file');

        //$files = $_FILES['file'];
        //$name = $files['name'];
        //$format = strrchr($name, '.');//截取文件后缀名如 (.jpg)
        // 阿里云主账号AccessKey拥有所有API的访问权限，风险很高。强烈建议您创建并使用RAM账号进行API访问或日常运维，请登录RAM控制台创建RAM账号。
        $accessKeyId = "LTAI85s0C5Vs9D4B";
        $accessKeySecret = "0zqYsV2XjcYXy4F5V1XyrMAzyqvQvF";
        // Endpoint以杭州为例，其它Region请按实际情况填写。
        $endpoint = "http://oss-cn-beijing.aliyuncs.com";
        // 设置存储空间名称。
        $bucket= "socialdata";
        // 设置文件名称。
        //这里是由sha1加密生成文件名 之后连接上文件后缀，生成文件规则根据自己喜好，也可以用md5
        //前面video/head/ 这是我的oss目录
        //$object = 'banner/'.sha1(date('YmdHis', time()) . uniqid());
        $object = 'banner/'.$file->getOriginalName();
        // <yourLocalFile>由本地文件路径加文件名包括后缀组成，例如/users/local/myfile.txt。
        $filePath = $file->getPathname();
        try{
            $ossClient = new OssClient($accessKeyId, $accessKeySecret, $endpoint);

            $result = $ossClient->uploadFile($bucket, $object, $filePath);
            //https://picture.doctormeeting.com/banner
            if(!$result){
                $re2 = new ReturnJson(['status'=>1,'message'=>'上传失败']);
                return json($re2->json); 
                // return json(['status'=>1,'message'=>'上传失败']);
            }else{
                $re2 = new ReturnJson([
                    'status'=>2,
                    'message'=>'上传成功',
                    'url'=>$result['info']['url'],
                    'ossUrl' => 'https://picture.doctormeeting.com/banner/'.$file->getOriginalName()
                    ]);
                return json($re2->json); 
                //return json(['status'=>2,'message'=>'上传成功','url'=>$result['info']['url']]);
            }
        } catch(OssException $e) {
            printf(__FUNCTION__ . ": FAILED\n");
            printf($e->getMessage() . "\n");
            return;
        }
        print(__FUNCTION__ . ": OK" . "\n");
    }

}