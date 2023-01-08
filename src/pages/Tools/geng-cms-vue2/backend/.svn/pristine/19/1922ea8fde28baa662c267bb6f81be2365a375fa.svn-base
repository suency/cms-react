<?php

namespace app\admin\controller;

use app\BaseController;
use app\admin\model\UserModel;
use think\Request;
use app\admin\validate\LoginValidate;
use think\exception\ValidateException;

use \Firebase\JWT\JWT; //导入JWT

class Article extends BaseController
{

    public $info = '{
        "code": 20000,
        "data": {
            "total": 100,
            "items": [
                {
                    "id": 1,
                    "timestamp": 74904608731,
                    "author": "Linda-suency",
                    "reviewer": "Jason",
                    "title": "Blordyyu Lgjhoxxjm Fvugmwyrn Lpgqjuc Tcrasn",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 68.43,
                    "importance": 1,
                    "type": "JP",
                    "status": "draft",
                    "display_time": "1989-01-16 17:13:25",
                    "comment_disabled": true,
                    "pageviews": 820,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 2,
                    "timestamp": 235166114861,
                    "author": "Frank",
                    "reviewer": "Patricia",
                    "title": "Hqo Ikjhrehyb Jxrtst Nghqj Adrhjdi",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 64.64,
                    "importance": 2,
                    "type": "US",
                    "status": "draft",
                    "display_time": "2016-04-26 06:28:02",
                    "comment_disabled": true,
                    "pageviews": 4536,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 3,
                    "timestamp": 48907727618,
                    "author": "Nancy",
                    "reviewer": "Kenneth",
                    "title": "Ixugcrvar Mskfm Sknpeqp Advwfmnbt Cyewtrj Ldfe Zxmbbsbjy Gezruhkowk",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 75.19,
                    "importance": 3,
                    "type": "US",
                    "status": "draft",
                    "display_time": "1982-03-02 19:06:25",
                    "comment_disabled": true,
                    "pageviews": 973,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 4,
                    "timestamp": 1199301675591,
                    "author": "Joseph",
                    "reviewer": "Kimberly",
                    "title": "Qljtebt Ebbyhppwej Yudpunygn Idbrmqm Lqygzmhmc",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 49.21,
                    "importance": 2,
                    "type": "US",
                    "status": "deleted",
                    "display_time": "2008-08-02 11:27:24",
                    "comment_disabled": true,
                    "pageviews": 3582,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 5,
                    "timestamp": 271463526484,
                    "author": "Patricia",
                    "reviewer": "Jason",
                    "title": "Gpktkyge Usbs Qneilppt Lwvrrigna Kueljnyp Rmqwsplqgd",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 12.87,
                    "importance": 2,
                    "type": "CN",
                    "status": "draft",
                    "display_time": "1988-05-01 02:28:45",
                    "comment_disabled": true,
                    "pageviews": 2591,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 6,
                    "timestamp": 142251527547,
                    "author": "Dorothy",
                    "reviewer": "Richard",
                    "title": "Ihcy Xnbxc Opdvecbhy Lgkk Jknixyuz Fcob",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 75.56,
                    "importance": 1,
                    "type": "CN",
                    "status": "draft",
                    "display_time": "2003-07-13 12:32:13",
                    "comment_disabled": true,
                    "pageviews": 3451,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 7,
                    "timestamp": 333618670704,
                    "author": "Brian",
                    "reviewer": "Cynthia",
                    "title": "Iaioqp Vaxfbnqf Ienhjxx Fmevltiwq Okfxqdivd Gvqybdrero Cyeqyp Clzqi Kkzolu",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 19.42,
                    "importance": 2,
                    "type": "US",
                    "status": "deleted",
                    "display_time": "1996-01-26 00:09:02",
                    "comment_disabled": true,
                    "pageviews": 665,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 8,
                    "timestamp": 513090710323,
                    "author": "James",
                    "reviewer": "Christopher",
                    "title": "Tkda Juxysp Pbwxmiqnki Skv Tohk Clf Ssrzuk Ttmexetdj Kivohd",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 33.23,
                    "importance": 3,
                    "type": "US",
                    "status": "deleted",
                    "display_time": "2001-10-31 13:26:15",
                    "comment_disabled": true,
                    "pageviews": 4038,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 9,
                    "timestamp": 1304451972127,
                    "author": "Laura",
                    "reviewer": "David",
                    "title": "Xjhx Mderg Vvxq Uxgdjgg Lkbkixk Qsui Jywvduttx Bgocvfkhi Tengi",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 31.88,
                    "importance": 2,
                    "type": "CN",
                    "status": "published",
                    "display_time": "1980-02-06 10:03:32",
                    "comment_disabled": true,
                    "pageviews": 1871,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 10,
                    "timestamp": 541191333441,
                    "author": "Margaret",
                    "reviewer": "Dorothy",
                    "title": "Xfwjvintde Kkjyiqnfpd Uclsgyy Rmbufzrccj Hjlwv Wkkvtqnqb Lwsxhzvqi",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 55.94,
                    "importance": 3,
                    "type": "JP",
                    "status": "draft",
                    "display_time": "1999-05-12 11:00:15",
                    "comment_disabled": true,
                    "pageviews": 2935,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 11,
                    "timestamp": 467631986684,
                    "author": "Kimberly",
                    "reviewer": "Jason",
                    "title": "Rksop Jftczs Xwpgkx Byrrjo Jxsxy Stjklmrs Wqtthk",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 57.57,
                    "importance": 3,
                    "type": "JP",
                    "status": "draft",
                    "display_time": "2008-01-13 19:17:07",
                    "comment_disabled": true,
                    "pageviews": 1015,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 12,
                    "timestamp": 393832471376,
                    "author": "Kenneth",
                    "reviewer": "Shirley",
                    "title": "Fjkyp Wycgxh Aebhvo Yosatgyu Jerjvew Jqkymuli Yogsg Dsunw Pjcfwfpvdj Sma",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 97.56,
                    "importance": 2,
                    "type": "EU",
                    "status": "draft",
                    "display_time": "2016-10-04 15:49:10",
                    "comment_disabled": true,
                    "pageviews": 3548,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 13,
                    "timestamp": 1311180425707,
                    "author": "Steven",
                    "reviewer": "Eric",
                    "title": "Qxilb Twtqbvp Ynedhkn Evkjpsvhx Shil Qcqtk Sveynlout Mtzwxvsrvp",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 78.19,
                    "importance": 3,
                    "type": "CN",
                    "status": "deleted",
                    "display_time": "1986-02-04 00:35:32",
                    "comment_disabled": true,
                    "pageviews": 3665,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 14,
                    "timestamp": 1244927367397,
                    "author": "Donna",
                    "reviewer": "Steven",
                    "title": "Hhgtcbbho Kuucnymg Yhhitrka Bedjwj Jgjjnbl Sxmucccn Fmqcbnu Wqmf Ygou",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 60.59,
                    "importance": 3,
                    "type": "JP",
                    "status": "published",
                    "display_time": "2009-04-02 15:23:15",
                    "comment_disabled": true,
                    "pageviews": 2949,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 15,
                    "timestamp": 205559883866,
                    "author": "Charles",
                    "reviewer": "Jessica",
                    "title": "Sflsrudxx Yiwusfi Tovwqwspdv Wmysotch Cijqikkpmi Qqnibmqk Wqyuorkxy Nexuwur Hfme",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 75.35,
                    "importance": 1,
                    "type": "JP",
                    "status": "draft",
                    "display_time": "1992-05-20 12:32:51",
                    "comment_disabled": true,
                    "pageviews": 2342,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 16,
                    "timestamp": 377624368741,
                    "author": "Elizabeth",
                    "reviewer": "Edward",
                    "title": "Hftuu Yiiybd Ckms Hpbuu Devpqu Skldsqrb",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 24.57,
                    "importance": 3,
                    "type": "JP",
                    "status": "draft",
                    "display_time": "2015-04-22 20:55:48",
                    "comment_disabled": true,
                    "pageviews": 4748,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 17,
                    "timestamp": 649104418334,
                    "author": "Jessica",
                    "reviewer": "Donna",
                    "title": "Rihcka Stsh Pcgxu Jrman Uixdgaff Tnvvo",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 15.07,
                    "importance": 3,
                    "type": "US",
                    "status": "published",
                    "display_time": "2012-12-13 03:30:12",
                    "comment_disabled": true,
                    "pageviews": 2604,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 18,
                    "timestamp": 597096492559,
                    "author": "Carol",
                    "reviewer": "Nancy",
                    "title": "Aexoy Zjsve Ugneqorkn Yhynzb Uhitmn Etehrzhs",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 40.03,
                    "importance": 2,
                    "type": "JP",
                    "status": "draft",
                    "display_time": "1971-03-01 11:43:30",
                    "comment_disabled": true,
                    "pageviews": 556,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 19,
                    "timestamp": 394824898159,
                    "author": "Sharon",
                    "reviewer": "David",
                    "title": "Fcvvh Hfb Htwimy Imgf Xumcjrw Kgcoco Vjrix Kmdpjjy",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 92.87,
                    "importance": 2,
                    "type": "EU",
                    "status": "deleted",
                    "display_time": "2007-04-06 18:44:31",
                    "comment_disabled": true,
                    "pageviews": 738,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                },
                {
                    "id": 20,
                    "timestamp": 515412801756,
                    "author": "George",
                    "reviewer": "Timothy",
                    "title": "Hhvo Nvyvr Sqjel Beztbm Vjdnqx Wkwhwl",
                    "content_short": "mock data",
                    "content": "<p>I am testing data, I am testing data.</p><p><img src=\"https://wpimg.wallstcn.com/4c69009c-0fd4-4153-b112-6cb53d1cf943\"></p>",
                    "forecast": 79.93,
                    "importance": 2,
                    "type": "US",
                    "status": "published",
                    "display_time": "1997-01-13 06:30:33",
                    "comment_disabled": true,
                    "pageviews": 2688,
                    "image_uri": "https://wpimg.wallstcn.com/e4558086-631c-425c-9430-56ffb46e70b3",
                    "platforms": [
                        "a-platform"
                    ]
                }
            ]
        }
    }';

    /* public function __construct(Request $request)
    {
		$this->request = $request;
    } */

    public function list(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        //$token = $request->header('x-token');
        return json(json_decode($this->info));
    }

    public function create(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $info = ["code"=>20000,"data"=>"success"];
        return json(json_decode($info));
    }

    public function update(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $info = ["code"=>20000,"data"=>"success"];
        return json(json_decode($info));
    }

    public function pv(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $info = '{
            "code": 20000,
            "data": {
              "pvData": [
                { "key": "PC", "pv": 1024 },
                { "key": "mobile", "pv": 1024 },
                { "key": "ios", "pv": 1024 },
                { "key": "android", "pv": 1024 }
              ]
            }
          }';

        return json(json_decode($info));
    }

    public function detail(Request $request)
    {
        if ($request->method() == 'OPTIONS') {
            exit('options类型的请求，结束');
        }

        $arr = json_decode($this->info);
        $id = $request->param('id');
        $filter = '';
        //print_r($arr->data->items);
        foreach ($arr->data->items as $key => $value) {
            if ($value->id == $id) {
                $filter = $value;
            }
        }
        $re = ["code" => 20000, "data" => $filter];

        return json($re);
    }
}
