<%--
  User: josh
  Date: 2023/02/09
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Title</title>
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
</head>
<body>
<form action="join" method="post">
    <table style="width: 600; margin-left: auto; margin-right: auto"
           ; border="1px color black" border-collapse="collapse">
        <tr>
            <th bgcolor=#7777AA colspan="2">회원 기본 정보</th>
        </tr>
        <tr>
            <td bgcolor=#66AAAA><b>아이디:</b></td>
            <td><input type="text" id="id" name="id"><label>4~12자의 영문 대소문자와
                숫자로만 입력</label></td>
        </tr>
        <tr>
            <td bgcolor=#66AAAA><b>비밀번호:</b></td>
            <td><input type="password" id="pw" name="pw1"><label>4~12자의 영문
                대소문자와 숫자로만 입력</label></td>
        </tr>
        <tr>
            <td bgcolor=#66AAAA><b>비밀번호확인:</b></td>
            <td><input type="password" id="pw2" name="pw2"></td>
        </tr>
        <tr>
            <td bgcolor=#66AAAA><b>메일주소:</b></td>
            <td><input type="text" id="email" name="email"><label>예) id@domain.com</label></td>
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
            <td><input type="text" id="resNum" name="resNum"><label>예) 1234561234567</label></td>
        </tr>
        <tr>
            <td bgcolor=#66AAAA><b>생일:</b></td>
            <td><input type="text" size="4" id="year" name="year">
                <label>년</label>
                <select	id="month" name="month">
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
                <label>월</label>
                <select id="day" name="day">
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
                </select> <label>일</label>
            </td>
        </tr>
        <tr>
            <td bgcolor=#66AAAA><b>관심분야:</b></td>
            <td>
                <input type="checkbox" name="hobby" value="computer">컴퓨터</input>
                <input type="checkbox" name="hobby" value="internet">인터넷</input>
                <input type="checkbox" name="hobby" value="travel">여행</input> <input
                    type="checkbox" name="hobby" value="movie">영화감상</input> <input
                    type="checkbox" name="hobby" value="music">음악감상</input>
            </td>
        </tr>
        <tr>
            <td bgcolor=#66AAAA><b>자기소개:</b></td>
            <td><textarea rows="5" id="aboutMe" name="aboutMe" cols="60"></textarea></td>
        </tr>
    </table>
    <p align="center">
        <br>
        <input type="submit" value="회원 가입">
        <input type="reset" value="다시 입력">
    </p>
</form>

</body>
</html>
