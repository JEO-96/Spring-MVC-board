<%--
  Created by IntelliJ IDEA.
  User: jueun-o
  Date: 2023/02/16
  Time: 11:23 AM
  To change this template use File | Settings | File Templates.
--%>
%@page import="javax.sql.DataSource"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
    response.setCharacterEncoding("UTF-8");
%>



<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

    <script type="text/javascript">
        var regId = /^[a-zA-Z][0-9a-zA-Z]{3,11}/;
        var regPw = /^[a-zA-Z0-9]{4,12}/;
        var regEmail = /^[a-zA-Z][0-9a-zA-Z]+@\w+\.\w+/;
        var regResNum = /\d{13}/;
        var regIntro = /.{10,}/;
        var regName = /[가-힣]{2,5}/;
        function checkId() {
            let objId = document.getElementById("id");
            if (!regId.test(objId.value)) {
                window.alert("아이디 형식에 맞지 않습니다. [4~12자의 영문 대문자와 숫자로 구성]");
                objId.value = "";
                return false;
            } else {
                console.log("ID통과");
                return true;
            }
        }
        function checkPw() {
            let objId = document.getElementById("id");
            let objPw1 = document.getElementById("pw");
            let objPw2 = document.getElementById("pw2");
            if (!regPw.test(objPw1.value)) {
                window.alert("비밀번호 형식에 맞지 않습니다 [4~12자의 영문 대문자와 숫자로 구성].");
            } else if (objPw1.value != objPw2.value) {
                window.alert("비밀번호가 일치하지 않습니다.");
                objPw1.value = "";
                objPw2.value = "";
                return false;
            } else if (objId.value == objPw1) {
                window.alert("아이디와 비밀번호가 일치하면 안됩니다.");
                objPw1.value = "";
                objPw2.value = "";
                return false;
            } else {
                console.log("PW통과");
                return true;
            }
        }
        function checkEmail() {
            let objEmail = document.getElementById("email");
            if (!regEmail.test(objEmail.value)) {
                window.alert("이메일 주소 형식에 맞지 않습니다.");
                objEmail.value = "";
                return false;
            } else {
                console.log("Email통과");
                return true;
            }
        }
        function checkName() {
            let objName = document.getElementById("name");
            if (!regName.test(objName.value)) {
                window.alert("이름 유효성 검사 실패");
                return false;
            } else {
                console.log("이름통과");
                return true;
            }
        }
        function checkPin() {
            var resNum = document.getElementById("pin").value;
            var sum = Number(resNum[0]) * Number(2) + Number(resNum[1]) * Number(3)
                + Number(resNum[2]) * Number(4) + Number(resNum[3]) * Number(5)
                + Number(resNum[4]) * Number(6) + Number(resNum[5]) * Number(7)
                + Number(resNum[6]) * Number(8) + Number(resNum[7]) * Number(9)
                + Number(resNum[8]) * Number(2) + Number(resNum[9]) * Number(3)
                + Number(resNum[10]) * Number(4) + Number(resNum[11])
                * Number(5);
            console.log("sum: " + sum);
            sum = sum % 11;
            sum = 11 - sum;
            if (sum > 9) {
                sum = sum % 10;
            }
            if (sum == resNum[12]) {
                console.log("주민번호 통과");
                return true;
            } else {
                return false;
            }
        }
        function checkHobby() {
            let cob_box = document.getElementsByName("hobby");
            let cob_checked = 0
            for (i = 0; i < cob_box.length; i++) {
                if (cob_box[i].checked) {
                    cob_checked++;
                }
            }
            if (cob_checked < 2) {
                alert("체크박스를 두개 이상 선택해주세요");
                return false;
            } else {
                console.log("흥미체크 통과");
                return true;
            }
        }
        function checkIntro() {
            var objIntro = document.getElementById("intro");
            if (!regIntro.test(objIntro.value)) {
                alert("10글자 이상 입력하시오");
                return false;
            } else {
                console.log("자기소개 통과");
                return true;
            }
        }
        function allCheck() {
            if (!(checkId())) {
                return false;
            } else if (!(checkPw())) {
                return false;
            } else if (!(checkEmail())) {
                return false;
            } else if (!(checkName())) {
                return false;
            } else if (!(checkPin())) {
                return false;
            } else if (!(checkHobby())) {
                return false;
            } else if (!(checkPin())) {
                return false;
            } else if (!(checkIntro())) {
                return false;
            }else {
                return true;
            }
        }
    </script>
    <script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script>
        $("#find_zipcode").click(function(){
            new daum.Postcode({
                oncomplete:function(data) {
                    jQuery("#addr").val(data.zonecode);
                }
            }).open();
        });
    </script>
    <title>회원 가입 페이지</title>
