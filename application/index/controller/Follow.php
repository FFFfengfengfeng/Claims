<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-12-23
 * Time: 11:58
 */

namespace app\index\controller;


use think\Db;

class Follow extends Base
{
    public function index()
    {
        $follow = Db::table("follow") -> paginate(10);
        $page   = $follow -> render();

        $this -> assign([
            "follow" => $follow,
            "page"   => $page
        ]);
        return $this -> fetch();
    }
    public function people()
    {
        $employee_id = $_REQUEST["follow_name"];
        $case_id     = $_REQUEST["case_id"];

        $employee = Db::table("employee") -> where("id", "=", $employee_id) -> select()[0];
        $case     = Db::table("case") -> where("id", "=", $case_id) -> select()[0];
        $order    = Db::table("order") -> where("order_num", "=", $case["order_num"]) -> select()[0];
        $time     = date("Y:m:d H:i:s");
        $map = [
            "order_num"    => $case["order_num"],
            "user_name"    => $case["owner"],
            "user_phone"   => $order["user_phone"],
            "follow_name"  => $employee["name"],
            "follow_phone" => $employee["phone"],
            "time"         => $time
        ];

        $resultFol = Db::table("follow") -> insert($map);
        $resultSpe = Db::table("speed") -> insert([
            "time" => $time,
            "case_id" => $case_id,
            "intro" => "已经指派" . $employee["name"] . "进行后期跟进," . "联系电话" . $employee["phone"] . "."
        ]);
        if ($resultFol == 1 && $resultSpe == 1) {
            return $this -> redirect("follow/index");
        }
    }
}