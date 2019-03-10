<?php
namespace app\common\model;

use think\Model;
use traits\model\SoftDelete;

class Lecture extends Model
{
    // 设置当前模型对应的完整数据表名称
    protected $table = 'lecture';
    protected $pk = 'appid';
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    protected $autoWriteTimestamp = 'datetime';
    // 定义时间戳字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';
}