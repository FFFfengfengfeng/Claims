<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/17 0017
 * Time: 下午 1:25
 */

namespace app\index\controller;


use think\Cookie;
use think\Db;

class Add extends Base
{
    public function index()
    {
        $order = Db::table("order") -> where("user_id", "=", Cookie::get("uid")) -> select();

        $this -> assign([
            "order" => $order
        ]);

        return $this -> fetch();
    }
    public function add()
    {
        $map = [
            "owner"      => $_REQUEST["owner"],
            "time"       => $_REQUEST["time"],
            "place"      => $_REQUEST["place"],
            "state"      => 0,
            "order_cate" => $_REQUEST["order_cate"],
            "order_item" => $_REQUEST["order_item"],
            "user_id"    => Cookie::get("uid"),
        ];

        $order_num = Db::table("order") -> where("id", "=", $_REQUEST["order_num"]) -> select()[0]["order_num"];
        $map["order_num"] = $order_num;
        $case_id = Db::table("case") -> insertGetId($map);

        $time = $_REQUEST["time"];
        $result = Db::table("speed") -> insert([
            "time" => $time,
            "case_id" => $case_id,
            "intro" => "用户" . Cookie::get("name") . "于" . $time . "报案<br/>" . "报案地址" . $_REQUEST["place"]
        ]);

        if ($result == 1){
            return $this -> redirect('speed/index');
        }
    }
}