<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-12-21
 * Time: 15:21
 */

namespace app\index\controller;


use think\Cookie;
use think\Db;

class Speed extends Base
{
    public function index()
    {
        $case = Db::table("case") -> where("user_id", "=", Cookie::get("uid")) -> paginate(5);
        $page = $case -> render();

        $this -> assign([
            "case" => $case,
            "page" => $page
        ]);

        return $this -> fetch();
    }
    public function detail()
    {
        $case_id = $_REQUEST["case_id"];

        $speed = Db::table("speed") -> where("case_id", "=", $case_id) -> select();

        $this -> assign([
            "speed" => $speed
        ]);

        return $this -> fetch();
    }
}