window.addEventListener('load', function() {
    var departamento = document.getElementById('departamentos');
    var provincias = document.getElementById('provincias');
    var distritos = document.getElementById('distritos');

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
            .then(function(res) {
                provincias.innerHTML = '';
                addValuesProvincias(provincias, res.data)
            })
            .catch(function(err) {
                console.log(err);
            })
    })

    provincias.addEventListener('change', (e) => {
        axios.get(`/api/distritos/${e.target.value}`)
            .then(function(res) {
                distritos.innerHTML = '';
                addValuesDistritos(distritos, res.data)
            })
            .catch(function(err) {
                console.log(err);
            })
    })
})