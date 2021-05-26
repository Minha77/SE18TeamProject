
<%

String ID ="root";
String PWD ="rVd4DUrcnKSY";
String Query ="jdbc:mariadb://localhost:3306/scentmall";
	Connection conn = DriverManager.getConnection(Query, ID, PWD);
    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;
    try {
        Class.forName("org.mariadb.jdbc.Driver");
        connection = DriverManager.getConnection(Query, ID, PWD);
        String sql = "SELECT event_name, event_content, event_startdate, event_enddate, event_banner FROM event_table";
        statement = connection.prepareStatement(sql);
        
        resultSet = statement.executeQuery();
 %>
    <div class="slide_area" onmouseover="pause();" onmouseout="resume();">    
        
 <%
        while(resultSet.next())
        {
 %>
        	<div class="mySlides fade" style="display:none;">
        	<a href="/eventview.jsp?event_number=<%=resultSet.getString("event_number")%>">
    <img src="/event_img/<%=resultSet.getString("event_banner")%>" style="width:100%; height:300px"></a>
  </div>
 <%
        }
        
    }catch(Exception e) {
        e.printStackTrace();
        out.println("BOARD VIEW ERROR!");
    } finally {
        try {resultSet.close();} catch(Exception e){}
        try {statement.close();} catch(Exception e){}
        try {connection.close();} catch(Exception e){}
    }
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