<?php

namespace app\manage\controller;

use think\Controller;
use app\manage\model\Manager;
use think\Cookie;
use think\Session;
use think\response\Json;

class Login extends Controller
{

    //处理记住密码的方法
    private function handleRemember($remember, $name, $password)
    {
        if ($remember == "true") {
            Cookie::set('manager_name', $name, 60 * 60 * 24 * 7);
            Cookie::set('manager_password', $password, 60 * 60 * 24 * 7);
        } else {
            Cookie::delete('manager_name');
            Cookie::delete('manager_password');
        }
    }

    //登录界面
    public function index()
    {
        return $this->fetch();
    }

    //登录接口，ajax
    public function loginAjax($name, $password, $remember)
    {
        $this->handleRemember($remember, $name, $password);
        $manager = Manager::get($name);
        if ($manager != null) {
            if ($manager->password == $password) {
                //账号密码正确
                Session::set("isLogined","ok");
                $data = ["code" => "200"];
                return \json($data);
            } else {
                //密码错误
                Session::clear();
                $data = ["code" => "201","title" => "错误！","message" => "管理员密码错误！"];
                return \json($data);
            }
        }else{
            //管理员名错误
            Session::clear();
            $data = ["code" => "202","title" => "错误！","message" => "管理员名字不存在！"];
            return \json($data);
        }
    }

    public function outlogin(){
        Session::clear();
        $this->redirect('/manage/login');
    }
}