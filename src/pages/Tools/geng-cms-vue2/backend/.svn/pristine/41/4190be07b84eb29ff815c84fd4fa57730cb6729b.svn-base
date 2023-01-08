<?php
namespace app\admin\validate;

use think\Validate;

class LoginValidate extends Validate
{
    protected $rule = [
        'username'  =>  'require|max:25',
        'password' =>  'require|max:25',
    ];

    protected $message  =   [
        'username.require' => '用户名不能为空',
        'username.max'     => '用户名最多不能超过25个字符',
        'password.require' => '密码不能为空',
        'password.max'     => '用户名最多不能超过25个字符',
    ];

}