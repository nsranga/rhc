
// Get the Form
var retinaform = document.getElementById('new_retina');
// Get the modal
var modal = document.getElementById('myModal');
var img1 = document.getElementsByClassName("myImg1");
var modalImg = document.getElementById("img01");
var imgnum=0;

function displaymodal(i){
	imgnum=i;
    modal.style.display = "block";
    //modalImg.src = this.src;
	modalImg.src = "/assets/originals/" + i + ".jpg";
    //captionText.innerHTML = "Retina - Image - " +i;
}
var captionText = document.getElementById("caption");


var previmg = document.getElementsByClassName("img_prevbtn")[0];

previmg.onclick = function() {
	if(imgnum >2 )
		imgnum = imgnum - 1;
	else
		imgnum = 1;

	//captionText.innerHTML = "Retina - Image - " +imgnum;
	modalImg.src = "/assets/originals/" + imgnum + ".jpg";
    modal.style.display = "block";
}

var nxtimg = document.getElementsByClassName("img_nextbtn")[0];

nxtimg.onclick = function() {
	if(imgnum < 100)
		imgnum = imgnum + 1;
	else
		imgnum = 100;

	//captionText.innerHTML = "Retina - Image - " +imgnum;
	modalImg.src = "/assets/originals/" + imgnum + ".jpg";
}

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// When the user clicks on <span> (x), close the modal
span.onclick = function() {
	document.getElementById("retina_retina_base_score").value = imgnum;
    modal.style.display = "none";
		retinaform.submit();
}
