package com.sist.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.*;
import com.sist.web.vo.*;

import lombok.RequiredArgsConstructor;

import com.sist.web.service.*;
@Controller
@RequiredArgsConstructor
public class RecipeController {
	private final RecipeService rService;
	
	@GetMapping("/list")
	public String main_page()
	{
		return "recipe/list";
	}
	@GetMapping("/detail")
	public String recipe_detail()
	{
		return "recipe/detail";
	}
}
