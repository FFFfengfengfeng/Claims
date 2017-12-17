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
}