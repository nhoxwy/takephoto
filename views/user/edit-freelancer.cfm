﻿<link rel="stylesheet" type="text/css" href="/assets/css/edit-freelancer.css">
<link href="http://fontawesome.io/assets/font-awesome/css/font-awesome.css" rel="stylesheet" media="screen">


<style type="text/css">
   body {
      color: #000000;
   }
}
</style>

<div id="edit-password-div">
   <form class="form" onsubmit="return" id="edit-password-form" method="post">
      <h3>THAY ĐỔI MẬT KHẨU</h3>
      <hr/>
      <div class="form-group col-sm-12 col-xs-12">
         <input type="password" class="form-control" id="password" name="password" placeholder="Mật khẩu cũ">
      </div>
      <div class="form-group col-sm-12 col-xs-12">
         <input type="password" class="form-control" id="new-password" name="new-password" minlength="6" placeholder="Mật khẩu mới">
      </div>
      <div class="form-group col-sm-12 col-xs-12">
         <input type="password" class="form-control" id="re-new-password" name="re-new-password" placeholder="Nhập lại mật khẩu mới">
      </div>
      <div class="form-group col-sm-12 col-xs-12">
         <hr/>
         <input type="submit" id="edit-password-formbtn" value="Cập nhật"/>
         <input type="button" id="password-cancel" value="Hủy bỏ"/>
      </div>
   </form>
</div>

