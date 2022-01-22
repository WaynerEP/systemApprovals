<script src="{{ asset('js/app.js') }}"></script>
<script src="{{ asset('js/main.js') }}"></script>
<script src="{{ asset('js/dataTables.js') }}"></script>
<script src="{{ asset('js/dataTablesResponsive.js') }}"></script>
<script src="{{ asset('js/select2.min.js') }}"></script>
<script src="{{ asset('js/toaster.min.js') }}"></script>
<script src="{{ asset('js/jquery-ui.js') }}"></script>
<script>
    $(function() {
        'use strict';
        $('.select2, #select2-a').select2({
            minimumResultsForSearch: Infinity
        });
        // Datepicker
        $('.fc-datepicker').datepicker({
            showOtherMonths: true,
            selectOtherMonths: true,
            dateFormat: 'dd/mm/yy',
        }).datepicker("setDate", new Date());
    });
</script>
