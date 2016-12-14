var req;
var isIE;
function init() {
    //completeField = document.getElementById("searchId");
    //completeTable = document.getElementById("complete-table");
    //autoRow = document.getElementById("auto-row");
    completeTable.style.top = getElementY(document.getElementById("auto-row")) + "px";
}

function doCompletion() {
    var url = "autocomplete?action=complete&searchId=" + encodeURI(document.getElementById("searchId").value);
    req = initRequest();
    req.open("GET", url, true);
    req.onreadystatechange = callback;
    req.send(null);
}

function initRequest() {
    if (window.XMLHttpRequest) {
        if (navigator.userAgent.indexOf('MSIE') != -1) {
            isIE = true;
        }
        return new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        isIE = true;
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
}

function callback() {
    clearTable();

    if (req.readyState == 4) {
        if (req.status == 200) {
            parseMessages(req.responseXML);
        }
    }
}

function appendUser(userEmail,userName) {

    var row;
    var cell;
    var linkElement;

    if (isIE) {
        document.getElementById("complete-table").style.display = 'block';
        row = document.getElementById("complete-table").insertRow(document.getElementById("complete-table").rows.length);
        cell = row.insertCell(0);
    } else {
        document.getElementById("complete-table").style.display = 'table';
        row = document.createElement("tr");
        cell = document.createElement("td");
        row.appendChild(cell);
        document.getElementById("complete-table").appendChild(row);
    }

    cell.className = "popupCell";
    linkElement = document.createElement("a");
    linkElement.className = "popupItem";
    linkElement.setAttribute("href", "autocomplete?action=lookup&searchId=" + userEmail);
    linkElement.appendChild(document.createTextNode(userName));
    cell.appendChild(linkElement);
}

function clearTable() {
    if (document.getElementById("complete-table").getElementsByTagName("tr").length > 0) {
        document.getElementById("complete-table").style.display = 'none';
        for (loop = document.getElementById("complete-table").childNodes.length -1; loop >= 0 ; loop--) {
            document.getElementById("complete-table").removeChild(document.getElementById("complete-table").childNodes[loop]);
        }
    }
}

function getElementY(element){

    var targetTop = 0;

    if (element.offsetParent) {
        while (element.offsetParent) {
            targetTop += element.offsetTop;
            element = element.offsetParent;
        }
    } else if (element.y) {
        targetTop += element.y;
    }
    return targetTop;
}

function parseMessages(responseXML) {

    // no matches returned
    console.log(responseXML);
    if (responseXML == null) {
        return false;
    } else {

        var users = responseXML.getElementsByTagName("users")[0];

        if (users.childNodes.length > 0) {
          //  completeTable.setAttribute("bordercolor", "black");
          //  completeTable.setAttribute("border", "1");

            for (loop = 0; loop < users.childNodes.length; loop++) {
                var user = users.childNodes[loop];
                var  userEmail = user.getElementsByTagName("userEmail")[0];
                var userName = user.getElementsByTagName("userName")[0];
                appendUser(userEmail.childNodes[0].nodeValue,
                    userName.childNodes[0].nodeValue);
            }
        }
    }
}
