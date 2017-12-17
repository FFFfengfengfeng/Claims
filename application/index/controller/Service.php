<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/12/17 0017
 * Time: 下午 12:51
 */

namespace app\index\controller;


use think\Db;

class Service extends Base
{
    public function index()
    {
        $case = Db::table("case") -> where("state", "in", ["3", "4", "5"]) -> paginate(10);
        $page = $case -> render();

        $this -> assign([
            "case" => $case,
            "page" => $page
        ]);
        return $this -> fetch();
    }
    public function check()
    {
        if (empty($_REQUEST["pass"])) {
            $case = Db::table("case") -> where("id", "=", $_REQUEST["case_id"]) -> select()[0];

            $this -> assign([
                "case" => $case
            ]);
            return $this -> fetch();
        } else {
            $result = Db::table("case") -> where("id", "=", $_REQUEST["case_id"]) -> update(["state" => "4"]);

            if ($result == 1) {
                return $this -> redirect('service/index');
            }
        }

    }
    public function confirm()
    {
        if (empty($_REQUEST["pass"])) {
            $case = Db::table("case") -> where("id", "=", $_REQUEST["case_id"]) -> select()[0];

            $this -> assign([
                "case" => $case
            ]);
            return $this -> fetch();
        } else {
            $result = Db::table("case") -> where("id", "=", $_REQUEST["case_id"]) -> update(["state" => "5"]);

            if ($result == 1) {
                return $this -> redirect('service/index');
            }
        }
    }
    public function close()
    {
        if (empty($_REQUEST["pass"])) {
            $case = Db::table("case") -> where("id", "=", $_REQUEST["case_id"]) -> select()[0];

            $this -> assign([
                "case" => $case
            ]);
            return $this -> fetch();
        } else {
            $result = Db::table("case") -> where("id", "=", $_REQUEST["case_id"]) -> update(["state" => "6"]);

            if ($result == 1) {
                return $this -> redirect('later/index');
            }
        }
    }
}