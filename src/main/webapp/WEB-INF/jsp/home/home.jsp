<%--
  Created by IntelliJ IDEA.
  User: 82107
  Date: 2022-04-15
  Time: 오후 5:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<script>
  var page = 1;  //페이징과 같은 방식이라고 생각하면 된다.

  $(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
    getList(page);
    page++;
  });

  $(window).scroll(function(){   //스크롤이 최하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.
    if($(window).scrollTop() >= $(document).height() - $(window).height()){
      getList(page);
      page++;
    }
  });

  function getList(page){
    $.ajax({
      type : 'POST',
      dataType : 'json',
      data : {"page" : page},
      url : '/picture/likeListMake',
      success : function(returnData) {
        //alert("ㅎㅇㅇㅇㅇ1");
        var data = returnData.rows;
        var html = "";
        var data2 = JSON.stringify(data);
        console.log(data2);
        if (page==1){ //페이지가 1일경우에만 id가 list인 html을 비운다.
          $("#list").html("");
        }
        if (returnData.startNum<=returnData.totCnt){
          if(data.length>0){
            for(const i in data){
              let pic_num = data[i].pic_num;              //댓글번호
              let pic_path = data[i].pic_path;         //파일경로
              let pic_name = data[i].pic_name;         //원본이름
              let thum_name = data[i].thum_name;           //썸내일
              let board_id = parseInt(data[i].board_id);     //글번호
              let user_id = data[i].user_id;              //글쓴이이름
              let profile_img = data[i].profile_img;        //끌쓴이프로필이미지


              html += "<div class='col-sm-6 col-md-4 col-lg-3 col-xl-3 item' data-aos='fade'>";
              html += "  <a href= ../picture/picDetail?board_id=" + board_id + ">";
              html += "     <img src = '" + pic_path + "' alt='IMage' class='img-fluid' style='width: 100%; height: 326px; margin-bottom: 20px;'>";
              html += "  </a>";
              html += "</div>";

            }
          }else{
            //데이터가 없을경우
            html += "<div><h1 style='text-align: center;'>구독한 작가가 없습니다.</h1></div>";
          }
        }
        html = html.replace(/%20/gi, " ");
        if (page==1){  //페이지가 1이 아닐경우 데이터를 붙힌다.
          $("#list").html(html);
        }else{
          let timerInterval
          Swal.fire({
            title: '파일불러오는중',
            html: '로딩중',
            timer: 300,
            timerProgressBar: true,
            didOpen: () => {
              Swal.showLoading()
              timerInterval = setInterval(() => {
                const content = Swal.getHtmlContainer()
                if (content) {
                  const b = content.querySelector('b')
                  if (b) {
                    b.textContent = Swal.getTimerLeft()
                  }
                }
              }, 50)
            },
            willClose: () => {
              clearInterval(timerInterval)
            }
          }).then((result) => {
            /* Read more about handling dismissals below */
            if (result.dismiss === Swal.DismissReason.timer) {
              console.log('I was closed by the timer')
            }
          })

          $("#list").append(html);
        }
      },error:function(e){
        if(e.status==300){
          alert("데이터를 가져오는데 실패하였습니다.");
        };
      }
    });
  }
</script>
<body>

</body>
</html>
