<?php
// +----------------------------------------------------------------------
// | ThinkCMF [ WE CAN DO IT MORE SIMPLE ]
// +----------------------------------------------------------------------
// | Copyright (c) 2013-2018 http://www.thinkcmf.com All rights reserved.
// +----------------------------------------------------------------------
// | Licensed ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------
// | Author: 张鹤麟
// +----------------------------------------------------------------------
namespace app\portal\api;

use app\portal\model\PortalPostModel;

class PostApi
{
    

    /**
     * 页面列表 用于导航选择
     * @return array
     */
    public function index()
    {
        $portalPostModel = new PortalPostModel();

        $where = [
            //'post_type'      => 2,
            'published_time' => [['< time', time()], ['> time', 0]],
            'post_status'    => 1,
            'delete_time'    => 0
        ];


        $pages = $portalPostModel->field('id,post_title AS name')->where($where)->select();
        return $pages;
    }

}