</head>
<body>
<form action="./MemberJoin.me" method="post"
      onsubmit="allCheck();">
    <table style="width: 600px; margin-left: auto; margin-right: auto"
           ; border="1px color black" border-collapse="collapse">
        <tr>
            <th bgcolor=#7777AA colspan="2">회원 기본 정보</th>
        </tr>
        <tr>
            <td bgcolor=#66AAAA><b>아이디:</b></td>
            <td><input type="text" id="id" name="id"><label>4~12자의
                영문 대소문자와 숫자로만 입력</label></td>
        </tr>
        <tr>
            <td bgcolor=#66AAAA><b>비밀번호:</b></td>
            <td><input type="password" id="pw" name="pw"><label>4~12자의
                영문 대소문자와 숫자로만 입력</label></td>
        </tr>
        <tr>
            <td bgcolor=#66AAAA><b>비밀번호확인:</b></td>
            <td><input type="password" id="pw2" name="pw2"></td>
        </tr>
        <tr>
            <td bgcolor=#66AAAA><b>메일주소:</b></td>
            <td><input type="text" id="email" name="email"><label>예)
                id@domain.com</label></td>
        </tr>
        <tr>
            <td bgcolor=#66AAAA><b>이름:</b></td>
            <td><input type="text" id="name" name="name"></td>
        </tr>
        <tr>
            <td bgcolor=#66AAAA><b>집주소:</b></td>
            <td><input type="text" id="addr" name="addr"><input type="button" id="find_zipcode" value="우편번호찾기"></td>

        </tr>
        <tr>
            <th bgcolor=#7777AA colspan="2">개인 신상 정보</th>
        </tr>
        <tr>
            <td bgcolor=#66AAAA><b>주민등록번호:</b></td>
            <td><input type="text" id="pin" name="pin"><label>예)
                1234561234567</label></td>
        </tr>
        <tr>
            <td bgcolor=#66AAAA><b>생일:</b></td>
            <td><input type="text" size="4" id="year" name="year">
                <label>년</label> <select id="month" name="month">
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
                </select> <label>월</label> <select id="day" name="day">
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
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                    <option value="21">21</option>
                    <option value="22">22</option>
                    <option value="23">23</option>
                    <option value="24">24</option>
                    <option value="25">25</option>
                    <option value="26">26</option>
                    <option value="27">27</option>
                    <option value="28">28</option>
                    <option value="29">29</option>
                    <option value="30">30</option>
                    <option value="31">31</option>
                </select> <label>일</label></td>
        </tr>
        <tr>
            <td bgcolor=#66AAAA><b>관심분야:</b></td>
            <td><input type="checkbox" name="hobby" value="computer">컴퓨터</input>
                <input type="checkbox" name="hobby" value="internet">인터넷</input>
                <input type="checkbox" name="hobby" value="travel">여행</input>
                <input type="checkbox" name="hobby" value="movie">영화감상</input>
                <input type="checkbox" name="hobby" value="music">음악감상</input>
            </td>
        </tr>
        <tr>
            <td bgcolor=#66AAAA><b>자기소개:</b></td>
            <td><textarea rows="5" id="intro" name="intro" cols="60"></textarea></td>
        </tr>
    </table>
    <p align="center">
        <br> <input type="submit" value="회원 가입"> <input
            type="reset" value="다시 입력">
    </p>
</form>
<p>
    <audio controls autoplay>
        <source src="푸르다 - 이사빛.mp3" type="audio/mpeg">
    </audio>
</p>
<script src="https://ssl.daumcdn.net/dmaps/map_js_init/postcode.v2.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
    $("#find_zipcode").click(function(){
        new daum.Postcode({
            oncomplete:function(data) {
                jQuery("#addr").val(data.zonecode);
            }
        }).open();
    });
</script>
</body>
</html>