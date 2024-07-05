/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
function validateProductAdd() {
    var form = document.forms["productAdd"];
    var name = form["name"].value;
    var quantity = form["quantity"].value;
    var price = form["price"].value;
    var describe = form["describe"].value;

    // Validate Name
    if (!/^[a-zA-Z0-9\sÀ-Ỹà-ỹẠ-Ỷạ-ỵĂ-Ắă-ắẰ-Ỳằ-ỳẠ-Ỵạ-ỵÂ-Ậâ-ậẦ-Ỷầ-ỷẠ-Ỵạ-ỵĐđĨĩƠ-ớơ-ớỠ-Ỷỡ-ỷỌ-Ựọ-ựỜ-Ỹờ-ỹỘ-Ỷộ-ỷỢ-Ựợ-ựÚú]+$/u.test(name)) {
        alert("Name can only contain letters, numbers, spaces, and Vietnamese characters.");
        return false;
    }
    if (/^\s/.test(name)) {
        alert("Name cannot have leading spaces.");
        return false;
    }
    if (/\s$/.test(name)) {
        alert("Name cannot have trailing spaces.");
        return false;
    }
    if (/\s{2,}/.test(name)) {
        alert("Name cannot contain multiple consecutive spaces.");
        return false;
    }

    // Validate Quantity
    if (quantity === "" || isNaN(quantity) || quantity <= 0) {
        alert("Quantity must be a positive number.");
        return false;
    }

    // Validate Price
    if (price === "" || isNaN(price) || price <= 0) {
        alert("Price must be a positive number.");
        return false;
    }
    if (/^\s/.test(price)) {
        alert("Price cannot have leading spaces.");
        return false;
    }
    if (/\s$/.test(price)) {
        alert("Price cannot have trailing spaces.");
        return false;
    }
    if (/\s{2,}/.test(price)) {
        alert("Price cannot contain multiple consecutive spaces.");
        return false;
    }

    // Validate Describe
    if (/^\s/.test(describe)) {
        alert("Describe cannot have leading spaces.");
        return false;
    }
    if (/\s$/.test(describe)) {
        alert("Describe cannot have trailing spaces.");
        return false;
    }
    if (/\s{2,}/.test(describe)) {
        alert("Describe cannot contain multiple consecutive spaces.");
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

    // Validate Name
    if (/^\s/.test(name)) {
        alert("Name cannot have leading spaces.");
        return false;
    }
    if (/\s$/.test(name)) {
        alert("Name cannot have trailing spaces.");
        return false;
    }
    if (/\s{2,}/.test(name)) {
        alert("Name cannot contain multiple consecutive spaces.");
        return false;
    }
    if (!/^[a-zA-Z0-9\sÀ-Ỹà-ỹẠ-Ỷạ-ỵĂ-Ắă-ắẰ-Ỳằ-ỳẠ-Ỵạ-ỵÂ-Ậâ-ậẦ-Ỷầ-ỷẠ-Ỵạ-ỵĐđĨĩƠ-ớơ-ớỠ-Ỷỡ-ỷỌ-Ựọ-ựỜ-Ỹờ-ỹỘ-Ỷộ-ỷỢ-Ựợ-ựÚú]+$/u.test(name)) {
        alert("Name can only contain letters, numbers, spaces, and Vietnamese characters.");
        return false;
    }

    // Validate Quantity
    if (quantity === "" || isNaN(quantity) || quantity <= 0) {
        alert("Quantity must be a positive number.");
        return false;
    }

    // Validate Price
    if (price === "" || isNaN(price) || price <= 0) {
        alert("Price must be a positive number.");
        return false;
    }
    if (/^\s/.test(price)) {
        alert("Price cannot have leading spaces.");
        return false;
    }
    if (/\s$/.test(price)) {
        alert("Price cannot have trailing spaces.");
        return false;
    }
    if (/\s{2,}/.test(price)) {
        alert("Price cannot contain multiple consecutive spaces.");
        return false;
    }

    // Validate Describe
    if (/^\s/.test(describe)) {
        alert("Describe cannot have leading spaces.");
        return false;
    }
    if (/\s$/.test(describe)) {
        alert("Describe cannot have trailing spaces.");
        return false;
    }
    if (/\s{2,}/.test(describe)) {
        alert("Describe cannot contain multiple consecutive spaces.");
        return false;
    }
//    if (!/^[a-zA-Z0-9\sÀ-Ỹà-ỹẠ-Ỷạ-ỵĂ-Ắă-ắẰ-Ỳằ-ỳẠ-Ỵạ-ỵÂ-Ậâ-ậẦ-Ỷầ-ỷẠ-Ỵạ-ỵĐđĨĩƠ-ớơ-ớỠ-Ỷỡ-ỷỌ-Ựọ-ựỜ-Ỹờ-ỹỘ-Ỷộ-ỷỢ-Ựợ-ựÚú]+$/u.test(describe)) {
//        alert("Describe can only contain letters, numbers, spaces, and Vietnamese characters.");
//        return false;
//    }

    // Validate Image
    if (/\s/.test(image)) {
        alert("Image cannot contain any spaces.");
        return false;
    }

    return true;
}

function validateTable() {
    var name = document.forms["addTableForm"]["name"].value;

    if (/^\s/.test(name)) {
        alert("Name cannot have leading spaces.");
        return false;
    }
    if (/\s$/.test(name)) {
        alert("Name cannot have trailing spaces.");
        return false;
    }
    if (/ {2,}/.test(name)) {
        alert("Name cannot contain multiple consecutive spaces.");
        return false;
    }
    if (!/^[a-zA-Z0-9\sÀ-Ỹà-ỹẠ-Ỷạ-ỵĂ-Ắă-ắẰ-Ỳằ-ỳẠ-Ỵạ-ỵÂ-Ậâ-ậẦ-Ỷầ-ỷẠ-Ỵạ-ỵĐđĨĩƠ-ớơ-ớỠ-Ỷỡ-ỷỌ-Ựọ-ựỜ-Ỹờ-ỹỘ-Ỷộ-ỷỢ-Ựợ-ựÚú]+$/u.test(name)) {
        alert("Name can only contain letters, numbers, spaces, and Vietnamese characters.");
        return false;
    }

    return true;
}

function validateUpdateTable() {
    var form = document.forms["tableUpdateForm"];
    var tableName = form["tableUpdate"].value;

    if (/^\s/.test(tableName)) {
        alert("Table name cannot have leading spaces.");
        return false;
    }
    if (/\s$/.test(tableName)) {
        alert("Table name cannot have trailing spaces.");
        return false;
    }

    if (/ {2,}/.test(tableName)) {
        alert("Table name cannot contain multiple consecutive spaces.");
        return false;
    }
    if (!/^[a-zA-Z0-9\sÀ-Ỹà-ỹẠ-Ỷạ-ỵĂ-Ắă-ắẰ-Ỳằ-ỳẠ-Ỵạ-ỵÂ-Ậâ-ậẦ-Ỷầ-ỷẠ-Ỵạ-ỵĐđĨĩƠ-ớơ-ớỠ-Ỷỡ-ỷỌ-Ựọ-ựỜ-Ỹờ-ỹỘ-Ỷộ-ỷỢ-Ựợ-ựÚú]+$/u.test(tableName)) {
        alert("Table name can only contain letters, numbers, spaces, and Vietnamese characters.");
        return false;
    }

    return true;
}

function validateBlog() {
    var title = document.forms["blogAdd"]["title"].value;

    if (/^\s/.test(title)) {
        alert("Title cannot have leading spaces.");
        return false;
    }
    if (/\s$/.test(title)) {
        alert("Title cannot have trailing spaces.");
        return false;
    }
    if (/ {2,}/.test(title)) {
        alert("Title cannot contain multiple consecutive spaces.");
        return false;
    }

    return true;
}

function validateBlogUpdate() {
    var form = document.forms["blogUpdate"];
    var title = form["newTitle"].value;
    var image = form["newImage"].value;
    var source = form["newSource"].value;

    if (/^\s/.test(title)) {
        alert("Title cannot have leading spaces.");
        return false;
    }
    if (/\s$/.test(title)) {
        alert("Title cannot have trailing spaces.");
        return false;
    }
    if (/ {2,}/.test(title)) {
        alert("Title cannot contain multiple consecutive spaces.");
        return false;
    }

    if (/\s/.test(image)) {
        alert("Image cannot contain any spaces.");
        return false;
    }
    if (/\s/.test(source)) {
        alert("Source cannot contain any spaces.");
        return false;
    }

    return true;
}

function validateContact() {
    var form = document.forms["Contact"];
    var name = form["name"].value;
    var title = form["title"].value;
    var phone = form["phone"].value;
    var message = form["message"].value;

    // Validate Name
    if (/^\s/.test(name)) {
        alert("Name cannot have leading spaces.");
        return false;
    }
    if (/\s$/.test(name)) {
        alert("Name cannot have trailing spaces.");
        return false;
    }
    if (/ {2,}/.test(name)) {
        alert("Name cannot contain multiple consecutive spaces.");
        return false;
    }

    // Validate Title
    if (/^\s/.test(title)) {
        alert("Title cannot have leading spaces.");
        return false;
    }
    if (/\s$/.test(title)) {
        alert("Title cannot have trailing spaces.");
        return false;
    }
    if (/ {2,}/.test(title)) {
        alert("Title cannot contain multiple consecutive spaces.");
        return false;
    }

    // Validate Phone
    if (phone === "") {
        alert("Phone number is required.");
        return false;
    }
    var phonePattern = /^(09|03|07|08|05)\d{8}$/;
    if (!phonePattern.test(phone)) {
        alert("Invalid phone number format. Please enter a valid 10-digit number.");
        return false;
    }

    // Validate Message
    if (/^\s/.test(message)) {
        alert("Message cannot have leading spaces.");
        return false;
    }
    if (/\s$/.test(message)) {
        alert("Message cannot have trailing spaces.");
        return false;
    }
    if (/ {2,}/.test(message)) {
        alert("Message cannot contain multiple consecutive spaces.");
        return false;
    }

    return true;
}

function validateContactAndSendFeedback() {
    if (validateContact()) {
        sendFeedback();
    }
    return false;
}
