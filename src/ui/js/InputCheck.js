// JavaScript Document
//错误或提示消息
var errorMessage ;
//检查长度是否够6位
function isLengthThanSix(input)
{
    if(input.length>=6)
    {
        return true;
    }
    return false;
}
//alert (isLengthThanSix("111111"));
//检查是否为空
function isNull(input)
{
    if(input==null || input.length==0)
    {
        return true;
    }
    return false;
}
//alert (isNull(undefined));
//检查是否是合法的邮箱地址
function isEmailAddress(input)
{
     var pattern =/^([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\-|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
     var isOk = pattern.test(input);
     if(isOk)
     {
        return true;
     }
        return false;
}
//验证邮箱地址
function checkEmail(input) {
    if(isNull(input)){
        errorMessage = "请输入邮箱地址";
        return false;
    }
    if(!isEmailAddress(input)) {
        errorMessage = "请输入正确的邮箱地址"
        return false;
    }
    return true;
}
//alert(checkEmail("1193052210@qq"));
//alert(errorMessage);
//验证密码长度
function checkPassword(input)
{
    if(isNull (input))
    {
        errorMessage= "请输入密码";
        return false;
    }
    if(!isLengthThanSix(input))
    {
        errorMessage= "密码必须大于6位";
        return false;
    }
    return true;
}
//alert(checkPassword(""));
//alert(errorMessage);
function checkName(input)
{
    if(isNull(input)) {
        errorMessage = "请输入用户名";
        return false;
    }
    if(!isLengthThanSix(input)) {
        errorMessage = "用户名必须大于6位"
        return false;
    }
    return true;
}
