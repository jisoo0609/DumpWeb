/* function :   */
const popup = document.getElementById('popup')

function openPop() {
    popup.style.display = 'flex';
}

function closePop() {
    popup.style.display = 'none';
}


/* function : 결재버튼을 통해서만 체크박스를 체크하거나 해제할 수 있다.  */
const dateDisplay = document.getElementById('dateDisplay');
const currentDate = document.getElementById('currentDate');
currentDate.textContent = '연도- 월- 일';

function checkBox() {
     const checkbox = document.getElementById('checkbox');
     checkbox.checked = !checkbox.checked;

     if (checkbox.checked) {
         const today = new Date();
         const year = today.getFullYear();
         const month = String(today.getMonth() + 1).padStart(2, '0');
         const day = String(today.getDate()).padStart(2, '0');
         const dateString = `${year}-${month}-${day}`;
         currentDate.textContent = year+'-'+month+'-'+day;
     } else {
         currentDate.textContent = '연도- 월- 일';
     }
}

