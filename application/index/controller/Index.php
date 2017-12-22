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
        $grade = Cookie::get("grade");
        if ($grade == 1) {
            return $this -> redirect('add/index');
        } else {
            $case = Db::table("case") -> where("state", "in", ["0", "1", "2"]) -> paginate(10);
            $page = $case -> render();

            $this -> assign([
                "case"  => $case,
                "page"  => $page,
            ]);

            return $this -> fetch();
        }

    }
    public function appoint()
    {
        $case = Db::table("case") -> where("id", "=", $_REQUEST["case_id"]) -> select()[0];
        $employee = Db::table("employee") -> select();

        $this -> assign([
            "case"     => $case,
            "employee" => $employee
        ]);

        return $this -> fetch();

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
    public function appointEmp() {
        $employee_id   = [];
        $employee_name = [];

        foreach ($_REQUEST["employee_id"] as $index => $item) {
            array_push($employee_id, $index);
            array_push($employee_name, $item);
        }
        $map = [
            "employee_id"   => join(',', $employee_id),
            "employee_name" => join(',', $employee_name),
            "state"         => 1
        ];
//
        $resultEmp = Db::table("case") -> where("id", "=", $_REQUEST["case_id"]) -> update($map);
        $resultSpe = Db::table("speed") -> insert([
            "time"    => date("Y:m:d h:s"),
            "case_id" => $_REQUEST["case_id"],
            "intro"   => "已经指派" . join(',', $employee_name) . "定损员前往定损"
        ]);
        if ($resultEmp == 1 && $resultSpe == 1) {
            return $this -> redirect('index/index');
        }
    }
    public function close()
    {

    }
}