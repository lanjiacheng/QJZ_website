<?php
namespace app\manage\model;

use think\Model;
use traits\model\SoftDelete;

class Manager extends Model
{
    // 设置当前模型对应的完整数据表名称
    protected $table = 'manager';
    protected $pk = 'name';
    use SoftDelete;
    protected $deleteTime = 'delete_time';
    protected $autoWriteTimestamp = 'datetime';
    // 定义时间戳字段名
    protected $createTime = 'create_time';
    protected $updateTime = 'update_time';
}