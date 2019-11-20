<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<body>
	  <section>

	  <form action="${path }/member/insertMathupResume.lmc" method="post" >
                    <div class="_3zYwAF74TDGVc-8gOuOTEa">
                        <div class="MatchUpForm _1DBZ1F8aWXUpL5ry5a_nRi fixedFooter">
                            <div class="Form-header">
                                <dl class="Form-title">
                                    <dt>학교·직장등록</dt>
                                </dl>
                            </div><button class="goToMatchup" type="button">매치업 서비스 소개<i
                                    class="icon-info_icon"></i></button>
                            <div class="FormBlock _3jRGSvRhv5E53D3OVwfvlL">
                                <div class="FormBlock-content content">
                                    <div class="FormButton _3I5bkI50gryaER31Iu7b4E">
                                        <h6 class="FormButton-label">학교</h6><br><br>
                                        <input type="text" class="resume-input school_name" name="schoolName"
                 							 placeholder="학교명">
                                    </div>
                                    <div class="FormButton _3I5bkI50gryaER31Iu7b4E">
                                        <h6 class="FormButton-label">직장</h6><br><br>
                                       <input type="text" class="resume-input company_name"
                                                  name="empName"   placeholder="회사명">
                                    </div>
                                    <div class="careerPeriod"><select name="startY"
                                            class="_1_kTCsjBOT9Ngta2OjoME1 rF3b6Slzlxfm4sZnqWwbz">
                                            <option disabled="" hidden="" value="0">YYYY</option>
                                            <option value="2019">2019</option>
                                            <option value="2018">2018</option>
                                            <option value="2017">2017</option>
                                            <option value="2016">2016</option>
                                            <option value="2015">2015</option>
                                            <option value="2014">2014</option>
                                            <option value="2013">2013</option>
                                            <option value="2012">2012</option>
                                            <option value="2011">2011</option>
                                            <option value="2010">2010</option>
                                            <option value="2009">2009</option>
                                            <option value="2008">2008</option>
                                            <option value="2007">2007</option>
                                            <option value="2006">2006</option>
                                            <option value="2005">2005</option>
                                            <option value="2004">2004</option>
                                            <option value="2003">2003</option>
                                            <option value="2002">2002</option>
                                            <option value="2001">2001</option>
                                            <option value="2000">2000</option>
                                            <option value="1999">1999</option>
                                            <option value="1998">1998</option>
                                            <option value="1997">1997</option>
                                            <option value="1996">1996</option>
                                            <option value="1995">1995</option>
                                            <option value="1994">1994</option>
                                            <option value="1993">1993</option>
                                            <option value="1992">1992</option>
                                            <option value="1991">1991</option>
                                            <option value="1990">1990</option>
                                            <option value="1989">1989</option>
                                            <option value="1988">1988</option>
                                            <option value="1987">1987</option>
                                            <option value="1986">1986</option>
                                            <option value="1985">1985</option>
                                            <option value="1984">1984</option>
                                            <option value="1983">1983</option>
                                            <option value="1982">1982</option>
                                            <option value="1981">1981</option>
                                            <option value="1980">1980</option>
                                        </select><span class="monthDot">.</span><select name="startM"
                                            class="_1WABmCw3Pt5VJgOiIgOqEE _3nQ7IdTp98P0XheSOr9w-h">
                                            <option disabled="" hidden="" value="0">MM</option>
                                            <option value="01">01</option>
                                            <option value="02">02</option>
                                            <option value="03">03</option>
                                            <option value="04">04</option>
                                            <option value="05">05</option>
                                            <option value="06">06</option>
                                            <option value="07">07</option>
                                            <option value="08">08</option>
                                            <option value="09">09</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select><span class="termDash">-</span><select name="endY"
                                            class="_1_kTCsjBOT9Ngta2OjoME1 rF3b6Slzlxfm4sZnqWwbz">
                                            <option disabled="" hidden="" value="0">YYYY</option>
                                            <option value="2019">2019</option>
                                            <option value="2018">2018</option>
                                            <option value="2017">2017</option>
                                            <option value="2016">2016</option>
                                            <option value="2015">2015</option>
                                            <option value="2014">2014</option>
                                            <option value="2013">2013</option>
                                            <option value="2012">2012</option>
                                            <option value="2011">2011</option>
                                            <option value="2010">2010</option>
                                            <option value="2009">2009</option>
                                            <option value="2008">2008</option>
                                            <option value="2007">2007</option>
                                            <option value="2006">2006</option>
                                            <option value="2005">2005</option>
                                            <option value="2004">2004</option>
                                            <option value="2003">2003</option>
                                            <option value="2002">2002</option>
                                            <option value="2001">2001</option>
                                            <option value="2000">2000</option>
                                            <option value="1999">1999</option>
                                            <option value="1998">1998</option>
                                            <option value="1997">1997</option>
                                            <option value="1996">1996</option>
                                            <option value="1995">1995</option>
                                            <option value="1994">1994</option>
                                            <option value="1993">1993</option>
                                            <option value="1992">1992</option>
                                            <option value="1991">1991</option>
                                            <option value="1990">1990</option>
                                            <option value="1989">1989</option>
                                            <option value="1988">1988</option>
                                            <option value="1987">1987</option>
                                            <option value="1986">1986</option>
                                            <option value="1985">1985</option>
                                            <option value="1984">1984</option>
                                            <option value="1983">1983</option>
                                            <option value="1982">1982</option>
                                            <option value="1981">1981</option>
                                            <option value="1980">1980</option>
                                        </select><span class="monthDot">.</span><select name="endM"
                                            class="_1WABmCw3Pt5VJgOiIgOqEE _3nQ7IdTp98P0XheSOr9w-h">
                                            <option disabled="" hidden="" value="0">MM</option>
                                            <option value="01">01</option>
                                            <option value="02">02</option>
                                            <option value="03">03</option>
                                            <option value="04">04</option>
                                            <option value="05">05</option>
                                            <option value="06">06</option>
                                            <option value="07">07</option>
                                            <option value="08">08</option>
                                            <option value="09">09</option>
                                            <option value="10">10</option>
                                            <option value="11">11</option>
                                            <option value="12">12</option>
                                        </select>
                                    </div><label for="name" class="_38j9rEy1sTS0Irgb2FcmHL">
                                        <h6>간단 소개글</h6>
                                        <p>직무 내용, 경험, 목표 등을 추가해서 더욱 멋진 소개글을 작성해보세요.</p><textarea id="name" type="text"
                                          name="intro"   autocomplete="off" placeholder="안녕하세요. 10년차 웹 개발자 입니다.">
                                     		     안녕하세요. 10년차 웹 개발자 입니다.
                                          
                                          </textarea>
                                    </label>
                                </div>
                            </div>
                            <footer class="FormFooter _3MqXvmRsKlYS61B7NaqHUC fixedFooter">
                            <c:set value="${loginMember.memEmail }" var="memEmail"  />
                            <c:set value="${loginMember.memName }" var="memName"  />
                            <c:set value="${loginMember.memNo }" var="memNo"/>
                            <input type="hidden" value="${memEmail }" name="memEmail"/>
                            <input type="hidden" value="${memName }" name="memName"/>
                            <input type="hidden" value="${memNo }" name="memNo">
                                <div class="childrenWrapper"><button
                                        type="submit" >작성 완료</button></div>
                            </footer>
                        </div>
                    </div>
                  </form>
                </section>

</body>
</html>