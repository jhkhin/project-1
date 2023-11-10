package com.example.oBootMybatis01.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class SocketController {
	@RequestMapping("/chat")
	public ModelAndView chat() {
		System.out.println("SocketController chat START");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("chatView");
		return mv;
	}
}
