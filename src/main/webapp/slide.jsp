<%@ page import="java.sql.*"%>
<%


// db 연결 부분
 String DB_URL = "jdbc:mariadb://localhost:3306/scentmall";

 String DB_USER = "root";

 String DB_PASSWORD= "rVd4DUrcnKSY";

 Connection conn;

 Statement stmt;
 
 ResultSet result;

 try {

      Class.forName("org.mariadb.jdbc.Driver");

      conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
      String sql = "SELECT event_name, event_content, event_startdate, event_enddate, event_banner FROM event_table";

      stmt = conn.createStatement();
      result = stmt.executeQuery(sql);
 %>
    <div class="slide_area" onmouseover="pause();" onmouseout="resume();">    
        
 <%
        while(result.next())
        {
 %>
        	<div class="mySlides fade" style="display:none;">
        	<a href="/eventview.jsp?event_number=<%=result.getString("event_number")%>">
    <img src="/event_img/<%=result.getString("event_banner")%>" style="width:100%; height:300px"></a>
  </div>
 <%
        }
        
    }catch(Exception e) {
        e.printStackTrace();
        out.println("BOARD VIEW ERROR!");
    } finally {
        try {result.close();} catch(Exception e){}
        try {stmt.close();} catch(Exception e){}
        try {conn.close();} catch(Exception e){}
    }

        
%>
</div>
<script>


var slideIndex = 0;
var fs;
var slides = document.getElementsByClassName("mySlides");
function showSlides() {
  var i;

  var dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" activedot", "");
  }
  slides[slideIndex-1].style.display = "block";
  dots[slideIndex-1].className += " activedot";
  clearTimeout(fs);
  fs = setTimeout(showSlides, 2000); // Change image every 2 seconds
  console.log(slideIndex);
}

showSlides();

function currentSlide(n) {
  clearTimeout(fs);
  slideIndex = n;
  showSlides();
  pause();
}

function pause()
{
  clearTimeout(fs);
  console.log("pause");
}

function resume()
{
  console.log("resume");
  slideIndex -= 1;
  // slideIndex +=n;
  if (slideIndex > slides.length) {slideIndex = 1;}
  if (slideIndex < 0) {slideIndex = slides.length - 1;}
  showSlides();

}


function plusSlides()
{
  // slideIndex +=n;
  // if (slideIndex > slides.length) {slideIndex = 1;}
  // if (slideIndex < 1) {slideIndex = slides.length;}
  clearTimeout(fs);
  showSlides();
  pause();
}

function minusSlides()
{
  slideIndex -= 2;
  // slideIndex +=n;
  if (slideIndex > slides.length) {slideIndex = 1;}
  if (slideIndex < 0) {slideIndex = slides.length - 1;}
  clearTimeout(fs);
  showSlides();
  pause();
}


</script>