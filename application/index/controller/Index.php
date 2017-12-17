<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017/11/24 0024
 * Time: 上午 1:35
 */

namespace app\index\controller;

use think\Cookie;
use think\Db;

class Index extends Base
{
    public function index()
    {
        $case = Db::table("case") -> where("state", "in", ["0", "1", "2"]) -> paginate(10);
        $page = $case -> render();

        $this -> assign([
            "case" => $case,
            "page" => $page
        ]);

        return $this -> fetch();
    }
    public function appoint()
    {
        if (empty($_REQUEST["employee_id"])) {
            $case = Db::table("case") -> where("id", "=", $_REQUEST["case_id"]) -> select()[0];
            $employee = Db::table("employee") -> select();

            $this -> assign([
                "case"     => $case,
                "employee" => $employee
            ]);

            return $this -> fetch();
        } else {
            $employee = Db::table("employee") -> where("id", "=", $_REQUEST["employee_id"]) -> select()[0];
            $map = [
                "employee_id"   => $employee["id"],
                "employee_name" => $employee["name"],
                "state"         => 1
            ];

            $result = Db::table("case") -> where("id", "=", $_REQUEST["case_id"]) -> update($map);

            if ($result == 1) {
                return $this -> redirect('index/index');
            }
        }
    }
    public function damage()
    {
        if (empty($_REQUEST["amount"])) {
            $case = Db::table("case") -> where("id", "=", $_REQUEST["case_id"]) -> select()[0];
            $this -> assign([
                "case"     => $case,
            ]);

            return $this -> fetch();
        } else {
            $map = [
                "amount" => $_REQUEST["amount"],
                "state"  => 3
            ];

            $result = Db::table("case") -> where("id", "=", $_REQUEST["case_id"]) -> update($map);

            if ($result == 1) {
                return $this -> redirect('service/index');
            }
        }
    }
}