<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/17 0017
 * Time: 下午 1:25
 */

namespace app\index\controller;


use think\Db;

class Add extends Base
{
    public function index()
    {
        return $this -> fetch();
    }
    public function add()
    {
        $map = [
            "owner" => $_REQUEST["owner"],
            "order_num" => $_REQUEST["order_num"],
            "time" => $_REQUEST["time"],
            "place" => $_REQUEST["place"],
            "state" => 0,
        ];

        $result = Db::table("case") -> insert($map);

        if ($result == 1){
            return $this -> redirect('index/index');
        }
    }
}