<div class="container edit">
   <h3 class="about">
      <img class="img-user" src="https://www.facebook.com/images/profile/timeline/app_icons/info_24.png"/>
      <a href="#">Thông tin</a>
     <cfquery name="abc" datasource="takephoto">
        SELECT * FROM user
        WHERE (email = <cfqueryparam value="#SESSION.email#" cfsqltype="cf_sql_varchar"/>)

     </cfquery>
     <cfoutput>#abc.dateOfBirth#</cfoutput>
     <cfoutput>#abc.sex#</cfoutput>
     <cfoutput>#abc.classify#</cfoutput>
   </h3>
   <hr/>
   <div class="row">
      <div class="col-sm-2">
         <ul class="nav nav-tabs tabs-left" id="mytab" data-tabs="tabs">
            <li class="active"><a href="#overview" data-toggle="tab">Tổng quan</a></li>
            <li><a href="#date" data-toggle="tab">Lịch hẹn</a></li>
            <li><a href="#detail" data-toggle="tab">Chi tiết về bạn</a></li>
            <li><a href="#activity" data-toggle="tab">Tạo album</a></li>
         </ul>
      </div>
      <div class="col-sm-10">
         <div class="tab-content">
            <div class="tab-pane active" id="overview">
               <div class="col-sm-12 col-md-4 no-pad">
                  <div class="user-image">
                     <img src="http://3.bp.blogspot.com/-IbEOTNtCMyU/TfCAdHaAxEI/AAAAAAAAA8U/EATib38SSAM/s320/joe-mcelderry.jpg" class="img-responsive img-rounded"/>
                  </div>
                  <div class="user-i-image">
                     <i class="fa fa-camera fa-3x"></i>
                  </div>
               </div>
               <div class="col-sm-12 col-md-8">
                  <cfoutput>
                     <div class="row">
                        <h4 style="color: rgb(231,76,60);">#SESSION.lastname# #SESSION.firstname#</h4>
                        <small><cite>Ho Chi Minh City, Vietnam<i class="glyphicon glyphicon-map-marker"></i></cite></small>
                        <hr/>
                     </div>
                     <div class="row">
                        <div class="col-sm-6 col-md-6 show">
                           <i class="glyphicon glyphicon-envelope"></i>#SESSION.email#
                           <hr/>
                           <i class="glyphicon glyphicon-phone"></i>#SESSION.phone#
                           <hr/>
                           <i class="glyphicon glyphicon-gift"></i>
                           <hr/>
                           </p>
                        </div>
                        <div class="col-sm-6 col-md-6 show">
                           <i class="glyphicon glyphicon-question-sign"></i><a id="edit-password-form-div">Đổi mật khẩu?</a>
                           <hr/>
                           <i class="glyphicon glyphicon-info-sign"></i><a>Chuyển tài khoản/Xóa</a>
                           <hr/>
                           <i class="glyphicon glyphicon-pencil"></i><a href="/index.cfm/user/updateInfo">Chỉnh sửa thông tin</a>
                        </div>
                     </div>
                  </cfoutput>
               </div>
            </div>
            <div class="tab-pane" id="date">
               <div class="col-sm-6 col-md-4">
                  <img src="http://3.bp.blogspot.com/-IbEOTNtCMyU/TfCAdHaAxEI/AAAAAAAAA8U/EATib38SSAM/s320/joe-mcelderry.jpg" class="img-responsive img-rounded"/>
               </div>
               <div class="col-sm-6 col-md-8">
                  <div class="row">
                     <h4 style="color:#e74c3c;">Nguyễn Chí Linh</h4>
                     <small><cite>Ho Chi Minh City, Vietnam<i class="glyphicon glyphicon-map-marker"></i></cite></small>
                     <hr/>
                  </div>
                  <div class="row">
                     <div class="col-sm-6 col-md-6 show">
                        <a href="#"><i class="glyphicon glyphicon-envelope"></i>chilinh101@gmail.com</a>
                        <hr/>
                        <a href="#"><i class="glyphicon glyphicon-phone"></i>01673867976</a>
                        <hr/>
                        <a href="#"><i class="glyphicon glyphicon-time"></i>20 Tháng 9 2016</a>
                        <hr/>
                        </p>
                     </div>
                     <div class="col-sm-6 col-md-6 show">
                        <a href="#"><i class="glyphicon glyphicon-camera"></i>Chụp ảnh cưới</a>
                        <hr/>
                        <a href="#"><i class="glyphicon glyphicon-tree-deciduous"></i>Chụp tại Đà Lạt</a>
                        <hr/>
                        <div class="dropdown">
                           <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Trạng thái
                           <span class="caret"></span></button>
                           <ul class="dropdown-menu">
                              <li><a href="#">Chấp nhận</a></li>
                              <li><a href="#">Đang chờ</a></li>
                           </ul>
                           <a href="#"><i class="glyphicon glyphicon-trash"></i>Xóa bỏ người này?</a>
                        </div>
                     </div>
                  </div>
                  <hr/>
               </div>
               <div class="col-sm-6 col-md-4">
                  <img src="http://3.bp.blogspot.com/-IbEOTNtCMyU/TfCAdHaAxEI/AAAAAAAAA8U/EATib38SSAM/s320/joe-mcelderry.jpg" class="img-responsive img-rounded"/>
               </div>
               <div class="col-sm-6 col-md-8">
                  <div class="row">
                     <h4 style="color:#e74c3c;">Nguyễn Chí Linh</h4>
                     <small><cite>Ho Chi Minh City, Vietnam<i class="glyphicon glyphicon-map-marker"></i></cite></small>
                     <hr/>
                  </div>
                  <div class="row">
                     <div class="col-sm-6 col-md-6 show">
                        <a href="#"><i class="glyphicon glyphicon-envelope"></i>chilinh101@gmail.com</a>
                        <hr/>
                        <i class="glyphicon glyphicon-phone"></i><a href="#" class="editable">01673867976</a>
                        <hr/>
                        <a href="#"><i class="glyphicon glyphicon-time"></i>20 Tháng 9 2016</a>
                        <hr/>
                        </p>
                     </div>
                     <div class="col-sm-6 col-md-6 show">
                        <a href="#"><i class="glyphicon glyphicon-camera"></i>Chụp ảnh cưới</a>
                        <hr/>
                        <a href="#"><i class="glyphicon glyphicon-tree-deciduous"></i>Chụp tại Đà Lạt</a>
                        <hr/>
                        <div class="dropdown">
                           <button class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">Trạng thái
                           <span class="caret"></span></button>
                           <ul class="dropdown-menu">
                              <li><a href="#">Chấp nhận</a></li>
                              <li><a href="#">Đang chờ</a></li>
                           </ul>
                           <a href="#"><i class="glyphicon glyphicon-trash"></i>Xóa bỏ người này?</a>
                        </div>
                     </div>
                  </div>
                  <hr/>
               </div>
            </div>
            <div class="tab-pane" id="detail">
               <div class="col-lg-6">
                  <legend>Giới thiệu bản thân</legend>
                  <ul>
                     <li>Sample Name should be used to describe your sample appropriately. Please be as specific as possible, as this required field will be used to identify each sample. For example: normal human serum, anti-KLH serum, anti-Man9 serum, etc.</li>
                     <li>Các tên khác:</li>
                  </ul>
                  <h4>Các địa điểm hoạt động: </h4>
               </div>
               <div class="col-lg-6 skill">
                  <legend>Các chỉ số kỹ năng</legend>
                  <h5>Kỹ năng chụp</h5>
                  <div class="progress">
                     <div class="progress-bar" id="photo-skill" aria-valuenow="70" style="width:70%">70%</div>
                  </div>
                  <h5>Kỹ năng quay</h5>
                  <div class="progress">
                     <div class="progress-bar" id="film-skill" aria-valuenow="80" style="width:80%">80%</div>
                  </div>
                  <h5>Xử lý ảnh</h5>
                  <div class="progress">
                     <div class="progress-bar" id="pts-skill" aria-valuenow="40" style="width:40%">40%</div>
                  </div>
                  <h5>Xử lý video</h5>
                  <div class="progress">
                     <div class="progress-bar" id="video-skill" aria-valuenow="75" style="width:75%">75%</div>
                  </div>
               </div>
               <!-- End Skill -->
            </div>
            <div class="tab-pane" id="activity">
               <div class="row">
                  <div class="col-sm-3">
                     <input type="text" name="" class="form-control" placeholder="Tên Album">
                  </div>
                  <div class="col-sm-3 action">
                     <select class="form-control">
                        <option>Ảnh cưới</option>
						<option>Flycam</option>
						<option>Gia đình</option>
						<option>Kỷ yếu</option>
						<option>Macro</option>
						<option>Ngoại cảnh</option>
						<option>Phong cảnh</option>
						<option>Street Life</option>
						<option>Sự kiện</option>
						<option>Thể thao</option>
						<option>Thời trang</option>
						<option>Nghệ thuật</option>
                     </select>
                  </div>
                  <div class="col-sm-3">
                     <button class="btn btn-default">Đăng tải</button>
                     <button class="btn btn-default">Hủy bỏ</button>
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="image-preview">
                     <label for="image-upload" class="ssimage-label">Chọn Ảnh</label>
                     <input type="file" name="image" class="image-upload" />
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="image-preview">
                     <label for="image-upload" class="ssimage-label">Chọn Ảnh</label>
                     <input type="file" name="image" class="image-upload" />
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="image-preview">
                     <label for="image-upload" class="ssimage-label">Chọn Ảnh</label>
                     <input type="file" name="image" class="image-upload" />
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="image-preview">
                     <label for="image-upload" class="ssimage-label">Chọn Ảnh</label>
                     <input type="file" name="image" class="image-upload" />
                  </div>
               </div>
               <div class="col-sm-4">
                  <div class="image-preview">
                     <label for="image-upload" class="ssimage-label">Chọn Ảnh</label>
                     <input type="file" name="image" class="image-upload" />
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
   <h3 class="album">
      <img class="img-user" src="https://www.facebook.com/images/profile/timeline/app_icons/photos_24.png"/>
      <a href="#">Ảnh chụp</a>
   </h3>
   <hr/>
   <div class="row">
      <div class="item col-xs-12 col-sm-6 col-md-4 col-lg-4">
         <div class="thumbnail">
            <div class="caption">
               <a href="/index.cfm/user/show-image">
                  <h4 class="group inner list-group-item-heading">Tên Album</h4>
               </a>
            </div>
            <div class="cycler">
               <img class="group list-group-image img-responsive active" src="/assets/image/catelory_gallery_cuoi_hoi.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_ky_yeu.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_cuoi_hoi.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_flycam.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_gia_dinh.jpg" alt="" />
            </div>
         </div>
      </div>
      <div class="item col-xs-12 col-sm-6 col-md-4 col-lg-4">
         <div class="thumbnail">
            <div class="caption">
               <a href="/index.cfm/user/show-image">
                  <h4 class="group inner list-group-item-heading">Tên Album</h4>
               </a>
            </div>
            <div class="cycler">
               <img class="group list-group-image img-responsive active" src="/assets/image/catelory_gallery_cuoi_hoi.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_ky_yeu.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_cuoi_hoi.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_flycam.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_gia_dinh.jpg" alt="" />
            </div>
         </div>
      </div>
      <div class="item col-xs-12 col-sm-6 col-md-4 col-lg-4">
         <div class="thumbnail">
            <div class="caption">
               <a href="/index.cfm/user/show-image">
                  <h4 class="group inner list-group-item-heading">Tên Album</h4>
               </a>
            </div>
            <div class="cycler">
               <img class="group list-group-image img-responsive active" src="/assets/image/catelory_gallery_cuoi_hoi.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_ky_yeu.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_cuoi_hoi.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_flycam.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_gia_dinh.jpg" alt="" />
            </div>
         </div>
      </div>
      <div class="item col-xs-12 col-sm-6 col-md-4 col-lg-4">
         <div class="thumbnail">
            <div class="caption">
               <a href="/index.cfm/user/show-image">
                  <h4 class="group inner list-group-item-heading">Tên Album</h4>
               </a>
            </div>
            <div class="cycler">
               <img class="group list-group-image img-responsive active" src="/assets/image/catelory_gallery_cuoi_hoi.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_ky_yeu.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_cuoi_hoi.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_flycam.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_gia_dinh.jpg" alt="" />
            </div>
         </div>
      </div>
      <div class="item col-xs-12 col-sm-6 col-md-4 col-lg-4">
         <div class="thumbnail">
            <div class="caption">
               <a href="/index.cfm/user/show-image">
                  <h4 class="group inner list-group-item-heading">Tên Album</h4>
               </a>
            </div>
            <div class="cycler">
               <img class="group list-group-image img-responsive active" src="/assets/image/catelory_gallery_cuoi_hoi.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_ky_yeu.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_cuoi_hoi.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_flycam.jpg" alt="" />
               <img class="group list-group-image img-responsive" src="/assets/image/catelory_gallery_gia_dinh.jpg" alt="" />
            </div>
         </div>
      </div>
   </div>
