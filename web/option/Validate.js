/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function validateProductAdd() {
    var form = document.forms["productAdd"];
    var name = form["name"].value;
    var quantity = form["quantity"].value;
    var price = form["price"].value.trim();
    var describe = form["describe"].value.trim();

    if (!/^[a-zA-Z0-9\sÀ-Ỹà-ỹẠ-Ỷạ-ỵĂ-Ắă-ắẰ-Ỳằ-ỳẠ-Ỵạ-ỵÂ-Ậâ-ậẦ-Ỷầ-ỷẠ-Ỵạ-ỵĐđĨĩƠ-ớơ-ớỠ-Ỷỡ-ỷỌ-Ựọ-ựỜ-Ỹờ-ỹỘ-Ỷộ-ỷỢ-Ựợ-ựÚú]+$/u.test(name)) {
        alert("Name can only contain letters, numbers, spaces, and Vietnamese characters");
        return false;
    }
    if (/\s{2,}/.test(name)) {
        alert("Name cannot contain multiple consecutive spaces");
        return false;
    }

    if (quantity === "" || isNaN(quantity) || quantity <= 0) {
        alert("Quantity must be a positive number");
        return false;
    }

    if (price === "" || isNaN(price) || price <= 0) {
        alert("Price must be a positive number and cannot contain any spaces");
        return false;
    }
    if (/^\s|\s$/.test(price)) {
        alert("Price cannot have leading or trailing spaces");
        return false;
    }
    if (price.split(/\s+/).length > 1) {
        alert("Price cannot contain multiple consecutive spaces");
        return false;
    }

    if (!/^[a-zA-Z0-9\sÀ-Ỹà-ỹẠ-Ỷạ-ỵĂ-Ắă-ắẰ-Ỳằ-ỳẠ-Ỵạ-ỵÂ-Ậâ-ậẦ-Ỷầ-ỷẠ-Ỵạ-ỵĐđĨĩƠ-ớơ-ớỠ-Ỷỡ-ỷỌ-Ựọ-ựỜ-Ỹờ-ỹỘ-Ỷộ-ỷỢ-Ựợ-ựÚú]+$/u.test(describe)) {
        alert("Describe can only contain letters, numbers, spaces, and Vietnamese characters");
        return false;
    }
    if (/\s{2,}/.test(describe)) {
        alert("Describe cannot contain multiple consecutive spaces");
        return false;
    }

    return true;
}

function validateProductUpdate() {
    var form = document.forms["productUpdate"];
    var name = form["name"].value;
    var quantity = form["quantity"].value;
    var price = form["price"].value;
    var describe = form["describe"].value;
    var image = form["image"].value;

    if (/ {2,}/.test(name)) {
        alert("Name cannot contain multiple consecutive spaces");
        return false;
    }
    if (!/^[a-zA-Z0-9\sÀ-Ỹà-ỹẠ-Ỷạ-ỵĂ-Ắă-ắẰ-Ỳằ-ỳẠ-Ỵạ-ỵÂ-Ậâ-ậẦ-Ỷầ-ỷẠ-Ỵạ-ỵĐđĨĩƠ-ớơ-ớỠ-Ỷỡ-ỷỌ-Ựọ-ựỜ-Ỹờ-ỹỘ-Ỷộ-ỷỢ-Ựợ-ựÚú]+$/u.test(name.trim())) {
        alert("Name can only contain letters, numbers, spaces, and Vietnamese characters");
        return false;
    }
    if (/^\s|\s$/.test(name)) {
        alert("Name cannot have leading or trailing spaces");
        return false;
    }

    if (quantity === "" || isNaN(quantity) || quantity <= 0) {
        alert("Quantity must be a positive number");
        return false;
    }

    if (price.trim() === "" || isNaN(price) || price <= 0) {
        alert("Price must be a positive number and cannot contain any spaces");
        return false;
    }
    if (/ {2,}/.test(price)) {
        alert("Price cannot contain multiple consecutive spaces");
        return false;
    }
    if (/^\s|\s$/.test(price)) {
        alert("Price cannot have leading or trailing spaces");
        return false;
    }

    if (/ {2,}/.test(describe)) {
        alert("Describe cannot contain multiple consecutive spaces");
        return false;
    }
    if (/^\s|\s$/.test(describe)) {
        alert("Describe cannot have leading or trailing spaces");
        return false;
    }

    // Validate Image
    if (/\s/.test(image)) {
        alert("Image cannot contain any spaces");
        return false;
    }

    return true;
}
function validateTable() {
    var name = document.forms["addTableForm"]["name"].value;

    if (/ {2,}/.test(name)) {
        alert("Name cannot contain multiple consecutive spaces");
        return false;
    }

    if (!/^[a-zA-Z0-9\sÀ-Ỹà-ỹẠ-Ỷạ-ỵĂ-Ắă-ắẰ-Ỳằ-ỳẠ-Ỵạ-ỵÂ-Ậâ-ậẦ-Ỷầ-ỷẠ-Ỵạ-ỵĐđĨĩƠ-ớơ-ớỠ-Ỷỡ-ỷỌ-Ựọ-ựỜ-Ỹờ-ỹỘ-Ỷộ-ỷỢ-Ựợ-ựÚú]+$/u.test(name)) {
        alert("Tên chỉ được chứa chữ cái, số, khoảng trắng, và các ký tự tiếng Việt");
        return false;
    }

    return true;
}

function validateUpdateTable() {
    var form = document.forms["tableUpdateForm"];
    var tableName = form["tableUpdate"].value;

    if (/^\s|\s$/.test(tableName)) {
        alert("Table name cannot have leading or trailing spaces");
        return false;
    }

    return true;
}
function validateBlog() {
    var title = document.forms["blogAdd"]["title"].value;

    if (/ {2,}/.test(title)) {
        alert("Title cannot contain multiple consecutive spaces");
        return false;
    }

    return true;
}
function validateBlogUpdate() {
    var form = document.forms["blogUpdate"];
    var title = form["newTitle"].value;
    var image = form["newImage"].value;
    var source = form["newSource"].value;

    if (/ {2,}/.test(title)) {
        alert("Title cannot contain multiple consecutive spaces");
        return false;
    }

    if (/\s/.test(image)) {
        alert("Image cannot contain any spaces");
        return false;
    }
    if (/\s/.test(source)) {
        alert("Source cannot contain any spaces");
        return false;
    }
    return true;
}

