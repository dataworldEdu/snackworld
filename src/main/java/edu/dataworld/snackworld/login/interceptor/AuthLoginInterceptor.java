package edu.dataworld.snackworld.login.interceptor;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class AuthLoginInterceptor extends HandlerInterceptorAdapter {
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // 세션 정보 받아옴
        HttpSession session = request.getSession();

        String userId = (String) session.getAttribute("login");
        System.out.println("userId" + userId);
        if(userId == null){
            // 로그인이 안되어 있으면 로그인 폼으로 리다이렉트
            response.sendRedirect("/login/loginForm.do");
            return false;
        }

        return true;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        super.postHandle(request, response, handler, modelAndView);
    }
}
