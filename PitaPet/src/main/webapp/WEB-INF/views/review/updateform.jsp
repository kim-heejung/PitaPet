<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>/views/review/private/updateform.jsp</title>
<jsp:include page="/resources/resource.jsp"></jsp:include>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/board.css" />
</head>
<body>
<div id="reviewInsert">
		<header-component :cpath="cpath" :id="id"></header-component>
		<div class="board-wrap form-wrap">
			<page-category class="adopt-review" :cpath="cpath" :index="1"></page-category>
			<div class="container">
				<form class="updateForm" action="update.do" method="post" id="insertForm" enctype="multipart/form-data">
					<input type="hidden" name="num" value="${dto.num }" />
					<div class="updateFormList">
			      		<label class="form-label">동물 분류</label>
			      		<select class="form-select" name="animalType" id="animalType">
			      			<option value="">선택</option>
				   			<option value="dog" ${dto.animalType eq 'dog' ? "selected" : "" }>dog</option>
				   			<option value="cat" ${dto.animalType eq 'cat' ? "selected" : "" }>cat</option>
						</select>
			      	</div>
					<div class="mb-3">
						<label class="form-label" for="title">제목</label>
						<input class="form-control" type="text" name="title" id="title" value="${dto.title }"/>
					</div>
					<div class="mb-3">
						<label class="form-label" for="content">내용</label>
						<textarea class="form-control" name="content" id="content">${dto.content }</textarea>
					</div>
					<div>
				        <label class="form-label" for="imgFile">첨부 이미지</label>
				        <input class="form-control" type="file" name="imgFile" id="imgFile"
				            accept=".jpg, .jpeg, .png, .JPG, .JPEG"/>
				    </div>
					<div class="formBtn btn-wrap btn-center">
			      		<button class="formBtnList btn btn-m btn-white" type="reset">취소</button>
			      		<button class="formBtnList btn btn-m btn-black" type="submit">등록</button>
			      	</div>
				</form>
			</div>
		</div>
		<footer-component></footer-component>
	</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/header.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/page_category.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/footer.js"></script>
<!-- SmartEditor 에서 필요한 javascript 로딩  -->
<script src="${pageContext.request.contextPath }/SmartEditor/js/HuskyEZCreator.js"></script>
<script>
	new Vue({
	    el : "#reviewInsert",
	    data:{
	    	cpath: "${pageContext.request.contextPath}",
			id: "${sessionScope.id}"
	    }
	});

   var oEditors = [];
   
   //추가 글꼴 목록
   //var aAdditionalFontSet = [["MS UI Gothic", "MS UI Gothic"], ["Comic Sans MS", "Comic Sans MS"],["TEST","TEST"]];
   
   nhn.husky.EZCreator.createInIFrame({
      oAppRef: oEditors,
      elPlaceHolder: "content",
      sSkinURI: "${pageContext.request.contextPath}/SmartEditor/SmartEditor2Skin.html",   
      htParams : {
         bUseToolbar : true,            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
         bUseVerticalResizer : true,      // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
         bUseModeChanger : true,         // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
         //aAdditionalFontList : aAdditionalFontSet,      // 추가 글꼴 목록
         fOnBeforeUnload : function(){
            //alert("완료!");
         }
      }, //boolean
      fOnAppLoad : function(){
         //예제 코드
         //oEditors.getById["ir1"].exec("PASTE_HTML", ["로딩이 완료된 후에 본문에 삽입되는 text입니다."]);
      },
      fCreator: "createSEditor2"
   });
   
   function pasteHTML() {
      var sHTML = "<span style='color:#FF0000;'>이미지도 같은 방식으로 삽입합니다.<\/span>";
      oEditors.getById["content"].exec("PASTE_HTML", [sHTML]);
   }
   
   function showHTML() {
      var sHTML = oEditors.getById["content"].getIR();
      alert(sHTML);
   }
      
   function submitContents(elClickedObj) {
      oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", []);   // 에디터의 내용이 textarea에 적용됩니다.
      
      // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("content").value를 이용해서 처리하면 됩니다.
      
      try {
         elClickedObj.form.submit();
      } catch(e) {}
   }
   
   function setDefaultFont() {
      var sDefaultFont = '궁서';
      var nFontSize = 24;
      oEditors.getById["content"].setDefaultFont(sDefaultFont, nFontSize);
   }
</script>
</body>
</html>






