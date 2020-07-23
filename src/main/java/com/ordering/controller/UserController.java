package com.ordering.controller;

import com.ordering.pojo.*;
import com.ordering.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/user")
public class UserController {

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
    // 登录功能
    @RequestMapping("/login")
    public String login(Model model, HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=utf-8");
        String sId = request.getParameter("userId");
        String userPassword = request.getParameter("userPassword");
        Long userId = Long.parseLong(sId);
        User user = userService.findById(userId);
        boolean flag = LoginCheck(userId, userPassword);
        List<Dish> dishes = dishService.findAll();
        List<DishType> types = dishTypeService.findAll();
        if (flag){
            request.getSession().setAttribute("user",user);
            model.addAttribute("types",types);
            model.addAttribute("dishes",dishes);
            return "user/success";
        }else {
            response.getWriter().print("<script>alert('您的用户名或者密码有误，请重新输入！');history.go(-1);</script>");
            return null;
        }
    }

    // 检查登录信息
    public boolean LoginCheck(Long userId,String userPassword){
        User user = userService.findById(userId);
        if (user == null || "".equals(user)){
            return false;
        }
        if (user.getUserPassword().equals(userPassword)){
            return true;
        }else {
            return false;
        }
    }

    // 个人中心
    @RequestMapping("/personalCart")
    public String personalCenter(Model model,HttpServletRequest request){
        User user = (User)request.getSession().getAttribute("user");
        Long userId = user.getUserId();
        List<Order> orderList = orderService.findById(userId);
        model.addAttribute("orderList",orderList);
        return "user/PersonalCenter";
    }

    // 详情页面
    @RequestMapping(value = "/detailController")
    public String detail(Dish dish,Model model, HttpServletRequest request) throws Exception {
        model.addAttribute("dish",dish);
        return "user/detail";
    }

    // 详情页面添加购物车
    @RequestMapping(value = "/addCart")
    public ModelAndView addCart(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView model = new ModelAndView();
        String dishId = request.getParameter("dishId");
        Dish dish = dishService.findById(Integer.parseInt(dishId));
        String total = request.getParameter("total");
        String num = request.getParameter("num");
        Car car = new Car();
        car.setMoney(dish.getMoney());
        car.setDishName(dish.getDishName());
        car.setTotal(Double.parseDouble(total));
        car.setNumber(Integer.parseInt(num));
        HttpSession session = request.getSession();
        List<Car> list =(List<Car>) session.getAttribute("car");
        if (list == null){
            list = new ArrayList<Car>();
        }
        list.add(car);
        session.setAttribute("car", list);
        model.addObject("dish",dish);
        model.addObject("num",num);
        model.setViewName("/user/addToCart");
        return model;
    }

    // 进入购物车
    @RequestMapping("/shopCart")
    public ModelAndView shoppingCart(HttpServletRequest request, HttpServletResponse response){
        ModelAndView model = new ModelAndView();
        model.setViewName("/user/shoppingCart");
        return model;
    }

    // 清空session，购物车
    @RequestMapping("/delCart")
    public String delCart(HttpServletRequest request,HttpServletResponse response) throws Exception {
        response.setContentType("text/html;charset=UTF-8");
        request.getSession().removeAttribute("car");

        return "redirect:/user/shopCart";
    }

    // 结算
    @RequestMapping("/balance")
    public ModelAndView shopBalance(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ModelAndView model = new ModelAndView();
        User user = (User) request.getSession().getAttribute("user");
        Long userId = user.getUserId();
        BigDecimal totalMoney = new BigDecimal(request.getParameter("totalMoney"));
        String time = request.getParameter("time");
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd - HH:mm");
        Date date = sdf.parse(time.toString());
        BigDecimal StuMoney = user.getMoney();
        if (StuMoney.compareTo(totalMoney)==-1){
            model.addObject("errorMoney","您的余额不足");
        }else {
            HttpSession session = request.getSession();
            List<Car> list = (List)session.getAttribute("car");
            String dishList = "";
            for (Car car : list) {
                String dishName = car.getDishName();
                Dish dish = dishService.findByName(dishName);
                Integer number1 = dish.getNumber();
                Integer number = car.getNumber();
                dishService.updateNumber(number1-number,dish.getDishId());
                dishList += dishName + "*" + number + " ";
            }
            String orderingID= getOrderIdByUUId();
            Order order = new Order();
            order.setOrderId(Long.parseLong(orderingID));
            order.setUserId(userId);
            order.setDishList(dishList);
            order.setTime(date);
            order.setOrderMoney(totalMoney);
            orderService.saveOrder(order);
            model.addObject("success","订餐成功");
            request.getSession().removeAttribute("car");
        }
        model.setViewName("/user/shoppingCart");
        return model;
    }

    // 随机生成订单号
    public static String getOrderIdByUUId() {
        int first = new Random(10).nextInt(8) + 1;
        int hashCodeV = UUID.randomUUID().toString().hashCode();
        if (hashCodeV < 0) {//有可能是负数
            hashCodeV = -hashCodeV;
        }
        // 0 代表前面补充0
        // 10 代表长度为10
        // d 代表参数为正数型
        return first + String.format("%010d", hashCodeV);
    }

    // 个人中心删除订单
    @RequestMapping("/personalDel")
    public ModelAndView successOrder(HttpServletRequest request) {
        ModelAndView model = new ModelAndView();
        String id1 = request.getParameter("orderId");
        // 删除订单操作
        orderService.deleteOrder(Long.parseLong(id1));
        model.addObject("delete","删除成功");
        model.setViewName("redirect:/user/personalCart");
        return model;
    }
}