<?php

namespace app\manage\controller;

use think\Controller;
use app\common\model\Lecture as LectureModel;
use app\common\model\Student;
use app\manage\model\Manager;
use think\Cookie;
use think\Db;
use think\exception\DbException;
use think\Request;
use think\Session;

class Info extends Controller
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

    public function add()
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
        $this->assign("info_active", "active");
        $this->assign("info_add_active", "active");
        return $this->fetch();
    }

    public function addAjax($name, $institute, $class1, $sex, $student_num, $phone_num, $account, $password, $grade, $contact)
    {
        try {
            $student = new Student;
            $student->name = $name;
            $student->institute = $institute;
            $student->class = $class1;
            $student->sex = $sex;
            $student->student_num = $student_num;
            $student->phone_num = $phone_num;
            $student->account = $account;
            $student->password = $password;
            $student->grade = $grade;
            $student->contact = $contact;
            $student->save();
        } catch (DbException $e) {
            $data = ["code" => "201", "title" => "<span style='color: #f40002'>添加信息失败！</span>", "message" => "<span style='color: #1e5bff'>" . $e->getMessage() . "</span>"];
            return json($data);
        }
        $data = ["code" => "200", "title" => "<span style='color: #27f412'>成功！</span>", "message" => "<span style='color: #1e5bff'>添加信息成功！</span>"];
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
        //给导航栏需要的变量赋值
        $this->assign("info_active", "active");
        $this->assign("info_manage_active", "active");
        $search_content = $this->request->get("search_content");
        if ($search_content != null && $search_content != "") {
            $students = Db::query("select * from student where delete_time is null and concat(student_num,name,institute,class,sex,phone_num,grade,contact,grade,appid) like '%" . $search_content . "%' order by student_num asc");
            $this->assign("students", $students);
            $count = count($students);
            $tip = "<div style='width: 100%;text-align: center'><span style='color: #14f407'>一共搜索到".$count."条信息：</span></div><br/>";
            $this->assign("tip",$tip);
            return $this->fetch();
        }
        $students = Student::where("delete_time", "NULL")->order('student_num', 'asc')->paginate(10);
        $page = $students->render();
        $this->assign("students", $students);
        $this->assign("page", $page);
        return $this->fetch();
    }

    public function deleteAjax($student_num)
    {
        try {
            $student = Student::get($student_num);
            $student->delete();
        } catch (DbException $e) {
            $data = ["code" => "201", "title" => "<span style='color: #f40002'>删除信息失败！</span>", "message" => "<span style='color: #1e5bff'>" . $e->getMessage() . "</span>"];
            return json($data);
        }
        $data = ["code" => "200", "title" => "<span style='color: #27f412'>成功！</span>", "message" => "<span style='color: #1e5bff'>删除信息成功！</span>"];
        return json($data);
    }

    public function update($student_num)
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
        $this->assign("info_active", "active");
        $this->assign("info_manage_active", "active");
        $student = Student::get($student_num);
        if ($student == null) {
            return "<div style='text-align: center;width: 100%;margin-top: 150px'><h4 style='color: #f4cd10'>该信息不存在！</h4></div>";
        }
        $this->assign("student", $student);
        return $this->fetch();
    }

    public function updateAjax($old_student_num, $name, $institute, $class1, $sex, $student_num, $phone_num, $account, $password, $grade, $contact)
    {
        try {
            $student = Student::get($old_student_num);
            if ($student == null) {
                $data = ["code" => "203", "title" => "<span style='color: #f40002'>修改信息失败！</span>", "message" => "<span style='color: #1e5bff'>该信息不存在！</span>"];
                return json($data);
            }
            $student->name = $name;
            $student->institute = $institute;
            $student->class = $class1;
            $student->sex = $sex;
            $student->phone_num = $phone_num;
            $student->account = $account;
            $student->password = $password;
            $student->grade = $grade;
            $student->contact = $contact;
            $student->save();
            Student::where("student_num", $old_student_num)->update(["student_num" => $student_num]);
        } catch (DbException $e) {
            $data = ["code" => "201", "title" => "<span style='color: #f40002'>修改信息失败！</span>", "message" => "<span style='color: #1e5bff'>" . $e->getMessage() . "</span>"];
            return json($data);
        }
        $data = ["code" => "200", "title" => "<span style='color: #27f412'>成功！</span>", "message" => "<span style='color: #1e5bff'>修改信息成功！</span>"];
        return json($data);
    }
}
