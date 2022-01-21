window.addEventListener('load', function () {
    var departamento = document.getElementById('departamentos');
    var provincias = document.getElementById('provincias');
    var distritos = document.getElementById('distritos');

    var extraer = this.document.getElementById('btn-extraer');
    var name = this.document.getElementById('nombres');
    var lastName = this.document.getElementById('apellidos');

    extraer.addEventListener('click', function (e) {
        let dni = document.getElementById('dni').value;
        if (dni.length == 8) {
            const token = "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6ImtwZXJlemVzcGlAZ21haWwuY29tIn0.e0H9C9yn95TQXyLjocE4bbW11RbxAmiLEbGRTwWQaeI";
            axios.get("https://dniruc.apisperu.com/api/v1/dni/" + dni + "?token=" + token).then(res => {
                if (res.data.dni) {
                    name.value = res.data.nombres;
                    lastName.value = res.data.apellidoPaterno + ' ' + res.data.apellidoMaterno;
                }
            }).catch(e => {
                console.log(e);
            });
        }
    });

    function addValuesProvincias(combobox, array) {
        combobox.innerHTML = `<option value="">Seleccione</option>`;
        array.forEach((element) => {
            combobox.innerHTML += `<option value="${element.codProvincia}">${element.provincia}</>`;
        })
    }

    function addValuesDistritos(combobox, array) {
        combobox.innerHTML = `<option value="">Seleccione</option>`;
        array.forEach((element) => {
            combobox.innerHTML += `<option value="${element.codDistrito}">${element.distrito}</>`;
        })
    }

    departamento.addEventListener('change', (e) => {
        axios.get(`/api/provincias/${e.target.value}`)
            .then(function (res) {
                provincias.innerHTML = '';
                addValuesProvincias(provincias, res.data)
            })
            .catch(function (err) {
                console.log(err);
            })
    })

    provincias.addEventListener('change', (e) => {
        axios.get(`/api/distritos/${e.target.value}`)
            .then(function (res) {
                distritos.innerHTML = '';
                addValuesDistritos(distritos, res.data)
            })
            .catch(function (err) {
                console.log(err);
            })
    })
})