<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"	import="java.util.*,java.sql.*,java.sql.Connection,charactor.*,java.sql.*"    import="com.alibaba.fastjson.JSONArray"%><%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%><html><head><meta charset="utf-8">	<script type="text/javascript" src="jquery-1.12.4.js" ></script>	<script >        function smajorShow(v){            var v1=  encodeURI(v);            $.ajax({                url:"major.jsp",                type:"get",                dataType:"json",                contentType: "application/x-www-form-urlencoded; charset=utf-8",                data: {                    "xuey":v1,                },                traditional: true,                success:function(data){                    zhye.options.length=0;                    for(var i=0;i<data.num;i++){                        zhye.options.add(new Option(data.majors[i].mname,data.majors[i].mname));                    }                },                error:function(){                    alert("error");                }            })        }	</script></head><body>	<div id="shr" align="center" style="margin-top: 50">		<div style="font-size: 24">输入学生信息</div>		<form id="myform"  method="post">			<table border="1">				<tr>					<td style="width: 100px">姓名：</td>					<td><input type="text" id="xming" name="xming" style="font-size: 24" ></td>				</tr>				<tr>					<td style="width: 100px">年龄：</td>					<td><input type="text" id="nling" name="nling" style="font-size: 24" ></td>				</tr>				<tr>					<td style="width: 100">性别：</td>					<td><input style="font-size: 24" type="radio" name="sex"						value="男" checked />男 <input style="font-size: 24" type="radio"						name="sex" value="女" />女</td>				</tr>				<tr>					<td style="width: 200">爱好：</td>					<td><input style="font-size: 24" type="checkbox" name="aih" value="健身"/>健身						<input style="font-size: 24" type="checkbox" name="aih" value="写代码"/>写代码                        <input style="font-size: 24" type="checkbox" name="aih" value="看书"/>看书                        <input style="font-size: 24" type="checkbox" name="aih" value="书法"/>书法                    </td>				</tr>                <%!String myschool;%>				<%					Class.forName("com.mysql.jdbc.Driver");					Connection c= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school?characterEncoding=UTF-8", "root",	"admin");					Statement s = c.createStatement();					int total = 0;					String sql = "select count(*) from student1";					ResultSet rs = s.executeQuery(sql);					while (rs.next()) {						total = rs.getInt(1);					}					List<Sschool> sschools = new ArrayList<Sschool>();					String sql1 = "select * from sschool1  limit ?,? ";					Connection c1= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school?characterEncoding=UTF-8", "root",	"admin");					PreparedStatement ps1 = c1.prepareStatement(sql1);							ps1.setInt(1, 0);							ps1.setInt(2, total);							ResultSet rs1 = ps1.executeQuery();							while (rs1.next()) {								Sschool sschool = new Sschool();								String scname = rs1.getString("scname");								sschool.scname = scname;								sschools.add(sschool);							}					request.setAttribute("schools", sschools);				%>				<tr>					<td style="width: 100">学院：</td>					<td><select name="xyuan" id="xyuan" onchange="smajorShow(this.options[this.options.selectedIndex].value)" style="font-size: 24">						<option value="-----------------" selected>							-----------------</option>						<c:forEach items="${schools}" var="school" varStatus="status">								<option value="${school.scname}" >										${school.scname}</option>						</c:forEach>					</select></td>				</tr>				<tr>					<td style="width: 100">专业：</td>					<td><select name="zhye" id="zhye" style="font-size: 24">							<option value="-----------------">-----------------</option>					</select></td>				</tr>			</table>			<p />			<table>				<tr>					<td><input type="button" name="add" id="add" value="添加学生信息" ></td>					<td><input type="reset" name="reset" value="重置"						style="width: 100"></td>				</tr>			</table>		</form>	</div>	<script type="text/javascript" src="jquery-1.12.4.js" ></script><script >	//新增加的数据无法删除，除非刷新？？？？？？？？为什么（数据已经加到数据库了）	//因为新增元素没有绑定事件    //onclick无效原因：js动态加载的html代码  得重新委托事件，需要用到on   // $(document).ready(function () {    $(function () {    //获得选中的爱好	//$("#add").on("click",function (){        $("#add").click(function (){            obj = document.getElementsByName("aih");            check_val = [];             for(k in obj){            if(obj[k].checked){                check_val.push(obj[k].value);}        }	$.ajax({		url:"add.jsp",	    type:"post",        dataType:"json",        data: {	    	"xming":$("#xming").val(),	    	"nling":$("#nling").val(),	    	"sex":$('input:radio:checked').val(),            "aih": check_val,	    	"xyuan":$("#xyuan").val(),            "zhye":$("#zhye").val(),	    },        traditional: true,	success:function(data){        //方法中传入的参数data为后台获取的数据        //data=$.parseJSON(data);             var tr;             tr='<tr align="center">'+'<td  style="width: 100">'				 +data.sname+'</td>'+'<td  style="width: 100">'+data.sage+'</td>'+				 '<td  style="width: 100">'+data.ssex+'</td>'+'<td  style="width: 150">'				 +data.shobby+'</td>'+'<td  style="width: 100">'+data.sschool+				 '</td>'+'<td  style="width: 100">'+data.smajor+'</td>'				 +'<td >'+"<input type=\"button\" id=\"update\" name=\"update\"  value=\"修改\">"+' '+				"<input type=\"button\" id=\"delete\" name=\"delete\"  value=\"删除\">"+'</td>'+'</tr>';        $('body').on('click','#update',function(){            updateById(data.id)        });        $('body').on('click','#delete',function(){            deleteById(data.id)        });             $("#table").append(tr);       // document.write(data.id);	},	error:function(){		    alert("error");	}	})} )})</script>	<div id="llan" align="center">		<div style="font-size: 24">学生信息浏览</div>		<table border="1" id="table">			<tr align="center">				<td style="width: 100">姓名</td>				<td style="width: 100">年龄</td>				<td style="width: 100">性别</td>				<td style="width: 100">爱好</td>				<td style="width: 100">学院</td>				<td style="width: 100">专业</td>				<td style="width: 100">修改与删除</td>			</tr>			<tr align="center">				<%				 Class.forName("com.mysql.jdbc.Driver");    Connection c2= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school?characterEncoding=UTF-8", "root",	"admin");    Statement s2 = c2.createStatement();	int total2 = 0;	String sql2 = "select count(*) from student1";	ResultSet rs2 = s2.executeQuery(sql2);	while (rs2.next()) {	total2 = rs2.getInt(1);	}	System.out.println("total:" + total2);	List<Student> students = new ArrayList<Student>();	String sql3 = "select * from student1 order by id desc limit ?,? ";    Connection c3= DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/school?characterEncoding=UTF-8", "root",	"admin");    PreparedStatement ps3 = c3.prepareStatement(sql3);			ps3.setInt(1, 0);			ps3.setInt(2, total);			ResultSet rs3 = ps3.executeQuery();			while (rs3.next()) {				Student student = new Student();				int id = rs3.getInt(1);				String sname = rs3.getString(2);				int sage = rs3.getInt(3);				String ssex = rs3.getString(4);				String shobby = rs3.getString(5);				String sschool = rs3.getString(6);				String smajor = rs3.getString(7);				student.sname = sname;	            student.sage = sage;	            student.ssex = ssex;	            student.shobby = shobby;	            student.sschool = sschool;	            student.smajor = smajor;	            student.id = id;	            students.add(student);	}    request.setAttribute("students", students);					//int total2 = new stuDAO().getTotal();					//List<Student> students = new stuDAO().list(0, total2);				//	System.out.println(students);				//	request.setAttribute("students", students);				%>				<c:forEach items="${students}" var="student" varStatus="status">					<tr align="center">						<td style="width: 100"><c:out value="${student.sname}"></c:out></td>						<td>${student.sage}</td>						<td>${student.ssex}</td>						<td>${student.shobby}</td>						<td>${student.sschool}</td>						<td>${student.smajor}</td>						<td><input type="button" id="update" name="update" 	onclick="updateById(${student.id })" value="修改">							<input 	type="button" id="delete" name="delete"	onclick="deleteById(${student.id })" value="删除">                        </td>					</tr>				</c:forEach>		</table>	</div></body><script type="text/javascript" LANGUAGE="JavaScript">function deleteById(id) {	var studentId=id;	window.location.href="student_delete.jsp?id="+studentId; }function updateById(id) {	var studentId=id;	window.location.href="student_update.jsp?id="+studentId;}</script></html>