</div>

<script src="http://code.jquery.com/jquery-1.11.1.js"></script>
<script type="text/javascript" src="/assets/js/jquery.uploadPreview.js"></script>

<script>
	function cycleImages(){
  		var $active = $('.cycler .active');
  		var $next = ($active.next().length > 0) ? $active.next() : $('.cycler img:first');
  		$next.css('z-index',2);//move the next image up the pile
  		$active.fadeOut(2000,function(){//fade out the top image
		$active.css('z-index',1).show().removeClass('active');//reset the z-index and unhide the image
      	$next.css('z-index',3).addClass('active');//make the next image the top one
  		});
	}
	$(document).ready(function(){
		 $('#mytab a').click(function (e) {
            e.preventDefault()
            $(this).tab('show');
        });
		$(".cycler>img").hover(function(){
			setTimeout('cycleImages()', 2000);
		},function(){
			return false;
		});
	    $(".user-i-image i").mouseover(function(){
	    	$(".user-image").css("opacity","0.5");
         $(".user-i-image i").css("color","#e74c3c");
	    });
	    $(".user-i-image i").mouseleave(function(){
	    	$(".user-image").css("opacity","1");
         $(".user-i-image i").css("color","#fff");
	    });
      });
       $("#edit-password-form-div").click(function(){
         $("#edit-password-div").css("display", "block");
       });
       $("#edit-password-form #password-cancel").click(function() {
         $("#edit-password-div").hide();
      })
	});
</script>