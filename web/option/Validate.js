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

    // Validate Name

    if (!/^[a-zA-Z0-9\sÀ-Ỹà-ỹẠ-Ỷạ-ỵĂ-Ắă-ắẰ-Ỳằ-ỳẠ-Ỵạ-ỵÂ-Ậâ-ậẦ-Ỷầ-ỷẠ-Ỵạ-ỵĐđĨĩƠ-ớơ-ớỠ-Ỷỡ-ỷỌ-Ựọ-ựỜ-Ỹờ-ỹỘ-Ỷộ-ỷỢ-Ựợ-ựÚú]+$/u.test(name)) {
        alert("Name can only contain letters, numbers, spaces, and Vietnamese characters");
        return false;
    }
    if (/\s{2,}/.test(name)) {
        alert("Name cannot contain multiple consecutive spaces");
        return false;
    }

    // Validate Quantity
    if (quantity === "" || isNaN(quantity) || quantity <= 0) {
        alert("Quantity must be a positive number");
        return false;
    }

    // Validate Price
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

    // Validate Describe
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

    // Validate Name

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

    // Validate Quantity
    if (quantity === "" || isNaN(quantity) || quantity <= 0) {
        alert("Quantity must be a positive number");
        return false;
    }



    // Validate Price
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

    // Validate Describe

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

