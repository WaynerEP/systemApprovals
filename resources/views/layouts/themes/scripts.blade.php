<!-- Scripts -->
<script src="{{ asset('js/app.js') }}"></script> 
<script src="{{ asset('assets/js/slim.js') }}"></script>
<script src="{{ asset('assets/lib/datatables/js/jquery.dataTables.js') }}"></script>
<script src="{{ asset('assets/lib/datatables-responsive/js/dataTables.responsive.js') }}"></script>
<script src="{{ asset('assets/lib/select2/js/select2.min.js') }}"></script>
<script src="{{ asset('js/toaster.js') }}"></script>
<script src="{{ asset('assets/lib/jquery-ui/js/jquery-ui.js') }}"></script>
<script>
    $(function() {
        'use strict';
        $('.select2').select2({
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
