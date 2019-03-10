<?php

namespace app\manage\controller;

use think\Controller;
use app\common\model\Lecture as LectureModel;
use app\common\model\Student;
use app\manage\model\Manager;
use think\Cookie;
use think\exception\DbException;
use think\Session;

class Lecture extends Controller
{

    //检测是否登陆
    private function isLogined()
    {
        $isLogined = Session::get("isLogined");
        if ($isLogined == null || $isLogined == "") {
            //没有登录
            return false;
        }
        if ($isLogined == "ok") {
            //已经登录
            return true;
        } else {
            //没有登录
            return false;
        }
    }

    public function create()
    {
        $r = $this->isLogined();
        if (!$r) {
            //未登录
            $this->redirect('/manage/login');
            return;
        }
        //已经登录，继续更新session
        Session::set("isLogined", "ok");
        //给导航栏需要的变量赋值
        $this->assign("lecture_active", "active");
        $this->assign("lecture_create_active", "active");
        return $this->fetch();
    }

    public function createAjax($appid, $title, $detail, $max_peoples, $grade, $last_enroll_time)
    {
        try {
            $lecture = new LectureModel;
            $lecture->appid = $appid;
            $lecture->title = $title;
            $lecture->detail = $detail;
            $lecture->max_peoples = $max_peoples;
            $lecture->grade = $grade;
            $lecture->last_enroll_time = $last_enroll_time;
            $lecture->save();
        } catch (DbException $e) {
            $data = ["code" => "201", "title" => "<span style='color: #f40002'>创建讲座失败！</span>", "message" => "<span style='color: #1e5bff'>" . $e->getMessage() . "</span>"];
            return json($data);
        }
        $data = ["code" => "200", "title" => "<span style='color: #27f412'>成功！</span>", "message" => "<span style='color: #1e5bff'>创建讲座成功！</span>"];
        return json($data);
    }

    public function manage()
    {
        $r = $this->isLogined();
        if (!$r) {
            //未登录
            $this->redirect('/manage/login');
            return;
        }
        //已经登录，继续更新session
        Session::set("isLogined", "ok");
        $this->assign("lecture_active", "active");
        $this->assign("lecture_manage_active", "active");
        $lectures = LectureModel::where("delete_time", "NULL")->order('last_enroll_time', 'desc')->paginate(5);
        $page = $lectures->render();
        $this->assign("lectures", $lectures);
        $this->assign("page", $page);
        return $this->fetch();
    }

    public function deleteAjax($appid)
    {
        try {
            $lecture = LectureModel::get($appid);
            $lecture->delete();
        } catch (DbException $e) {
            $data = ["code" => "201", "title" => "<span style='color: #f40002'>删除讲座失败！</span>", "message" => "<span style='color: #1e5bff'>" . $e->getMessage() . "</span>"];
            return json($data);
        }
        $data = ["code" => "200", "title" => "<span style='color: #27f412'>成功！</span>", "message" => "<span style='color: #1e5bff'>删除讲座成功！</span>"];
        return json($data);
    }

    public function update($appid)
    {
        $r = $this->isLogined();
        if (!$r) {
            //未登录
            $this->redirect('/manage/login');
            return;
        }
        //已经登录，继续更新session
        Session::set("isLogined", "ok");
        $this->assign("lecture_active", "active");
        $this->assign("lecture_manage_active", "active");
        $lecture = LectureModel::get($appid);
        if ($lecture == null) {
            return "<div style='text-align: center;width: 100%;margin-top: 150px'><h4 style='color: #f4cd10'>该讲座不存在！</h4></div>";
        }
        $lecture->last_enroll_time = str_replace(" ", "T", $lecture->last_enroll_time);
        $this->assign("lecture", $lecture);
        return $this->fetch();
    }

    public function updateAjax($old_appid, $appid, $title, $detail, $max_peoples, $grade, $last_enroll_time)
    {
        try {
            $lecture = LectureModel::get($old_appid);
            if ($lecture == null) {
                $data = ["code" => "203", "title" => "<span style='color: #f40002'>修改讲座失败！</span>", "message" => "<span style='color: #1e5bff'>该讲座不存在！</span>"];
                return json($data);
            }
            $lecture->title = $title;
            $lecture->detail = $detail;
            $lecture->max_peoples = $max_peoples;
            $lecture->grade = $grade;
            $lecture->last_enroll_time = $last_enroll_time;
            $lecture->save();
            LectureModel::where("appid", $old_appid)->update(['appid' => $appid]);
        } catch (DbException $e) {
            $data = ["code" => "201", "title" => "<span style='color: #f40002'>修改讲座失败！</span>", "message" => "<span style='color: #1e5bff'>" . $e->getMessage() . "</span>"];
            return json($data);
        }
        $data = ["code" => "200", "title" => "<span style='color: #27f412'>成功！</span>", "message" => "<span style='color: #1e5bff'>修改讲座成功！</span>"];
        return json($data);
    }
}