<?php
namespace app\admin\controller;

use cmf\controller\AdminBaseController;
use think\Db;

class MenuoperationController extends AdminBaseController
{
    public function index()
    {
        return $this->fetch();
    }
    /**
     * 预约中烹饪
     * @return type
     */
    public function order()
    {
//        $data=Db::name('menu_operation')->where('status',0)->paginate(8);
//        //分页显示输出
//        $page=$data->render();
//        //渲染到模板的分页样式
//        $this->assign('page', $page);
//        //模板变量赋值
//        $this->assign('result',$data);
//        return $this->fetch();
        $data=Db::name('menu_operation')->field('s1.id,s2.username,s3.title,s1.cook_time,s1.start_time,s1.temperature,s1.equipment_id,s1.`status`')
                ->where('s1.`status`',0)
                ->alias('s1')
                ->join('cook_users s2','s1.user_id=s2.id')
                ->join('cook_menu s3','s3.id=s1.menu_id')
                ->paginate(10);
        //分页显示输出
        $page=$data->render();
        //渲染到模板的分页样式
        $this->assign('page', $page);
        //模板变量赋值
        $this->assign('result',$data);
        return $this->fetch();
    }
    /**
     * 增加预约烹饪
     * @return type
     */
    public function orderadd()
    {
         $id=input('post.id');
         $data =Db::name('menu_operation')->field('s1.*,s2.username,s3.title')
                ->where(["s1.id"=>$id])
                ->alias('s1')
                ->join('cook_users s2','s1.user_id=s2.id')
                ->join('cook_menu s3','s3.id=s1.menu_id')
                ->find();
            $menu = db("menu")->select();
            $users = db('users')->select();
            $this->assign(array(
            'menu' => $menu,
            'users' => $users,
            ));
            $this->assign("data",$data);
        //判断是否是post提交数据
        if(request()->isPost())
        {
            //接收表单前端提交的数据
            $post=input('post.');
            $res=Db::name('menu_operation')->insert($post);
            if($res)
            {
                $this->success('预约烹饪添加成功!',url('menuoperation/order'));
                exit;
            }
            else 
            {
                $this->error('预约烹饪添加失败!');
                exit;
            }
        }
        return $this->fetch();
    }
    /**
     * 编辑预约烹饪
     * @return type
     */
    public function orderEdit()
    {
        $id = $this->request->param('id', 0, 'intval');
        $data =Db::name('menu_operation')->field('s1.*,s2.username,s3.title')
                ->where(["s1.id"=>$id])
                ->alias('s1')
                ->join('cook_users s2','s1.user_id=s2.id')
                ->join('cook_menu s3','s3.id=s1.menu_id')
                ->find();
        $menu = db("menu")->select();
        $users = db('users')->select();
        $this->assign(array(
            'menu' => $menu,
            'users' => $users
        ));
        $this->assign("data",$data);
        return $this->fetch();
    }
    /**
     * 编辑预约烹饪提交保存
     */
    public function orderEditPost()
    {
        $id = $this->request->param("id", 0, 'intval');
        if ($this->request->isPost()) 
        {
            $data   = $this->request->param();
            if (Db::name('menu_operation')->where(["id"=>$id])->update($data) !== false) 
            {
                $this->success("保存成功！", url('Menuoperation/order'));
                exit;
            } 
            else 
            {
                $this->error("保存失败！");
                exit;
            }     
        }
    }
    
