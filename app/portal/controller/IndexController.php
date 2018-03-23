<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: Leochens
// +----------------------------------------------------------------------
namespace app\portal\controller;

use cmf\controller\HomeBaseController;
use app\portal\model\PortalPostModel;
class IndexController extends HomeBaseController
{
    public function index()
    {
        
        return $this->fetch(':index');
    }

    public function trending()
    {
        $portalPostModel = new PortalPostModel();


     
        $tdd = $portalPostModel->where('status', 1)->select();
        if (empty($tdd)) {
            abort(404, '未找到trending!');
        }
      
        $this->assign([
            'la'=>'热烈鼓掌！！',
            'zhl2'=>'张鹤麟'
        ]);


        return $this->fetch('/trending');
    }
}
