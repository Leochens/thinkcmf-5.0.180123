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
namespace app\portal\api;

use app\portal\model\PortalPostModel;

class TrendingApi
{
    
    public function index(
    {
        $portalPostModel = new PortalPostModel();

        $trendings =  $portalPostModel->where('status',1)->select();

        //返回的数据必须是数据集或数组,item里必须包括id,name,如果想表示层级关系请加上 parent_id
        //return $portalPostModel->field('id,post_title AS name')->where($where)->select();
        return $trendings;
        
    }

    

}