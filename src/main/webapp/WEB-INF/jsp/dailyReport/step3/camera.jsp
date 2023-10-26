<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<style>
    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.7);
    }
    .modal-content {
        position: absolute;
        top: 50%;
        left: 50%;
        transform: translate(-50%, -50%);
        max-width: 300px;
        height: auto;
    }
    .modal-content img {
        width: 100%;
        height: auto;
    }
    .close {
        color: white;
        font-size: 30px;
        font-weight: bold;
        position: absolute;
        top: -45px;
        right: 0px;
        cursor: pointer;
    }

    .modal-buttons {
        display: flex;
        justify-content: space-evenly
    }
</style>

<div>
    <input type="hidden" id="imgIdx" name="imgIdx" value="0">
    <button id="cameraBtn" class="btn addBtn" type="button" style="margin: -1px 5px 0 auto; width: 100px;" onclick="handleCameraButtonClick()">전표 사진촬영</button>

    <div id="modal" class="modal" style="display: none;">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>

            <img id="modalPhoto" src="" alt="Uploaded Photo" style="height: auto;">
            <div class="modal-buttons">
                <button type="button" style="width: 150px; !important" class="btn btn-white" onclick="closeModal()">확인</button>
                <button type="button" style="width: 150px; !important" class="btn btn-blue" onclick="retryCapture()">재촬영</button>

            </div>
        </div>
    </div>

    <input
            id="cameraFileInput"
            type="file"
            name="imageFile"
            accept="image/*"
            capture="environment"
            style="display: none;"
    />

    <script>
        let capturedPhotoData = null;
        let modalOpen = false;
        let cameraBtn = document.getElementById('cameraBtn');

        if (capturedPhotoData) {
            cameraBtn.innerText = '사진 재촬영';
        }

        window.onload = function () {
            if (imgIdx > 0) {
                document.getElementById('cameraBtn').innerText = '전표사진 조회';
            }
        }


        function handleCameraButtonClick() {
            if (imgIdx > 0) {
                if (capturedPhotoData) {
                    openModalwithNewImg();
                } else {
                    openModalwithImg(imgIdx);
                }
            } else if (capturedPhotoData) {
                openModalwithNewImg();
            } else {
                openNativeCamera();
            }
        }

        function openNativeCamera() {
            const input = document.getElementById("cameraFileInput");
            input.click();
        }

        function openModalwithNewImg() {
            if (capturedPhotoData) {
                const modalPhoto = document.getElementById('modalPhoto');
                modalPhoto.src = capturedPhotoData;
                document.getElementById('modal').style.display = 'block';
                modalOpen = true;
            }
        }

        function openModalwithImg(img) {
            var imgUrl = '/common/getFile/' + img;
                const modalPhoto = document.getElementById('modalPhoto');
                modalPhoto.src = imgUrl;
                document.getElementById('modal').style.display = 'block';
                modalOpen = true;
        }

        function closeModal() {
            document.getElementById('modal').style.display = 'none';
            modalOpen = false;
        }

        function retryCapture() {
            if (modalOpen) {
                closeModal();
            }
            openNativeCamera();
        }

        document.getElementById("cameraFileInput").addEventListener("change", function () {
            const file = this.files[0];
            if (file) {
                capturedPhotoData = URL.createObjectURL(file);
                document.getElementById('cameraBtn').innerText = '사진 재촬영';
                openModalwithNewImg();
                // if (modalOpen) {
                //     closeModal();
                // }
            }
        });

    </script>
</div>