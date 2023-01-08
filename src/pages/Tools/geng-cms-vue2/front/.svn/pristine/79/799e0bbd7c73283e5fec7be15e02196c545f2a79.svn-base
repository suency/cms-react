
export function getPhpT(options) {
  let controller = options.controller
  controller = controller.charAt(0).toUpperCase() + controller.slice(1)
  return (
    `<?php

    namespace app\\${options.app}\\controller;
    
    use app\\BaseController;
    use think\\Request;
    use app\\utils\\ReturnJson;
    use app\\utils\\RequestUrl;
    use think\\facade\\Config;
    use think\\facade\\Db;
    
    class ${controller} extends BaseController
    {
         
        public function get_${options.name}(Request $request)
        {
            if ($request->method() == 'OPTIONS') {
                exit('options类型的请求，结束');
            }
            
            $keyword = $request->post()["keyword"];
            $bannerList = Db::table('${options.name}')->where("1=1")
                ->where('id','like','%'.$keyword.'%')
                ->whereOr('id','like','%'.$keyword.'%')
                ->paginate([
                    'list_rows' => $request->post()["pageSize"],
                    'page' => $request->post()["currentPage"]
                ]);

            $re = new ReturnJson($bannerList);
            return json($re->json);
        }
    
        public function update_${options.name}(Request $request)
        {
            if ($request->method() == 'OPTIONS') {
                exit('options类型的请求，结束');
            }
    
            $data = $request->post();
            $result = $data;
            unset($result['id']);
            Db::table('${options.name}')
                ->where('id', $data["id"])
                ->update($result);
    
            $re = new ReturnJson(["msg"=>"更新成功"]);
            return json($re->json);
        }
    }`)
}

