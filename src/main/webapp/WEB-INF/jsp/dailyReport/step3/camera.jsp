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
        max-width: 80%;
        max-height: 80%;
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
        top: 10px;
        right: 15px;
        cursor: pointer;
    }
</style>

<div>
    <div class="mt10">
        <button id="cameraBtn" class="btn addBtn" type="button" onclick="handleCameraButtonClick()">사진촬영</button>
        <button class="btn addBtn" type="button" style="margin: 0px; width: 120px;" onclick="openPop()">
            운송 신규등록
        </button>
    </div>
    <div id="modal" class="modal" style="display: none;">
        <div class="modal-content">
            <span class="close" onclick="closeModal()">&times;</span>

            <img id="modalPhoto" src="" alt="Uploaded Photo" style="max-height: 80vh; width: auto;">
            <div class="modal-buttons">
                <button type="button" class="btn btn-blue" onclick="closeModal()">확인</button>
                <button type="button" class="btn btn-blue" onclick="retryCapture()">재촬영</button>

            </div>
        </div>
    </div>

    <input
            id="cameraFileInput"
            type="file"
            accept="image/*"
            capture="environment"
            style="display: none;"
    />

    <script>
        let capturedPhotoData = null;
        let modalOpen = false;

        function handleCameraButtonClick() {
            if (capturedPhotoData) {
                openModal();
                document.getElementById('cameraBtn').innerText = '사진 재촬영';
            } else {
                openNativeCamera();
            }
        }

        function openNativeCamera() {
            const input = document.getElementById("cameraFileInput");
            input.click();
        }

        function openModal() {
            if (capturedPhotoData) {
                const modalPhoto = document.getElementById('modalPhoto');
                modalPhoto.src = capturedPhotoData;
                document.getElementById('modal').style.display = 'block';
                modalOpen = true;
            }
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
                msgChange();
                if (modalOpen) {
                    closeModal();
                }
            }
        });

        function msgChange() {
            document.getElementById("picMsg").innerHTML = '사진 등록 OK!';
            document.getElementById("picMsg").classList.add("editedMsg");
            document.getElementById("modalOpenButton").style.display = 'block';
        }

    </script>