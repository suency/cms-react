<?php

namespace app\vote\controller;

use app\BaseController;
use app\utils\ReturnJson;

class VoteInfo extends BaseController
{
    public function getName()
    {
        $re = new ReturnJson(["mgs" => "duoduo"]);
        return json_encode($re->json);
    }
}
