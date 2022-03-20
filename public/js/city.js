let auth_token;

function getAccessToken()
{
    $.ajax({
        type: 'get',
        url: 'https://www.universal-tutorial.com/api/getaccesstoken',
        success: (function(result){
            auth_token = result.auth_token; 
            getCountry(result.auth_token);
        }),
        error: (function(error){
            console.log(error);

        }),
        headers: {
            "Accept": "application/json",
            "api-token": "SWweZa_wUrA2MH8AFM6Pf1aJ1K3PPLkMA1feQV_-Bu4aH6z1LZ3pffpY7-eG-yEFH58",
            "user-email": "info@poshandcore.com"
        }
    })
}



//getCountry('i0vWzcRogEdlTdyiCm0k8hpOBhxjD29fCqmTJ3kaLD99VaNW4JmzJAhPxr-hu7DqqXY');