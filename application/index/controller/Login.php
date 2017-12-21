<?php
/**
 * Created by PhpStorm.
 * User: Administrator
 * Date: 2017-11-24
 * Time: 9:39
 */

namespace app\index\controller;
use think\Controller;
use think\Cookie;
use think\Db;

class Login extends Controller
{
    public function index()
    {
        $this->view->engine->layout(false);
        return $this -> fetch('index');
    }
    public function login()
    {
        $map['name'] = $_POST["user_name"];
        $result = Db::table("user") -> where($map) -> select();
        $success = "0";
        $message = "获取失败";
        $data = null;
        if (empty($result)) {
            $message = "没有该用户";
        } else if ($_POST["user_password"] != $result[0]["password"]) {
            $message = "密码错误";
        } else {
            $uid     = $result[0]["id"];
            $name    = $result[0]["name"];
            $grade   = $result[0]["grade"];
            $success = "1";
            $message = "获取成功";
            Cookie::set('uid', $uid, 7200);
            Cookie::set('name', $name, 7200);
            Cookie::set('grade', $grade, 7200);
        }
        $json = array("success" => $success, "message" => $message, "data" => $data);

        return json($json);

    }
    public function out() {
        Cookie::delete("uid");

        $this -> redirect('index');
    }
    public function register() {
        $name = $_POST["user_name"];
        $user = Db::table("user") -> where("name", "=", $name) -> select();

        $map = [
            "name"     => $_POST["user_name"],
            "grade"    => 1,
            "password" => $_POST["user_password"]
        ];
        $success = "0";
        $message = "注册失败";
        if (empty($user)) {
            $result = Db::table("user") -> insert($map);
            if ($result === 1) {
                $success = "1";
                $message = "注册成功,请登录";
            }
        } else {
            $message = "注册失败,用户名存在";
        }
        $json = array("success" => $success, "message" => $message);

        return json($json);
    }
}