    /**
     * 实施中烹饪
     * @return type
     */
    public function practice()
    {
         $data=Db::name('menu_operation')->field('s1.id,s2.username,s3.title,s1.cook_time,s1.start_time,s1.temperature,s1.equipment_id,s1.`status`')
                ->where('s1.`status`',1)
                ->alias('s1')
                ->join('cook_users s2','s1.user_id=s2.id')
                ->join('cook_menu s3','s3.id=s1.menu_id')
                ->paginate(10);
        //分页显示输出
        $page=$data->render();
        //渲染到模板的分页样式
        $this->assign('page', $page);
        //模板变量赋值
        $this->assign('result',$data);
        return $this->fetch();
    }
    /**
     * 编辑实施中烹饪
     * @return type
     */
    public function practiceEdit()
    {
        $id = $this->request->param('id', 0, 'intval');
        $data =Db::name('menu_operation')->field('s1.*,s2.username,s3.title')
                ->where(["s1.id"=>$id])
                ->alias('s1')
                ->join('cook_users s2','s1.user_id=s2.id')
                ->join('cook_menu s3','s3.id=s1.menu_id')
                ->find();
        $menu = db("menu")->select();
        $users = db('users')->select();
        $this->assign(array(
            'menu' => $menu,
            'users' => $users
        ));
        $this->assign("data",$data);
        return $this->fetch();
    }
    /**
     * 编辑实施中烹饪提交保存
     */
    public function practiceEditPost()
    {
        $id = $this->request->param("id", 0, 'intval');
        if ($this->request->isPost()) 
        {
            $data   = $this->request->param();
            if (Db::name('menu_operation')->where(["id"=>$id])->update($data) !== false) 
            {
                $this->success("保存成功！", url('Menuoperation/practice'));
                exit;
            } 
            else 
            {
                $this->error("保存失败！");
                exit;
            }     
        }
    }
    /**
     * 添加实施中烹饪
     * @return type
     */
    public function practiceAdd()
    {
        $id=input('post.id');
        $data =Db::name('menu_operation')->field('s1.*,s2.username,s3.title')
               ->where(["s1.id"=>$id])
               ->alias('s1')
               ->join('cook_users s2','s1.user_id=s2.id')
               ->join('cook_menu s3','s3.id=s1.menu_id')
               ->find();
        $menu = db("menu")->select();
        $users = db('users')->select();
        $this->assign(array(
            'menu' => $menu,
            'users' => $users
        ));
        $this->assign("data",$data);
        //判断是否是post提交数据
        if(request()->isPost())
        {
            //接收表单前端提交的数据
            $post=input('post.');
            $data=Db::name('menu_operation')->insert($post);
            if($data)
            {
                $this->success('实施烹饪添加成功!',url('menuoperation/practice'));
                exit;
            }
            else 
            {
                $this->error('实施烹饪添加失败!');
                exit;
            }
        }
        return $this->fetch();
    }
    /**
     * 已完成烹饪
     * @return type
     */
    public function complete()
    {
        $data=Db::name('menu_operation')->field('s1.id,s2.username,s3.title,s1.cook_time,s1.start_time,s1.temperature,s1.equipment_id,s1.`status`')
                ->where('s1.`status`',2)
                ->alias('s1')
                ->join('cook_users s2','s1.user_id=s2.id')
                ->join('cook_menu s3','s3.id=s1.menu_id')
                ->paginate(10);
        //分页显示输出
        $page=$data->render();
        //渲染到模板的分页样式
        $this->assign('page', $page);
        //模板变量赋值
        $this->assign('result',$data);
        return $this->fetch();
    }
    /**
     * 编辑已完成烹饪
     * @return type
     */
    public function completeEdit()
    {
        $id = $this->request->param('id', 0, 'intval');
        $data =Db::name('menu_operation')->field('s1.*,s2.username,s3.title')
                ->where(["s1.id"=>$id])
                ->alias('s1')
                ->join('cook_users s2','s1.user_id=s2.id')
                ->join('cook_menu s3','s3.id=s1.menu_id')
                ->find();
        $menu = db("menu")->select();
        $users = db('users')->select();
        $this->assign(array(
            'menu' => $menu,
            'users' => $users
        ));
        $this->assign("data",$data);
        return $this->fetch();
    }
    /**
     * 编辑已完成烹饪提交保存
     */
    public function completeeditEditPost()
    {
        $id = $this->request->param("id", 0, 'intval');
        if ($this->request->isPost()) 
        {
            $data   = $this->request->param();
            if (Db::name('menu_operation')->where(["id"=>$id])->update($data) !== false) 
            {
                $this->success("保存成功！", url('Menuoperation/complete'));
                exit;
            } 
            else 
            {
                $this->error("保存失败！");
                exit;
            }     
        }
    }
    /**
     * del方法是删除功能
     */
    public function del()
    {
        if(request()->isGet())
        {
            $res = Db::name('menu_operation')->where('id',input('id'))->delete();
            if($res)
            {
                return $this->success('删除成功');
            }
            else
            {
                return $this->error('删除失败');
            }
        }
    }
}




