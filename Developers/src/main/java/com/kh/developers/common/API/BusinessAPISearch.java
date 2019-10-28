package com.kh.developers.common.API;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class BusinessAPISearch {
	
	private static Logger logger = LoggerFactory.getLogger(BusinessAPISearch.class);
	
	private String serviceKey="%2BIwBasfiSX0sfO5Y1pYCVuWq7Krc0pN2Gr63%2BvBtY7rlKvPePOslkdMXgnn1MckM0kPGHEizZKvvC1MauClhdQ%3D%3D";
	private String apiURL="http://apis.data.go.kr/B552015/NpsBplcInfoInqireService/getBassInfoSearch?serviceKey=";
	public String businessSearch(String input) {
		System.out.println("이름: "+input);
		StringBuffer response=null;
		try {
			String type="&wkpl_nm=";
			String text=URLEncoder.encode(input,"UTF-8");
			String sendApiURL=apiURL+serviceKey+type+text;
			logger.debug("URL주소 : "+sendApiURL);
			URL url=new URL(sendApiURL);
			HttpURLConnection con= (HttpURLConnection)url.openConnection();
			con.setRequestMethod("GET");
//			con.setRequestProperty("serverKey", serviceKey);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
		}catch (Exception e) {
			logger.debug(""+e);
		}
		return response.toString();
	}
}
