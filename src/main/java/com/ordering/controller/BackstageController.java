package com.ordering.controller;

import com.ordering.pojo.*;
import com.ordering.service.*;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;

@Controller
@RequestMapping("/backstage")
public class BackstageController {
    @Autowired
    private IUserService userService;
    @Autowired
    private IDishService dishService;
    @Autowired
    private IOrderService orderService;
    @Autowired
    private IAmountService canteenService;
    @Autowired
    private IDishTypeService dishTypeService;
    // 登陆后台
    @RequestMapping(value = "/login",method = RequestMethod.POST)
    public String CanteenLogin(HttpServletRequest request, HttpServletResponse response, Model model) throws Exception {
        response.setContentType("text/html;charset=utf-8");
        response.setCharacterEncoding("UTF-8");
        String id = request.getParameter("user");
        String pwd = request.getParameter("password");
        if (id.equals("admin")&&pwd.equals("123456")){
            return "backstage/index";
        }else {
            response.getWriter().print("<script>alert('您的用户名或者密码有误，请重新输入！');history.go(-1);</script>");
            return null;
        }
    }

    // 首页
    @RequestMapping(value = "/index")
    public String indexJsp(){
        return "/backstage/index";
    }

    // 用户管理页面
    @RequestMapping(value = "/user")
    public String userJsp(Model model){
        List<User> users = userService.findAll();
        model.addAttribute("users", users);
        return "/backstage/usersManager";
    }

    // 新建、修改用户页面
    @RequestMapping(value = "/userManager")
    @ResponseBody
    public ModelAndView userManager(HttpServletRequest request,HttpServletResponse response) throws Exception {
        ModelAndView model = new ModelAndView();
        String id = request.getParameter("userId");
        if (id!=""){
            Long userId = Long.parseLong(id);
            User user = userService.findById(userId);
            model.addObject("user", user);
        }
        model.setViewName("/backstage/updateUser");
        return model;
    }

    // 删除用户
    @RequestMapping(value = "/delUser")
    public ModelAndView deleteUser(HttpServletRequest request){
        ModelAndView model = new ModelAndView();
        String userId = request.getParameter("userId");
        userService.deleteUser(Long.parseLong(userId));
        model.addObject("success","删除成功");
        List<User> users = userService.findAll();
        model.addObject("users", users);
        model.setViewName("redirect:/backstage/user");
        return model;
    }

    // 保存用户
    @ResponseBody
    @RequestMapping(value = "/saveUser")
    public ModelAndView saveStu(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        User user = new User();
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String pwd = request.getParameter("pwd");
        String rmb = request.getParameter("rmb");
        Long userId = Long.parseLong(id);
        BigDecimal money = new BigDecimal(rmb);
        user.setUserId(userId);
        user.setUserName(name);
        user.setUserPassword(pwd);
        user.setMoney(money);
        if (userService.findById(userId)!=null){
            userService.updateUser(user);
            model.addObject("update","更新成功");
        }else {
            userService.saveUser(user);
            model.addObject("insert","添加成功");
        }
        model.setViewName("/backstage/updateUser");
        return model;
    }

    // 菜单管理页面
    @RequestMapping(value = "/menu")
    public String menuJsp(Model model){
        List<Dish> dishes = dishService.findAll();
        model.addAttribute("dishes",dishes);
        return "/backstage/menuManager";
    }

    // 新建、修改菜单页面
    @RequestMapping(value = "/menuManager")
    @ResponseBody
    public ModelAndView menuManager(HttpServletRequest request,HttpServletResponse response) throws Exception {
        ModelAndView model = new ModelAndView();
        String id = request.getParameter("dishId");
        if (id!=""){
            Integer dishId = Integer.parseInt(id);
            Dish dish = dishService.findById(dishId);
            model.addObject("dish",dish);
        }
        List<DishType> dishTypes = dishTypeService.findAll();
        model.addObject("dishTypes",dishTypes);
        model.setViewName("/backstage/updateMenu");
        return model;
    }

    // 删除菜品
    @RequestMapping(value = "/delDish")
    public ModelAndView deleteDish(HttpServletRequest request){
        ModelAndView model = new ModelAndView();
        String id = request.getParameter("dishId");
        Integer dishId = Integer.parseInt(id);
        dishService.deleteDish(dishId);
        model.addObject("success","删除成功");
        List<Dish> dishes = dishService.findAll();
        model.addObject("dishes",dishes);
        model.setViewName("redirect:/backstage/menu");
        return model;
    }

    // 保存菜品
    @ResponseBody
    @RequestMapping(value = "/saveDish",method = RequestMethod.POST)
    public ModelAndView saveDish(Dish dish, @RequestParam(value = "image",required = false)MultipartFile file, HttpServletRequest request)throws Exception{
        ModelAndView model = new ModelAndView();
        // 使用UUID给图片重命名，并去掉四个“-”
        String name = UUID.randomUUID().toString().replaceAll("-", "");
        // 获取图片名称
        String imageName = file.getOriginalFilename();
        // 获取图片扩展名
        String ext = FilenameUtils.getExtension(file.getOriginalFilename());
        // 设置图片上传路径
        String filePath = request.getSession().getServletContext().getRealPath("/resource/upload/");
        // 以绝对路径保存重命名后的图片
        file.transferTo(new File(filePath+"/"+name+"."+ext));
        dish.setImg("resource/upload/"+name+"."+ext);
        Integer dishId = dish.getDishId();
        System.out.println(dish);
        if (dishService.findById(dishId)!=null){
            dishService.updateDish(dish);
            model.addObject("update","更新成功");
        }else {
            dishService.saveDish(dish);
            model.addObject("insert","添加成功");
        }
        model.setViewName("/backstage/updateMenu");
        return model;
    }

    // 订单管理页面
    @RequestMapping(value = "/order")
    public String orderJsp(Model model){
        List<Order> orders = orderService.findAll();
        model.addAttribute("orders",orders);
        return "/backstage/orderManager";
    }

    // 完成、删除功能
    @RequestMapping("/updateOrder")
    public ModelAndView successOrder(HttpServletRequest request){
        ModelAndView model = new ModelAndView();
        String id1 = request.getParameter("orderId");
        Integer id = Integer.parseInt(request.getParameter("id"));
        Long orderId = Long.parseLong(id1);
        Order order = orderService.findByOId(orderId);
        BigDecimal orderMoney = order.getOrderMoney();
        Long userId = order.getUserId();
        User user = userService.findById(userId);
        BigDecimal money = user.getMoney();
        amount amount = canteenService.findMoney();
        BigDecimal CanMoney = amount.getAmounts();
        if (id==1){
            // 完成订单操作
            userService.updateUserMoney(money.subtract(orderMoney),userId);
            canteenService.updateMoney(CanMoney.add(orderMoney));
            orderService.deleteOrder(orderId);
            model.addObject("success","订单已完成");
        }else if (id==2){
            // 删除订单操作
            orderService.deleteOrder(orderId);
            model.addObject("delete","删除成功");
        }
        List<Order> orders = orderService.findAll();
        model.addObject("orders",orders);
        model.setViewName("/backstage/orderManager");
        return model;
    }
    // 食堂金额管理
    @RequestMapping("/amount")
    public ModelAndView canteen(HttpServletRequest request){
        ModelAndView model = new ModelAndView();
        amount amount = canteenService.findMoney();
        BigDecimal amounts = amount.getAmounts();
        model.addObject("amounts",amounts);
        model.setViewName("/backstage/amount");
        return model;
    }
}
