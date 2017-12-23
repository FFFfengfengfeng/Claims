<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/17 0017
 * Time: 下午 1:21
 */

namespace app\index\controller;


use think\Db;

class Later extends Base
{
    public function index()
    {
        $case = Db::table("case") -> where("state", "=", "6") -> paginate(10);
        $page = $case -> render();

        $this -> assign([
            "case" => $case,
            "page" => $page
        ]);
        return $this -> fetch();
    }
    public function follow()
    {
        $case_id = $_REQUEST["case_id"];

        $case       = Db::table("case") -> where("id", "=", $case_id) -> select()[0];
        $order_num  = $case["order_num"];
        $user_phone = Db::table("order") -> where("order_num", "=", $order_num) -> select()[0]["user_phone"];
        $employee   = Db::table("employee") -> select();

        $this -> assign([
            "case"       => $case,
            "employee"   => $employee,
            "user_phone" => $user_phone,
        ]);
        return $this -> fetch();
    }
}