package com.chukuobody.app.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

@RestController
@RequestMapping("/api/sendpicimgbb")
public class ImgbbRestApiController {
	
	@RequestMapping
	public String getUrlForCard(@RequestBody Map<String,String> msg){
		
		String imgstr = msg.get("image");
		//imgstr = imgstr.replace ("data:image/png;base64,", "");
		
		String url = "https://api.imgbb.com/1/upload?key=369eefb593309d26c901ff8a3b6a5c83&image="+imgstr;

		RestTemplate restTemplate = new RestTemplate();
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.setAccept(Collections.singletonList(MediaType.APPLICATION_JSON));
		
		Map<String, Object> map = new HashMap<>();
		//map.put("image", imgstr);
		//map.put("key", "IMGBB API KEY");
		
		HttpEntity<Map<String, Object>> entity = new HttpEntity<>(map, headers);
		ResponseEntity<String> response = restTemplate.postForEntity(url, entity, String.class);
		
		if (response.getStatusCode() == HttpStatus.OK) {
		    System.out.println("Request Successful");
		    System.out.println(response.getBody());
		    return response.getBody();
		} else {
		    System.out.println("Request Failed");
		    System.out.println(response.getStatusCode());
		    return response.getBody();
		}
		
		
	}
	
}
